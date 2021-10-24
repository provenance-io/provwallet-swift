//
// Created by Jason Davidson on 10/23/21.
//

import Foundation
import GRPC
import NIO
import SwiftProtobuf
import CryptoKit

public class Bank: BaseQuery {

	private let channel: GRPCChannel
	private let client: Cosmos_Bank_V1beta1_QueryClient

	public init(channel: GRPCChannel) {
		self.channel = channel
		client = Cosmos_Bank_V1beta1_QueryClient(channel: channel)
	}

	//MARK: - Query

	public func balance(address: String, denom: String) throws -> EventLoopFuture<Cosmos_Base_V1beta1_Coin> {
		try buildPromise(call: client.balance(Cosmos_Bank_V1beta1_QueryBalanceRequest.with {
			$0.address = address
			$0.denom = denom
		}), promiseOf: Cosmos_Base_V1beta1_Coin.self) { response in
			response.balance
		}.futureResult
	}

	public func balances(address: String) throws -> EventLoopFuture<Array<Cosmos_Base_V1beta1_Coin>> {
		try buildPromise(call: client.allBalances(Cosmos_Bank_V1beta1_QueryAllBalancesRequest.with {
			$0.address = address
			$0.pagination = Cosmos_Base_Query_V1beta1_PageRequest.with {
				$0.countTotal = true
				$0.limit = UInt64.max
			}
		}), promiseOf: Array<Cosmos_Base_V1beta1_Coin>.self) { response in
			response.balances
		}.futureResult
	}

	//MARK: - Message Creators

	public static func buildMsgSend(fromAddress: String,
	                                toAddress: String,
	                                amount: String,
	                                denom: String = Tx.baseDenom) -> Cosmos_Bank_V1beta1_MsgSend {
		let coin = Cosmos_Base_V1beta1_Coin.with { coin in
			coin.amount = amount
			coin.denom = denom
		}
		return Cosmos_Bank_V1beta1_MsgSend.with { send in
			send.fromAddress = fromAddress
			send.toAddress = toAddress
			send.amount = [coin]
		}
	}


}
