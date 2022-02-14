//
// Created by Jason Davidson on 10/23/21.
//

import Foundation
import GRPC
import NIO
import SwiftProtobuf
import CryptoKit

public class Tx {
	public static let baseDenom: String = "nhash"
	public static let gasPrice: UInt64 = 1905

	private let client: Cosmos_Tx_V1beta1_ServiceClient
	private let msgFeeClient: Provenance_Msgfees_V1_QueryClient
	private let tmClient: Cosmos_Base_Tendermint_V1beta1_ServiceClient

	let signingKey: PrivateKey
	let baseAccount: Cosmos_Auth_V1beta1_BaseAccount

	public init(signingKey: PrivateKey, baseAccount: Cosmos_Auth_V1beta1_BaseAccount, channel: GRPCChannel) {
		self.signingKey = signingKey
		self.baseAccount = baseAccount
		tmClient = Cosmos_Base_Tendermint_V1beta1_ServiceClient(channel: channel)
		client = Cosmos_Tx_V1beta1_ServiceClient(channel: channel)
		msgFeeClient = Provenance_Msgfees_V1_QueryClient(channel: channel)
	}

	//MARK: - Builders

	private func buildFee(gas: UInt64) -> Cosmos_Tx_V1beta1_Fee {
		Cosmos_Tx_V1beta1_Fee.with { fee in
			fee.amount = [Cosmos_Base_V1beta1_Coin.with { coin in
				coin.denom = Tx.baseDenom
				coin.amount = "\(gas * Tx.gasPrice)"
			}]
			fee.gasLimit = gas
			fee.payer = baseAccount.address
		}
	}

	private func buildAuthInfo(fee: Cosmos_Tx_V1beta1_Fee) throws -> Cosmos_Tx_V1beta1_AuthInfo {
		try Cosmos_Tx_V1beta1_AuthInfo.with { ai in
			ai.fee = fee
			try ai.signerInfos = [Cosmos_Tx_V1beta1_SignerInfo.with { si in
				si.modeInfo = Cosmos_Tx_V1beta1_ModeInfo.with { mi in
					mi.single = Cosmos_Tx_V1beta1_ModeInfo.Single.with { single in
						single.mode = Cosmos_Tx_Signing_V1beta1_SignMode.direct
					}
				}
				si.sequence = baseAccount.sequence
				si.publicKey = try Google_Protobuf_Any.from(message: Cosmos_Crypto_Secp256k1_PubKey.with { pk in
					pk.key = signingKey.publicKey.compressedPublicKey
				})
			}]
		}
	}

	private func buildTx(
			gas: UInt64,
			messages: Array<Google_Protobuf_Any>,
			timeoutHeight: UInt64? = nil) throws -> Cosmos_Tx_V1beta1_TxRaw {
		try Cosmos_Tx_V1beta1_TxRaw.with { raw in

			let fee = buildFee(gas: gas)

			let signDoc = try Cosmos_Tx_V1beta1_SignDoc.with { sd in

				sd.bodyBytes = try Cosmos_Tx_V1beta1_TxBody.with { body in
                       body.messages = messages
                       if let th = timeoutHeight {
                           body.timeoutHeight = th
                       }
                   }
                   .serializedData()

				sd.authInfoBytes = try buildAuthInfo(fee: fee).serializedData()

				switch (signingKey.coin) {
					case .mainnet:
						sd.chainID = "pio-mainnet-1" //TODO plist
					default:
						sd.chainID = "pio-testnet-1" //TODO plist
				}
				sd.accountNumber = baseAccount.accountNumber
			}

			let signature = try signingKey.sign(data: signDoc.serializedData().sha256()).provenanceSignature
			raw.authInfoBytes = signDoc.authInfoBytes
			raw.bodyBytes = signDoc.bodyBytes
			raw.signatures = [signature]
		}
	}

	//MARK: - Estimate and Broadcast

	public func estimateTx(
			messages: Array<Google_Protobuf_Any>) throws -> EventLoopFuture<Provenance_Msgfees_V1_CalculateTxFeesResponse> {

		let tx = try buildTx(gas: UInt64.zero, messages: messages)

		let ptx = try Provenance_Msgfees_V1_CalculateTxFeesRequest.with { ptx in
			ptx.txBytes = try tx.serializedData()
		}
		let call = msgFeeClient.calculateTxFees(ptx)

		let promise = call.eventLoop.makePromise(of: Provenance_Msgfees_V1_CalculateTxFeesResponse.self)

		call.response.whenSuccess { response in
			promise.succeed(response)
		}
		call.response.whenFailure { error in
			promise.fail(error)
		}
		call.response.whenComplete { result in
			promise.completeWith(result.map { response in
				response
			})
		}
		return promise.futureResult
	}

	public func broadcastTx(gasEstimate: Provenance_Msgfees_V1_CalculateTxFeesResponse,
	                        messages: Array<Google_Protobuf_Any>,
	                        mode: Cosmos_Tx_V1beta1_BroadcastMode = Cosmos_Tx_V1beta1_BroadcastMode.block,
	                        timeoutHeight: UInt64? = nil) throws -> EventLoopFuture<RawTxResponsePair> {

		var gas = (Double(gasEstimate.estimatedGas) * 1.3)
		gas.round(.up)
		return try broadcastTx(gas: UInt64(gas), messages: messages, mode: mode, timeoutHeight: timeoutHeight)
	}

	public func broadcastTx(gas: UInt64,
	                        messages: Array<Google_Protobuf_Any>,
	                        mode: Cosmos_Tx_V1beta1_BroadcastMode = Cosmos_Tx_V1beta1_BroadcastMode.block,
	                        timeoutHeight: UInt64? = nil) throws -> EventLoopFuture<RawTxResponsePair> {

		let tx = try buildTx(gas: gas, messages: messages, timeoutHeight: timeoutHeight)

		let btx = try Cosmos_Tx_V1beta1_BroadcastTxRequest.with { btx in
			btx.mode = mode
			btx.txBytes = try tx.serializedData()
		}
		let call = client.broadcastTx(btx)

		let promise = call.eventLoop.makePromise(of: RawTxResponsePair.self)

		call.response.whenSuccess { response in
			promise.succeed(RawTxResponsePair(txRaw: tx, txResponse: response.txResponse))
		}
		call.response.whenFailure { error in
			promise.fail(error)
		}
		call.response.whenComplete { result in
			promise.completeWith(result.map { response in
				RawTxResponsePair(txRaw: tx, txResponse: response.txResponse)
			})
		}

		return promise.futureResult
	}

	//MARK: - Tendermint
	public func currentBlockHeight() throws -> EventLoopFuture<Cosmos_Base_Tendermint_V1beta1_GetLatestBlockResponse> {

		let call = tmClient.getLatestBlock(Cosmos_Base_Tendermint_V1beta1_GetLatestBlockRequest())
		let promise = call.eventLoop.makePromise(of: Cosmos_Base_Tendermint_V1beta1_GetLatestBlockResponse.self)
		call.response.whenSuccess { response in
			promise.succeed(response)
		}
		call.response.whenFailure { error in
			promise.fail(error)
		}
		call.response.whenComplete { result in
			promise.completeWith(result.map { response in
				response
			})
		}
		return promise.futureResult
	}
}