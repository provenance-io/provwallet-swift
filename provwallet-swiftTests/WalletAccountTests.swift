import XCTest
import CryptoKit

@testable import provwallet_swift

class WalletAccountTests: XCTestCase {

	func testWalletPrivateKey() {
		let entropy = Data(hex: "000102030405060708090a0b0c0d0e0f")
		let mnemonic = Mnemonic.create(entropy: entropy)
		let seed = Mnemonic.createSeed(mnemonic: mnemonic)
		let privateKey = Wallet(seed: seed, coin: .mainnet).privateKey

		XCTAssertEqual(try privateKey.serialize(publicKeyOnly: false),
		               "xprv9s21ZrQH143K2XojduRLQnU8D8K59KSBoMuQKGx8dW3NBitFDMkYGiJPwZdanjZonM7eXvcEbxwuGf3RdkCyyXjsbHSkwtLnJcsZ9US42Gd")
		XCTAssertEqual(try privateKey.serialize(publicKeyOnly: true),
		               "xpub661MyMwAqRbcF1tCjvxLmvQrmA9ZYnA3Aaq17fMkBqaM4XDPku4npWcsnrBiXdWRkCb9JhHgWoqBPLnY9XGrig4oCSTRgATzKcR9hSnhChS")

	}

	func testWalletAccount() {

		let entropy = Data(hex: "000102030405060708090a0b0c0d0e0f")
		let mnemonic = Mnemonic.create(entropy: entropy)
		let seed = Mnemonic.createSeed(mnemonic: mnemonic)
		let wallet = Wallet.init(seed: seed, coin: .mainnet)
		//yields m/44'/505'/0'/0/0
		let account = wallet.generateAccount()
		XCTAssertEqual(account.address, "pb18vgc2p3l3xz5meqgtl5qgagsgx83ymh0l4qjmj")
		XCTAssertEqual(try account.privateKey.serialize(),
		               "xpub6G3FTrL7M8WmizmdRSdFxjzP2Ggqwc8BNfqr6MdXgTsc1EZ88KWLtfpFHahUWmMS6iDHNaSGCqXJLxhinmYd4g1YBd9GzaNDShmRfTLW2Bt")
		XCTAssertEqual(try account.privateKey.serialize(publicKeyOnly: false),
		               "xprvA33u4LoDWkxUWWhAKR6Fbc3eUErMY9QL1SvFHyDv88Ld8SDyanC6LsVmSJQffeKM6ascmjHvkt5jeZqXvFkfPksD4NVzSdBmB43ev6QGj28")

	}

	func testWalletSignatureExistingWallet() throws {

		let wallet = try Wallet.init(
				bip32Serialized: "xprv9s21ZrQH143K2XojduRLQnU8D8K59KSBoMuQKGx8dW3NBitFDMkYGiJPwZdanjZonM7eXvcEbxwuGf3RdkCyyXjsbHSkwtLnJcsZ9US42Gd")

		//yields m/44'/505'/0'/0/0
		let account = wallet.generateAccount()
		XCTAssertEqual(account.address, "pb18vgc2p3l3xz5meqgtl5qgagsgx83ymh0l4qjmj")
		XCTAssertEqual(try account.privateKey.serialize(publicKeyOnly: false),
		               "xprvA33u4LoDWkxUWWhAKR6Fbc3eUErMY9QL1SvFHyDv88Ld8SDyanC6LsVmSJQffeKM6ascmjHvkt5jeZqXvFkfPksD4NVzSdBmB43ev6QGj28")

		let signature = try account.privateKey.sign(text: "HELLO")

		// default signature is zero padded
		XCTAssertEqual(signature.toHexString(),
		               "693838f4233afd7a1fec4d30415873d820e94557550f1cb21cab6f6dd87e802014b1ac02719e93ba1a848b11268929dcad3bef439a7472e446c7eb5cfe4523b101")
		// provenance signature does not zero pad
		XCTAssertEqual(signature.provenanceSignature.toHexString(),
		               "693838f4233afd7a1fec4d30415873d820e94557550f1cb21cab6f6dd87e802014b1ac02719e93ba1a848b11268929dcad3bef439a7472e446c7eb5cfe4523b1")

	}

