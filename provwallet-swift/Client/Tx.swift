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

	let signingKey: PrivateKey
	let baseAccount: Cosmos_Auth_V1beta1_BaseAccount

	init(signingKey: PrivateKey, baseAccount: Cosmos_Auth_V1beta1_BaseAccount, channel: GRPCChannel) {
		self.signingKey = signingKey
		self.baseAccount = baseAccount
		client = Cosmos_Tx_V1beta1_ServiceClient(channel: channel)
	}

	public func buildFee(gas: UInt64) -> Cosmos_Tx_V1beta1_Fee {
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
				si.publicKey = try Google_Protobuf_Any.init(message: Cosmos_Crypto_Secp256k1_PubKey.with { pk in
					pk.key = signingKey.publicKey.compressedPublicKey
				}, partial: false, typePrefix: "")
			}]
		}
	}

	public func buildBankMsgSend(toAddress: String,
	                             amount: String,
	                             denom: String = Tx.baseDenom) -> Cosmos_Bank_V1beta1_MsgSend {
		let coin = Cosmos_Base_V1beta1_Coin.with { coin in
			coin.amount = amount
			coin.denom = denom
		}
		return Cosmos_Bank_V1beta1_MsgSend.with { send in
			send.fromAddress = baseAccount.address
			send.toAddress = toAddress
			send.amount = [coin]
		}
	}

	public func buildTx(
			fee: Cosmos_Tx_V1beta1_Fee,
			messages: Array<Google_Protobuf_Any>) throws -> Cosmos_Tx_V1beta1_TxRaw {
		try Cosmos_Tx_V1beta1_TxRaw.with { raw in
			let signDoc = try Cosmos_Tx_V1beta1_SignDoc.with { sd in

				sd.bodyBytes = try Cosmos_Tx_V1beta1_TxBody.with { body in
					body.messages = messages
				}.serializedData()

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

	public func broadcastTx(tx: Cosmos_Tx_V1beta1_TxRaw,
	                        mode: Cosmos_Tx_V1beta1_BroadcastMode) throws -> EventLoopFuture<Cosmos_Base_Abci_V1beta1_TxResponse> {
		let btx = try Cosmos_Tx_V1beta1_BroadcastTxRequest.with { btx in
			btx.mode = mode
			btx.txBytes = try tx.serializedData()
		}
		print(btx)
		let call = client.broadcastTx(btx)

		let promise = call.eventLoop.makePromise(of: Cosmos_Base_Abci_V1beta1_TxResponse.self)

		call.response.whenSuccess { response in
			promise.succeed(response.txResponse)
		}
		call.response.whenFailure { error in
			promise.fail(error)
		}
		call.response.whenComplete { result in
			promise.completeWith(result.map { response in
				response.txResponse
			})
		}

		return promise.futureResult
	}
}