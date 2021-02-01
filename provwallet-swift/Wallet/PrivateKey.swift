//
//  PrivateKey.swift
//
//  Created by Pavlo Boiko on 10/4/18.
//  Copyright © 2018 Essentia. All rights reserved.
//
//  Adapted for Provenance on 2021/01/31
//  by jdfigure
//

import Foundation
import CryptoKit

enum PrivateKeyType {
    case hd
    case nonHd
}

struct KeyTypeVersions: DataConvertable {
    let rawValue: UInt32
    static let xprv = KeyTypeVersions(rawValue: CFSwapInt32HostToBig(0x0488ADE4))
    static let tprv = KeyTypeVersions(rawValue: CFSwapInt32HostToBig(0x04358394))
    static let xpub = KeyTypeVersions(rawValue: CFSwapInt32HostToBig(0x0488B21E))
    static let tpub = KeyTypeVersions(rawValue: CFSwapInt32HostToBig(0x043587CF))
}

public struct PrivateKey {
    public static let EXTENDED_KEY_SIZE: Int = 78
    public static let CHECKSUM_SIZE = 4
    public let raw: Data
    public let chainCode: Data
    public let index: UInt32
    public let coin: Coin
    public let depth: UInt8
    public let parentFingerPrint: UInt32
    private var keyType: PrivateKeyType

    public init(seed: Data, coin: Coin) {
        let output = Crypto.HMACSHA512(key: "Bitcoin seed".data(using: .ascii)!, data: seed)
        raw = output[0..<32]
        chainCode = output[32..<64]
        index = 0
        self.coin = coin
        depth = 0
        parentFingerPrint = 0
        keyType = .hd
    }

    public init?(pk: String, coin: Coin) {
        raw = Data(hex: pk)
        chainCode = Data(capacity: 32)
        index = 0
        self.coin = coin
        depth = 0
        parentFingerPrint = 0
        keyType = .nonHd
    }

    public init(bip32Serialized: String) throws  {
        let data = try PrivateKey.decode(bip32Serialized: bip32Serialized)

        let keyType: Coin = try PrivateKey.coinKeyType(base58Decoded: data)
        let keyVersionBytes: UInt32 = data.subdata(in: 0..<4).to(type: UInt32.self)

        let isPrivateKey: Bool = keyVersionBytes == KeyTypeVersions.xprv.rawValue ||
                keyVersionBytes == KeyTypeVersions.tprv.rawValue
        if(!isPrivateKey) {
            //TODO fix this, should be able to import pub key?
            throw ProvenanceWalletError.ConvertError.failedToConvert("only private key supported")

        }
        let depth = data.subdata(in: 4..<5).to(type: UInt8.self)
        let parentFingerPrint = data.subdata(in: 5..<9).to(type: UInt32.self)
        let index = data.subdata(in: 9..<13).to(type: UInt32.self)
        let chainCode = data.subdata(in: 13..<45)
        //TODO copy this to the public key to deserialize xpub/tpub there?
        let privateKey = data.subdata(in: 46..<78)

        //let checksum = data.subdata(in: 78..<82)

        self.init(privateKey: privateKey, chainCode: chainCode, index: index, coin: keyType, depth: depth, parentFingerPrint: parentFingerPrint)
    }

    private init(privateKey: Data, chainCode: Data, index: UInt32, coin: Coin, depth: UInt8 = 0, parentFingerPrint: UInt32 = 0) {
        raw = privateKey
        self.chainCode = chainCode
        self.index = index
        self.coin = coin
        keyType = .hd
        self.parentFingerPrint = parentFingerPrint
        self.depth = depth
    }

    private static func decode(bip32Serialized: String) throws -> Data {
        guard let data = Base58.decode(bip32Serialized) else {
            throw ProvenanceWalletError.ConvertError.failedToConvert("could not decode")
        }
        if(data.count != (PrivateKey.EXTENDED_KEY_SIZE + PrivateKey.CHECKSUM_SIZE)) {
            throw ProvenanceWalletError.ConvertError.failedToConvert("invalid key size must be \(PrivateKey.EXTENDED_KEY_SIZE + PrivateKey.CHECKSUM_SIZE)")
        }
        return data
    }

