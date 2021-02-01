
import XCTest
@testable import provwallet_swift

class CryptoTests: XCTestCase {
    func testSHA3Keccak256() {
        let data = "Hello".data(using: .utf8)!
        let encrypted = Crypto.sha3keccak256(data: data)
        XCTAssertEqual(encrypted.toHexString(), "06b3dfaec148fb1bb2b066f10ec285e7c9bf402ab32aa78a5d38e34566810cd2")
    }

    func testCreatePublicKey() {
        let pk = PrivateKey(pk: "L5GgBH1U8PuNuzCQGvvEH3udEXCEuJaiK96e88romhpGa1cU7JTY", coin: .mainnet)!
        let publicKey = Crypto.generatePublicKey(data: pk.raw, compressed: true)
        XCTAssertEqual(publicKey.toHexString(), "034cad1a1d6702e98671c0c7fe1df245bd9f62e50edac9fa01d0e61dd60fbf05cd")
    }

    func bip44PrivateKey(coin: Coin , from: PrivateKey) -> PrivateKey {
        let bip44Purpose:UInt32 = 44
        let purpose = from.derived(at: .hardened(bip44Purpose))
        let coinType = purpose.derived(at: .hardened(coin.coinType))
        let account = coinType.derived(at: .hardened(0))
        let receive = account.derived(at: .notHardened(0))
        return receive
    }

     func testPublickKeyHashOutFromPubKeyHash() {
        let expected = "0392030131e97b2a396691a7c1d91f6b5541649b75bda14d056797ab3cadcaf2f5"
        let entropy = Data(hex: "000102030405060708090a0b0c0d0e0f")
        let mnemonic = Mnemonic.create(entropy: entropy)
        let seed = Mnemonic.createSeed(mnemonic: mnemonic)
        let privateKey = PrivateKey(seed: seed, coin: .mainnet)
        let publicKey = privateKey.publicKey.data
        XCTAssertEqual(publicKey.toHexString(), expected)
    }
}
