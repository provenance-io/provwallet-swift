//
//  Crypto.swift
//
//  Created by yuzushioh on 2018/02/06.
//  Copyright © 2018 yuzushioh. All rights reserved.
//
//  Adapted for Provenance on 2021/01/31
//  by jdfigure
//

import CryptoSwift

public final class Crypto {
   public static func HMACSHA512(key: Data, data: Data) -> Data {
        let output: [UInt8]
        do {
            output = try HMAC(key: key.bytes, variant: .sha512).authenticate(data.bytes)
        } catch let error {
            fatalError("Error occurred. Description: \(error.localizedDescription)")
        }
        return Data(output)
    }

    public static func PBKDF2SHA512(password: [UInt8], salt: [UInt8]) -> Data {
        let output: [UInt8]
        do {
            output = try PKCS5.PBKDF2(password: password, salt: salt, iterations: 2048, variant: .sha512).calculate()
        } catch let error {
            fatalError("PKCS5.PBKDF2 failed: \(error.localizedDescription)")
        }
        return Data(output)
    }

    public static func generatePublicKey(data: Data, compressed: Bool) -> Data {
        let encryptor = EllipticCurveEncrypterSecp256k1()
        var publicKey = encryptor.createPublicKey(privateKey: data)
        return encryptor.export(publicKey: &publicKey, compressed: compressed)
    }

    public static func sha3keccak256(data:Data) -> Data {
        Data(SHA3(variant: .keccak256).calculate(for: data.bytes))
    }

    public static func hashSHA3_256(_ data: Data) -> Data {
        Data(CryptoSwift.SHA3(variant: .sha256).calculate(for: data.bytes))
    }

    public static func sign(_ hash: Data, privateKey: Data) throws -> Data {
        let encrypter = EllipticCurveEncrypterSecp256k1()
        guard var signatureInInternalFormat = encrypter.sign(hash: hash, privateKey: privateKey) else {
            throw ProvenanceWalletError.failedToSign
        }
        return encrypter.export(signature: &signatureInInternalFormat)
    }

    public static func verify(_ signature: Data, hash: Data, publicKey: Data) throws -> Bool {
        let encrypter = EllipticCurveEncrypterSecp256k1()
        var recoveredSig = encrypter.import(signature: signature)
        return encrypter.publicKey(signature: &recoveredSig, hash: hash) != nil
    }

}

// MARK: SHA256 of SHA256
extension Data {
    var doubleSHA256: Data {
        sha256().sha256()
    }
}