	func testWalletSignatureNewWallet() throws {

		let entropy = Data(hex: "000102030405060708090a0b0c0d0e0f")
		let mnemonic = Mnemonic.create(entropy: entropy)
		let seed = Mnemonic.createSeed(mnemonic: mnemonic)
		let wallet = Wallet.init(seed: seed, coin: .testnet)

		//yields m/44'/1'/0'/0/0
		let account = wallet.generateAccount()
		XCTAssertEqual(account.address, "tp1dq0tgwrhjm47f9aw34z5d032c4qzsg6hdyfmey")
		XCTAssertEqual(try account.privateKey.serialize(publicKeyOnly: false),
		               "tprv8kxV73NnPZyfSNfQThb5zjzysmbmGABtrZsGNcuhKnqPsmJFuyBvwJzSA24V59AAYWJfBVGxu4fGSKiLh3czp6kE1NNpP2SqUvHeStr8DC1")

		let signature = try account.privateKey.sign(text: "HELLO")

		// default signature is zero padded
		XCTAssertEqual(signature.toHexString(),
		               "fae977a09b551014d47ac533fe9d82f4d7ea78a45cec06d1730c4b4cb094c6f42b0f153d7d52009a3c59c45c680f6f31546cfc819157151f54cfea21799a3f6501")
		// provenance signature does not zero pad
		XCTAssertEqual(signature.provenanceSignature.toHexString(),
		               "fae977a09b551014d47ac533fe9d82f4d7ea78a45cec06d1730c4b4cb094c6f42b0f153d7d52009a3c59c45c680f6f31546cfc819157151f54cfea21799a3f65")

	}

	func testWalletSignatureExistingWalletIndex() throws {

		let wallet = try Wallet.init(
				bip32Serialized: "xprv9s21ZrQH143K2XojduRLQnU8D8K59KSBoMuQKGx8dW3NBitFDMkYGiJPwZdanjZonM7eXvcEbxwuGf3RdkCyyXjsbHSkwtLnJcsZ9US42Gd")

		//yields m/44'/505'/0'/0/77'
		let account = wallet.generateAccountHardened(at: 77)
		XCTAssertEqual(account.address, "pb1qa8txcadq878kz69j049cl4j2kdwc8fpvz2mpl")
		XCTAssertEqual(try account.privateKey.serialize(publicKeyOnly: false),
		               "xprvA33u4LoMrRVW6ggk3dGYVjoAvHM6P2imDdXX4jH7fs3NmxPqeF7DgAzfeF3Lmj8BMxpRukxbBxEYMypwfiFYXrnqpn1tzHsvs9wq2vKYFZu")

		let signature = try account.privateKey.sign(text: "HELLO")

		// provenance signature does not zero pad
		XCTAssertEqual(signature.provenanceSignature.toHexString(),
		               "7b19022b0a4d7d57ad8d5cdd24f743feb8b6651faaab04dc0be8af149f6b5fc05438381956f30ae81f9771cf8343214da651b28a5d710f6ebe8aeb8bd2b1b8c2")
	}

	func testWalletSignatureValid() throws {
		let entropy = Data(hex: "000102030405060708090a0b0c0d0e0f")
		let mnemonic = Mnemonic.create(entropy: entropy)
		let seed = Mnemonic.createSeed(mnemonic: mnemonic)
		let wallet = Wallet.init(seed: seed, coin: .mainnet)

		//yields m/44'/505'/0'/0/0
		let account = wallet.generateAccount()
		let signature = try account.privateKey.sign(text: "HELLO")
		let hashData = SHA256.hash(data: "HELLO".data(using: .utf8)!).data

		let validSignature = try Crypto.verify(signature, hash: hashData,
		                                       publicKey: account.publicKey.uncompressedPublicKey)
		XCTAssertTrue(validSignature)

	}
}
