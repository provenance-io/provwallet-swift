
import XCTest
@testable import provwallet_swift

class CryptoTests: XCTestCase {
    func testSHA3Keccak256() {
        let data = "Hello".data(using: .utf8)!
        let encrypted = Crypto.sha3keccak256(data: data)
        XCTAssertEqual(encrypted.toHexString(), "06b3dfaec148fb1bb2b066f10ec285e7c9bf402ab32aa78a5d38e34566810cd2")
    }

    func testCreatePublicKey() {
        let pk = PrivateKey(pk: "0e66055a963cc3aecb185cf795de476cf290c88db671297da041b7f7377e6f9c", coin: .mainnet)!
        let publicKey = Crypto.generatePublicKey(data: pk.raw, compressed: true)
        XCTAssertEqual(publicKey.toHexString(), "039bc63ec49f8aba0ad8861f306686de816fec8a2b3d04758dbd919caf92e2bd2a")
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
