import XCTest
@testable import provwallet_swift

class PrivateKeyTests: XCTestCase {

	func testMainnet() {
		let address = "pb1uzu4jl48u48ztv873yqayg6y0fm7neyh2jg57x"
		let rawPk = "0e66055a963cc3aecb185cf795de476cf290c88db671297da041b7f7377e6f9c"

		let hexPk = "0e66055a963cc3aecb185cf795de476cf290c88db671297da041b7f7377e6f9c"
		[hexPk].forEach {
			testImportFromPK(coin: .mainnet, privateKey: $0, address: address, raw: rawPk)
		}
	}

	func testTestnet() {
		let address = "tp1uzu4jl48u48ztv873yqayg6y0fm7neyheedcuv"
		let rawPk = "0e66055a963cc3aecb185cf795de476cf290c88db671297da041b7f7377e6f9c"

		let hexPk = "0e66055a963cc3aecb185cf795de476cf290c88db671297da041b7f7377e6f9c"
		[hexPk].forEach {
			testImportFromPK(coin: .testnet, privateKey: $0, address: address, raw: rawPk)
		}
	}

	func testSignature() {

	}

	func testImportFromPK(coin: Coin, privateKey: String, address: String, raw: String) {
		let pk = PrivateKey(pk: privateKey, coin: coin)
		XCTAssertEqual(pk!.publicKey.address, address)
		XCTAssertEqual(pk?.raw, Data(hex: raw))
	}


}

