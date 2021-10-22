//
// Created by Jason Davidson on 10/22/21.
//

import XCTest
import GRPC
import NIO
import SwiftProtobuf

@testable import provwallet_swift

class ProvenanceBlockchainClientTests: XCTestCase {

	let pbHost = "localhost"
	let pbPort = 9090
	var channel: ClientConnection!
	var group = PlatformSupport.makeEventLoopGroup(loopCount: 1)

	/*
     Privates
     */
	private func authQuery(address: String,
	                       group: EventLoopGroup,
	                       completion: @escaping (SwiftProtobuf.Google_Protobuf_Any, Error?) -> Void) {
		let channel = ClientConnection.insecure(group: group)
		                              .connect(host: pbHost, port: pbPort)
		let client = Cosmos_Auth_V1beta1_QueryClient(channel: channel)
		defer {
			try? client.channel.close().wait()
		}
		do {
			var request = Cosmos_Auth_V1beta1_QueryAccountRequest()
			request.address = address
			completion(try client.account(request).response.wait().account, nil)
		} catch {
			completion(SwiftProtobuf.Google_Protobuf_Any.init(), error)
		}
	}

	override func setUpWithError() throws {
		// Put setup code here. This method is called before the invocation of each test method in the class.
		group = PlatformSupport.makeEventLoopGroup(loopCount: 1)
		channel = ClientConnection.insecure(group: group)
		                          .connect(host: "localhost", port: 9090)
	}

	override func tearDownWithError() throws {
		// Put teardown code here. This method is called after the invocation of each test method in the class.
		do {
			try? group.syncShutdownGracefully()
		}

	}

	func testPerformanceExample() throws {
		// This is an example of a performance test case.
		self.measure {
			// Put the code you want to measure the time of here.
		}
	}
	func testQueryAuth() {
		let address = "tp1zk3qvk6dvpk6394chmvq5gtrw5arqzsag072h5"

		authQuery(address: address, group: group) { any, error in
			do {
				let baseAccount = try Cosmos_Auth_V1beta1_BaseAccount.init(unpackingAny: any)
				XCTAssertEqual(baseAccount.accountNumber, 11)
			} catch {
				XCTFail("\(error)")
			}
		}
	}

	func testQueryBank() throws {
		let address = "tp1zk3qvk6dvpk6394chmvq5gtrw5arqzsag072h5"

		let client = Cosmos_Bank_V1beta1_QueryClient(channel: channel)
		var request = Cosmos_Bank_V1beta1_QueryBalanceRequest()
		request.address = address
		request.denom = "nhash"
		do {
			let balance = try client.balance(request).response.wait().balance
			print(balance)
			XCTAssertEqual(balance.denom, "nhash")
		} catch {
			XCTFail("\(error)")
		}
	}

	func testTransferCoin() throws {
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

		do {
			XCTAssertEqual("tp19xl4yz9ge97eq7aytpt6eeq4uw5st3tas4pguu", firstPrivateKey.publicKey.address)
			//need to faucet the address for this test to work

		} catch {
			XCTFail("\(error)")
		}
	}

}
