//
// Created by Jason Davidson on 10/22/21.
//

import XCTest
import GRPC
import NIO
import SwiftProtobuf
import CryptoKit

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
			XCTAssertEqual(balance.denom, "nhash")
		} catch {
			XCTFail("\(error)")
		}
	}

	func testTransferCoin() throws {
		let seed = Mnemonic.createSeed(
				mnemonic: "abandon amount liar amount expire adjust cage candy arch gather drum buyer travel print drip enhance actor female resemble expand dumb police keen narrow")
		let privateKey = PrivateKey(seed: seed, coin: .testnet)

		// BIP44 key derivation
		// m/44'
		let purpose = privateKey.derived(at: .hardened(44))

		// m/44'/1'
		let coinType = purpose.derived(at: .hardened(1))

		// m/44'/1'/0'
		let account = coinType.derived(at: .hardened(0))

		// m/44'/1'/0'/0
		let change = account.derived(at: .notHardened(0))

		// m/44'/1'/0'/0/0
		let signingKey = change.derived(at: .notHardened(0))

		XCTAssertEqual("tp19xl4yz9ge97eq7aytpt6eeq4uw5st3tas4pguu", signingKey.publicKey.address)
		//need to faucet the address for this test to work

		let channel = ClientConnection.insecure(group: group)
		                              .connect(host: pbHost, port: pbPort)

		// Query the blockchain account
		authQuery(address: signingKey.publicKey.address, group: group) { any, error in
			do {
				if(error != nil) {
					XCTFail("\(error)")
				}
				
				let baseAccount = try Cosmos_Auth_V1beta1_BaseAccount.init(unpackingAny: any)
				var signerInfo = Cosmos_Tx_V1beta1_SignerInfo.init()
				var publicKey = Cosmos_Crypto_Secp256k1_PubKey.init()
				publicKey.key = signingKey.publicKey.compressedPublicKey
				signerInfo.publicKey = try Google_Protobuf_Any.init(message: publicKey, partial: false, typePrefix: "")

				/*
			    Build Auth Info
			    */
				var authInfo = Cosmos_Tx_V1beta1_AuthInfo.init()

				// add signer info
				var modeInfo = Cosmos_Tx_V1beta1_ModeInfo.init()
				var single = Cosmos_Tx_V1beta1_ModeInfo.Single.init()
				single.mode = Cosmos_Tx_Signing_V1beta1_SignMode.direct
				modeInfo.single = single
				signerInfo.modeInfo = modeInfo
				signerInfo.sequence = baseAccount.sequence
				authInfo.signerInfos = [signerInfo]

				// add fee info
				let gas = 250000
				let gasPrice = 1905
				var fee = Cosmos_Tx_V1beta1_Fee.init()
				var feeCoin = Cosmos_Base_V1beta1_Coin.init()
				feeCoin.denom = "nhash"
				feeCoin.amount = "\(gas*gasPrice)"

				fee.amount = [feeCoin]
				fee.gasLimit = UInt64(gas)
				// add fee info
				authInfo.fee = fee

				/*
			    Build Msg Send
			    */

				// amount to send
				var txMsgSend = Cosmos_Bank_V1beta1_MsgSend()
				txMsgSend.fromAddress = signingKey.publicKey.address
				var coin = Cosmos_Base_V1beta1_Coin()
				coin.amount = "77"
				coin.denom = "nhash"
				txMsgSend.amount = [coin]
				txMsgSend.toAddress = "tp1mpapyn7sgdrrmpx8ed7haprt8m0039gg0nyn8f"

				// tx body
				var txBody = Cosmos_Tx_V1beta1_TxBody.init()
				txBody.messages = [try Google_Protobuf_Any.init(message: txMsgSend, partial: false, typePrefix: "")]

				// signed doc
				var signDoc = Cosmos_Tx_V1beta1_SignDoc.init()
				signDoc.bodyBytes = try txBody.serializedData()
				signDoc.authInfoBytes = try authInfo.serializedData()
				signDoc.chainID = "pio-testnet-1"
				signDoc.accountNumber = baseAccount.accountNumber

				let signature = try signingKey.sign(data: signDoc.serializedData().sha256()).provenanceSignature
				// tx raw
				var tx = Cosmos_Tx_V1beta1_TxRaw.init()
				tx.authInfoBytes = signDoc.authInfoBytes
				tx.bodyBytes = signDoc.bodyBytes
				tx.signatures = [signature]

				let client = Cosmos_Tx_V1beta1_ServiceClient(channel: channel)

				var broadcastTxRequest = Cosmos_Tx_V1beta1_BroadcastTxRequest.init()
				broadcastTxRequest.mode = Cosmos_Tx_V1beta1_BroadcastMode.block
				broadcastTxRequest.txBytes = try tx.serializedData()

				let response = try client.broadcastTx(broadcastTxRequest).response.wait()

				print(try response.txResponse.jsonString())

			} catch {
				XCTFail("\(error)")
			}
		}
	}

}