    private static func coinKeyType(base58Decoded: Data) throws -> Coin {
        let keyType: Coin
        let keyVersionBytes: UInt32 = base58Decoded.subdata(in: 0..<4).to(type: UInt32.self)
        if (keyVersionBytes == KeyTypeVersions.xprv.rawValue || keyVersionBytes == KeyTypeVersions.xpub.rawValue) {
            keyType = Coin.mainnet
        } else if (keyVersionBytes == KeyTypeVersions.tprv.rawValue || keyVersionBytes == KeyTypeVersions.tpub.rawValue) {
            keyType = Coin.testnet
        } else {
            throw ProvenanceWalletError.ConvertError.failedToConvert("invalid version bytes for extended key")
        }
        return keyType
    }

    public var publicKey: PublicKey {
        PublicKey(privateKey: raw, coin: coin)
    }

    public func get() -> String {
        raw.toHexString()
    }

    public func derived(at node:DerivationNode) -> PrivateKey {
        guard keyType == .hd else { fatalError("Invalid key type - must be hd") }
        let edge: UInt32 = 0x80000000 // BIP 44 hardening flag
        guard (edge & node.index) == 0 else { fatalError("Invalid child index") }

        var data = Data()
        switch node {
        case .hardened:
            data += UInt8(0)
            data += raw
        case .notHardened:
            data += Crypto.generatePublicKey(data: raw, compressed: true)
        }

        let derivingIndex = CFSwapInt32BigToHost(node.hardens ? (edge | node.index) : node.index)
        data += derivingIndex

        let digest = Crypto.HMACSHA512(key: chainCode, data: data)
        let factor = BInt(data: digest[0..<32])

        let curveOrder = BInt(hex: "FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEBAAEDCE6AF48A03BBFD25E8CD0364141")!
        let derivedPrivateKey = ((BInt(data: raw) + factor) % curveOrder).data
        let derivedChainCode = digest[32..<64]
        return PrivateKey(
            privateKey: derivedPrivateKey,
            chainCode: derivedChainCode,
            index: derivingIndex,
            coin: coin,
            depth: depth + 1,
            parentFingerPrint: computeFingerPrint()
        )
    }

    public func sign(data: Data) throws -> Data {
        try Crypto.sign(data, privateKey: raw)
    }

    public func sign(text: String) throws -> Data {
        try Crypto.sign(SHA256.hash(data: text.data(using: .utf8)!).data, privateKey: raw)
    }

    public func computeFingerPrint() -> UInt32 {
        let publicKeyHash = RIPEMD160.hash(publicKey.compressedPublicKey.sha256())
        var fingerPrint = UInt32(0)
        for i in 0...3 {
            fingerPrint = fingerPrint << 8
            fingerPrint = (fingerPrint | (UInt32(publicKeyHash[i]) & 0xFF))
        }
        return CFSwapInt32HostToBig(fingerPrint)
    }

    public func serialize(publicKeyOnly: Bool = true) throws -> String {
        var out = Data(capacity: PrivateKey.EXTENDED_KEY_SIZE)

        if(coin == .mainnet) {
            if(publicKeyOnly) {
                out += KeyTypeVersions.xpub.rawValue             //0..<4
            } else {
                out += KeyTypeVersions.xprv.rawValue
            }
        } else {
            if(publicKeyOnly) {
                out += KeyTypeVersions.tpub.rawValue
            } else {
                out += KeyTypeVersions.tprv.rawValue
            }
        }
        out += depth              //depth  4..<5
        out += parentFingerPrint  //parent fingerprint 5..<9
        out += index              //sequence/index     9..<13
        out += chainCode               //chaincode 13..<35
        if(publicKeyOnly) {
            out += publicKey.compressedPublicKey
        } else {
            out += UInt8(0)
            out += raw
        }
        let checksum = out.sha256().sha256().subdata(in: 0..<PrivateKey.CHECKSUM_SIZE)
        out += checksum
        if(out.count != (PrivateKey.EXTENDED_KEY_SIZE + PrivateKey.CHECKSUM_SIZE)) { throw ProvenanceWalletError.ConvertError.failedToConvert(out)}

        return Base58.encode(out)
    }

}

