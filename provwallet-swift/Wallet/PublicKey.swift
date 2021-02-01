//
//  PublicKey.swift
//
//  Created by Pavlo Boiko on 10/4/18.
//  Copyright © 2018 Essentia. All rights reserved.
//
//  Adapted for Provenance on 2021/01/31
//  by jdfigure
//

import Foundation

public struct PublicKey {
	public let compressedPublicKey: Data
	public let uncompressedPublicKey: Data
	public let coin: Coin

	public init(privateKey: Data, coin: Coin) {
		compressedPublicKey = Crypto.generatePublicKey(data: privateKey, compressed: true)
		uncompressedPublicKey = Crypto.generatePublicKey(data: privateKey, compressed: false)
		self.coin = coin
	}

	public init(base58: Data, coin: Coin) {
		let publickKey = Base58.encode(base58)
		compressedPublicKey = Data(hex: publickKey)
		uncompressedPublicKey = Data(hex: publickKey)
		self.coin = coin
	}

	// NOTE: https://github.com/bitcoin/bips/blob/master/bip-0013.mediawiki
	public var address: String {
		switch coin {
			case .mainnet:
				return generateAddress(prefix: "pb")
			case .testnet:
				return generateAddress(prefix: "tp")
		}
	}

	func generateAddress(prefix: String) -> String {
		let payload = RIPEMD160.hash(compressedPublicKey.sha256())
		return Bech32.encode(payload, prefix: prefix, seperator: "1")
	}

	public func get() -> String {
		compressedPublicKey.toHexString()
	}

	public var data: Data {
		Data(hex: get())
	}
}
