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

	let pbHost = "grpc.test.provenance.io"
	let pbPort = 443
	var channel: ClientConnection!
	var group = PlatformSupport.makeEventLoopGroup(loopCount: 1)

	var auth: AuthQuery!
	var bank: Bank!

	let address = "tp1zk3qvk6dvpk6394chmvq5gtrw5arqzsag072h5"
	let denom = "nhash"

	let seed = Mnemonic.createSeed(
			mnemonic: "abandon amount liar amount expire adjust cage candy arch gather drum buyer travel print drip enhance actor female resemble expand dumb police keen narrow")
	let signingAddress = "tp19xl4yz9ge97eq7aytpt6eeq4uw5st3tas4pguu"
	var signingKey: PrivateKey!

	override func setUpWithError() throws {
		// Put setup code here. This method is called before the invocation of each test method in the class.
		channel = ClientConnection.usingTLSBackedByNIOSSL(on: group)
		                          .withKeepalive(ClientConnectionKeepalive(timeout: .seconds(10)))
		                          .connect(host: pbHost)
		auth = AuthQuery(channel: channel)
		bank = Bank(channel: channel)

		signingKey = PrivateKey(seed: seed, coin: .testnet).defaultKey()
	}

	override func tearDownWithError() throws {
		// Put teardown code here. This method is called after the invocation of each test method in the class.
		do {
			try? group.syncShutdownGracefully()
			try? channel.close().wait()
		}

	}

	// so the channel doesn't shut down before the promises complete
	private func wait<T>(_ future: EventLoopFuture<T>) {
		do {
			let _ = try future.wait()
		} catch {
			NSLog("\(error)")
		}
	}

	func testPerformanceExample() throws {
		// This is an example of a performance test case.
		self.measure {
			// Put the code you want to measure the time of here.
		}
	}

	func testQueryBaseAccount() throws {
		let q = try auth.baseAccount(address: address)
		q.whenComplete { result in
			do {
				XCTAssertEqual(try result.get().accountNumber, 11)
			} catch {
				XCTFail("\(error)")
			}
		}
		wait(q)
	}

	func testQueryBaseAccountFail() throws {
		let badAddr = "tp103cycvtmexy2p0ftw6zahryvk36fndxkrxy0l4"
		let q = try auth.baseAccount(address: badAddr)
		q.whenComplete { result in
			do {
				let _ = try result.get()
				XCTFail("query should not complete")
			} catch {
				XCTAssertTrue("\(error)".contains("account \(badAddr) not"))
			}
		}
		q.whenFailure { error in
			XCTAssertTrue("\(error)".contains("account \(badAddr) not"))
		}
		wait(q)
	}

	/* broken because of marker marker accounts
	func testQueryBaseAccounts() throws {
		let q = try auth.baseAccounts(pageRequest: Cosmos_Base_Query_V1beta1_PageRequest.with { request in
			request.countTotal = true
			request.limit = UInt64.max
		})
		q.whenComplete { result in
			do {
				let accounts = try result.get()
				XCTAssertFalse(accounts.isEmpty)
			} catch {
				XCTFail("\(error)")
			}
		}
		wait(q)
	}	
	 */

	func testQueryBank() throws {
		let q = try bank.balance(address: address, denom: denom)
		q.whenComplete { [self] result in
			do {
				let coin = try result.get()
				XCTAssertEqual(coin.denom, denom)
				XCTAssertTrue(UInt64(coin.amount) ?? UInt64.zero > UInt64.zero)
			} catch {
				XCTFail("\(error)")
			}
		}
		wait(q)
	}

	func testTransferCoinTheHardWay() throws {
		let seed = Mnemonic.createSeed(
				mnemonic: "abandon amount liar amount expire adjust cage candy arch gather drum buyer travel print drip enhance actor female resemble expand dumb police keen narrow")
		let signingKey = PrivateKey(seed: seed, coin: .testnet).defaultKey()

		XCTAssertEqual("tp19xl4yz9ge97eq7aytpt6eeq4uw5st3tas4pguu", signingKey.publicKey.address)
		//may need to faucet the address for this test to work

		// Query the blockchain account
		var baseAccount: Cosmos_Auth_V1beta1_BaseAccount!
		let authQuery = try auth.baseAccount(address: signingKey.publicKey.address)

		authQuery.whenSuccess { ba in
			baseAccount = ba
		}
		authQuery.whenFailure { error in
			XCTFail("\(error)")
		}
		wait(authQuery)

		do {
			var signerInfo = Cosmos_Tx_V1beta1_SignerInfo.init()
			var publicKey = Cosmos_Crypto_Secp256k1_PubKey.init()
			publicKey.key = signingKey.publicKey.compressedPublicKey
			signerInfo.publicKey = try Google_Protobuf_Any.from(message: publicKey)

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
			feeCoin.amount = "\(gas * gasPrice)"

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
			txBody.messages = [try Google_Protobuf_Any.from(message: txMsgSend)]

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

			let client = Cosmos_Tx_V1beta1_ServiceClient(channel: self.channel)

			var broadcastTxRequest = Cosmos_Tx_V1beta1_BroadcastTxRequest.init()
			broadcastTxRequest.mode = Cosmos_Tx_V1beta1_BroadcastMode.block
			broadcastTxRequest.txBytes = try tx.serializedData()

			print(broadcastTxRequest)
			let response = try client.broadcastTx(broadcastTxRequest).response.wait()

			print(try response.txResponse.jsonString())

		} catch {
			XCTFail("\(error)")
		}
	}

	func testTransferCoin() throws {

		XCTAssertEqual(signingAddress, signingKey.publicKey.address)
		//may need to faucet the address for this test to work

		do {
			// Query the blockchain account in a blocking wait
			let baseAccount = try auth.baseAccount(address: signingKey.publicKey.address).wait()

			let gas: UInt64 = 250000

			let tx = Tx(signingKey: self.signingKey, baseAccount: baseAccount, channel: self.channel)

			let bankSend = try Google_Protobuf_Any.from(
					message: Bank.buildMsgSend(
							fromAddress: baseAccount.address,
							toAddress: "tp1mpapyn7sgdrrmpx8ed7haprt8m0039gg0nyn8f",
							amount: "77"))

			let txPromise: EventLoopFuture<RawTxResponsePair> = try tx.broadcastTx(
					gas: gas,
					messages: [bankSend])

			txPromise.whenComplete { result in
				do {
					let txResult = try result.get()
					print(txResult)
				} catch {
					XCTFail("\(error))")
				}
			}
			wait(txPromise)
		} catch {
			XCTFail("\(error)")
		}
	}

	func testEstimateAndBroadcast() throws {

		XCTAssertEqual(signingAddress, signingKey.publicKey.address)
		//may need to faucet the address for this test to work

		do {
			// Query the blockchain account in a blocking wait
			let baseAccount = try auth.baseAccount(address: signingKey.publicKey.address).wait()

			let tx = Tx(signingKey: self.signingKey, baseAccount: baseAccount, channel: self.channel)

			let bankSend = try Google_Protobuf_Any.from(
					message: Bank.buildMsgSend(
							fromAddress: baseAccount.address,
							toAddress: "tp1mpapyn7sgdrrmpx8ed7haprt8m0039gg0nyn8f",
							amount: "77"))

			let estPromise: EventLoopFuture<Provenance_Msgfees_V1_CalculateTxFeesResponse> = try tx.estimateTx(messages: [bankSend])
			let gasEstimate = try estPromise.wait()

			let txPromise: EventLoopFuture<RawTxResponsePair> = try tx.broadcastTx(gasEstimate: gasEstimate, messages: [bankSend])

			txPromise.whenComplete { result in
				do {
					let txResult = try result.get()
					print(txResult)
				} catch {
					XCTFail("\(error))")
				}
			}
			wait(txPromise)
		} catch {
			XCTFail("\(error)")
		}
	}

	func testTimeoutHeightFail() throws {

		XCTAssertEqual(signingAddress, signingKey.publicKey.address)
		//may need to faucet the address for this test to work

		do {
			// Query the blockchain account in a blocking wait
			let baseAccount = try auth.baseAccount(address: signingKey.publicKey.address).wait()

			let tx = Tx(signingKey: self.signingKey, baseAccount: baseAccount, channel: self.channel)

			let bankSend = try Google_Protobuf_Any.from(
					message: Bank.buildMsgSend(
							fromAddress: baseAccount.address,
							toAddress: "tp1mpapyn7sgdrrmpx8ed7haprt8m0039gg0nyn8f",
							amount: "77"))

			let estPromise: EventLoopFuture<Provenance_Msgfees_V1_CalculateTxFeesResponse> = try tx.estimateTx(messages: [bankSend])
			let gasEstimate = try estPromise.wait()

			let currentBlockHeight = try tx.currentBlockHeight().wait()
			let blockTimeout = UInt64(currentBlockHeight.block.header.height) - 1 // should cause it to timeout right away

			let txPromise: EventLoopFuture<RawTxResponsePair> = try tx.broadcastTx(gasEstimate: gasEstimate, messages: [bankSend], timeoutHeight: blockTimeout)

			txPromise.whenComplete { result in
				do {
					let txResult = try result.get()
					print(txResult)
					XCTAssertTrue(txResult.txResponse.code == 30)
				} catch {
					XCTFail("\(error))")
				}
			}
			
			wait(txPromise)
		} catch {
			XCTFail("\(error)")
		}
	}

	func testTimeoutHeight() throws {

		XCTAssertEqual(signingAddress, signingKey.publicKey.address)
		//may need to faucet the address for this test to work

		do {
			// Query the blockchain account in a blocking wait
			let baseAccount = try auth.baseAccount(address: signingKey.publicKey.address).wait()

			let tx = Tx(signingKey: self.signingKey, baseAccount: baseAccount, channel: self.channel)

			let bankSend = try Google_Protobuf_Any.from(
					message: Bank.buildMsgSend(
							fromAddress: baseAccount.address,
							toAddress: "tp1mpapyn7sgdrrmpx8ed7haprt8m0039gg0nyn8f",
							amount: "77"))

			let estPromise: EventLoopFuture<Provenance_Msgfees_V1_CalculateTxFeesResponse> = try tx.estimateTx(messages: [bankSend])
			let gasEstimate = try estPromise.wait()

			let currentBlockHeight = try tx.currentBlockHeight().wait()
			let blockTimeout = UInt64(currentBlockHeight.block.header.height) + 5

			let txPromise: EventLoopFuture<RawTxResponsePair> = try tx.broadcastTx(gasEstimate: gasEstimate, messages: [bankSend], timeoutHeight: blockTimeout)

			txPromise.whenComplete { result in
				do {
					let txResult = try result.get()
					print(txResult)
					XCTAssertTrue(txResult.txResponse.code == 0 && txResult.txResponse.height > 0)
				} catch {
					XCTFail("\(error))")
				}
			}

			wait(txPromise)
		} catch {
			XCTFail("\(error)")
		}
	}

}
