import XCTest
@testable import provwallet_swift

class ImportExportWalletTests: XCTestCase {

	func testSerializePrivateKey() {
		let entropy = Data(hex: "000102030405060708090a0b0c0d0e0f")
		let mnemonic = Mnemonic.create(entropy: entropy)
		let seed = Mnemonic.createSeed(mnemonic: mnemonic)
		let privateKey = PrivateKey(seed: seed, coin: .mainnet)

		XCTAssertEqual(privateKey.get(), "c95cfacbafcd5f00187eac74a10f48e8a77d2efe477ae6cb84322ffb28546352")
		XCTAssertEqual(privateKey.publicKey.address, "pb1qhgz0f092ll0krpm3wqwnam4qknwaj4qukvapt")
		XCTAssertEqual(try privateKey.serialize(publicKeyOnly: false),
		               "xprv9s21ZrQH143K2XojduRLQnU8D8K59KSBoMuQKGx8dW3NBitFDMkYGiJPwZdanjZonM7eXvcEbxwuGf3RdkCyyXjsbHSkwtLnJcsZ9US42Gd")
		XCTAssertEqual(try privateKey.serialize(publicKeyOnly: true),
		              "xpub661MyMwAqRbcF1tCjvxLmvQrmA9ZYnA3Aaq17fMkBqaM4XDPku4npWcsnrBiXdWRkCb9JhHgWoqBPLnY9XGrig4oCSTRgATzKcR9hSnhChS")
	}

	func testImportBip32Address() throws {
		let privateKey = try PrivateKey(bip32Serialized: "xprv9s21ZrQH143K2XojduRLQnU8D8K59KSBoMuQKGx8dW3NBitFDMkYGiJPwZdanjZonM7eXvcEbxwuGf3RdkCyyXjsbHSkwtLnJcsZ9US42Gd")

		XCTAssertEqual(privateKey.get(), "c95cfacbafcd5f00187eac74a10f48e8a77d2efe477ae6cb84322ffb28546352")
		XCTAssertEqual(privateKey.publicKey.address, "pb1qhgz0f092ll0krpm3wqwnam4qknwaj4qukvapt")
		XCTAssertEqual(try privateKey.serialize(publicKeyOnly: false),
		               "xprv9s21ZrQH143K2XojduRLQnU8D8K59KSBoMuQKGx8dW3NBitFDMkYGiJPwZdanjZonM7eXvcEbxwuGf3RdkCyyXjsbHSkwtLnJcsZ9US42Gd")
		XCTAssertEqual(try privateKey.serialize(publicKeyOnly: true),
		               "xpub661MyMwAqRbcF1tCjvxLmvQrmA9ZYnA3Aaq17fMkBqaM4XDPku4npWcsnrBiXdWRkCb9JhHgWoqBPLnY9XGrig4oCSTRgATzKcR9hSnhChS")

	}
	func testImportBip32Account() throws {
		//effective path "m/44'/505'/0'/0/0"
		let privateKey = try PrivateKey(bip32Serialized: "xprvA33u4LoDWkxUWWhAKR6Fbc3eUErMY9QL1SvFHyDv88Ld8SDyanC6LsVmSJQffeKM6ascmjHvkt5jeZqXvFkfPksD4NVzSdBmB43ev6QGj28")

		XCTAssertEqual(privateKey.get(), "7e6383ccf10f8943bac6a6666c0e09ab70e21d3e21d0ddf142e942a779734b4b")
		XCTAssertEqual(privateKey.publicKey.address, "pb18vgc2p3l3xz5meqgtl5qgagsgx83ymh0l4qjmj")
		XCTAssertEqual(try privateKey.serialize(publicKeyOnly: false),
		               "xprvA33u4LoDWkxUWWhAKR6Fbc3eUErMY9QL1SvFHyDv88Ld8SDyanC6LsVmSJQffeKM6ascmjHvkt5jeZqXvFkfPksD4NVzSdBmB43ev6QGj28")
		XCTAssertEqual(try privateKey.serialize(publicKeyOnly: true),
		               "xpub6G3FTrL7M8WmizmdRSdFxjzP2Ggqwc8BNfqr6MdXgTsc1EZ88KWLtfpFHahUWmMS6iDHNaSGCqXJLxhinmYd4g1YBd9GzaNDShmRfTLW2Bt")

	}

	func testExportWallet() throws {
		let entropy = Data(hex: "000102030405060708090a0b0c0d0e0f")
		let mnemonic = Mnemonic.create(entropy: entropy)
		let seed = Mnemonic.createSeed(mnemonic: mnemonic)
		let wallet = Wallet.init(seed: seed, coin: .mainnet)

		let bip32 = try wallet.privateKey.serialize(publicKeyOnly: false)
		XCTAssertEqual(bip32,
		               "xprv9s21ZrQH143K2XojduRLQnU8D8K59KSBoMuQKGx8dW3NBitFDMkYGiJPwZdanjZonM7eXvcEbxwuGf3RdkCyyXjsbHSkwtLnJcsZ9US42Gd")
	}



}
