
import XCTest
import CryptoKit
@testable import provwallet_swift

class AddressGenerationTests: XCTestCase {
    func testMainnetChildKeyDerivation() {
        let entropy = Data(hex: "000102030405060708090a0b0c0d0e0f")
        let mnemonic = Mnemonic.create(entropy: entropy)
        let seed = Mnemonic.createSeed(mnemonic: mnemonic)
        let privateKey = PrivateKey(seed: seed, coin: .mainnet)

        XCTAssertEqual(privateKey.get(),"c95cfacbafcd5f00187eac74a10f48e8a77d2efe477ae6cb84322ffb28546352")
        XCTAssertEqual(privateKey.publicKey.address,"pb1qhgz0f092ll0krpm3wqwnam4qknwaj4qukvapt")

        // BIP44 key derivation
        // m/44'
        let purpose = privateKey.derived(at: .hardened(44))
        XCTAssertEqual(purpose.publicKey.address, "pb1fwhzf05nlq9q85pnmx2gpmwum9g9qre5ejwyhf")

        // m/44'/505'
        let coinType = purpose.derived(at: .hardened(505))
        XCTAssertEqual(coinType.publicKey.address, "pb1xmzh978tflcpdwhev4r87n3teuvyrha0gy2uev")

        // m/44'/505'/0'
        let account = coinType.derived(at: .hardened(0))
        XCTAssertEqual(account.publicKey.address, "pb1g734au2jymvp4dcvkfyvh9dk8jp5gx2hplj8v7")

        // m/44'/505'/0'/0
        let change = account.derived(at: .notHardened(0))
        XCTAssertEqual(change.publicKey.address, "pb12nc958jlcqh3n0wzuf8ksu494mxy9zzgl0ltgn")

        // m/44'/505'/0'/0/0
        let firstPrivateKey = change.derived(at: .notHardened(0))
        XCTAssertEqual(firstPrivateKey.publicKey.address, "pb18vgc2p3l3xz5meqgtl5qgagsgx83ymh0l4qjmj")

        XCTAssertEqual(
            firstPrivateKey.publicKey.compressedPublicKey.toHexString(),
            "03243d01bbdb32be47657c3db0735b09ca5628f8813e2798c1d150b4180de3745c"
        )

        XCTAssertEqual(
            firstPrivateKey.publicKey.uncompressedPublicKey.provenancePublicKey.toHexString(),
            "243d01bbdb32be47657c3db0735b09ca5628f8813e2798c1d150b4180de3745c3f76c1ddefb59e82a46ca20a2c22e39f5da1a930f453b32c187ca9ca0d68fabd"
        )
    }

    func testHashAddressFromPrivateKeyGeneration() {
        let pbPrivKey = Data.fromHex("36D1FF1A0D43A5C78A123087B0B74DA6E9D775CD83FA050EEF6F4E6234A62E40")!
        let privateKey = PrivateKey(seed: pbPrivKey, coin: .mainnet)
        XCTAssertEqual(privateKey.publicKey.address, "pb1v0xh4lzswu6my3j078ejqawg38j6hykjekwy4c")
    }

    func testTestnetChildKeyDerivation() throws {
        let seed = Mnemonic.createSeed(mnemonic: "abandon amount liar amount expire adjust cage candy arch gather drum buyer travel print drip enhance actor female resemble expand dumb police keen narrow")
        let privateKey = PrivateKey(seed: seed, coin: .testnet)

        // BIP44 key derivation
        // m/44'
        let purpose = privateKey.derived(at: .hardened(44))

        // m/44'/0'
        let coinType = purpose.derived(at: .hardened(1))

        // m/44'/0'/0'
        let account = coinType.derived(at: .hardened(0))

        // m/44'/0'/0'/0
        let change = account.derived(at: .notHardened(0))

        // m/44'/0'/0'/0/0
        let firstPrivateKey = change.derived(at: .notHardened(0))

        XCTAssertEqual(firstPrivateKey.get(), "36e5e6c59481df9a536566343c9dd404aac0ced5bce10befcef9ab2b6621e7f8")

        XCTAssertEqual(
                firstPrivateKey.publicKey.address,
                "tp19xl4yz9ge97eq7aytpt6eeq4uw5st3tas4pguu"
        )

        let helloData = "HELLO".data(using: .utf8)!
        let hashHex = SHA256.hash(data: helloData).map { String(format: "%02x", $0) }.joined()
        XCTAssertEqual(hashHex,"3733cd977ff8eb18b987357e22ced99f46097f31ecb239e878ae63760e83e4d5")

        let hashData = Data(hex: hashHex)

        let signature = try firstPrivateKey.sign(data: hashData)

        XCTAssertEqual(signature.toHexString(),"3459fa602e75c4c1041e3cacd1795958f569c1c6d951723bfdbeb5075ec0804007ac5078f4f83bae62e99300bfd684d1c410e24a2cfcb270139d5633cd5e599a00")
        XCTAssertEqual(signature.provenanceSignature.toHexString(),"3459fa602e75c4c1041e3cacd1795958f569c1c6d951723bfdbeb5075ec0804007ac5078f4f83bae62e99300bfd684d1c410e24a2cfcb270139d5633cd5e599a")

        XCTAssertEqual(true, try Crypto.verify(signature, hash: hashData, publicKey: firstPrivateKey.publicKey.uncompressedPublicKey))

        XCTAssertEqual(
                firstPrivateKey.publicKey.uncompressedPublicKey.provenancePublicKey.toHexString(),
                "451d48b0fda1cc0f14f5ea7061062ff2400a4925f44589c8d55d699f1456592ecc5cef1edfe69ee2661c64f988faac71b48176ecbd09de670a7f49bde3394d1c"
        )
    }


}
