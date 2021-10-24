//
// Created by Jason Davidson on 10/23/21.
//

import Foundation
import GRPC
import NIO
import SwiftProtobuf
import CryptoKit

public class AuthQuery: BaseQuery {

	private let client: Cosmos_Auth_V1beta1_QueryClient

	public init(channel: GRPCChannel) {
		client = Cosmos_Auth_V1beta1_QueryClient(channel: channel)
	}

	public func baseAccount(address: String) throws -> EventLoopFuture<Cosmos_Auth_V1beta1_BaseAccount> {
		try buildPromise(call: client.account(Cosmos_Auth_V1beta1_QueryAccountRequest.with {
			$0.address = address
		}), promiseOf: Cosmos_Auth_V1beta1_BaseAccount.self) { response in
			try Cosmos_Auth_V1beta1_BaseAccount.init(unpackingAny: response.account)
		}.futureResult
	}

	public func baseAccounts(
			pageRequest: Cosmos_Base_Query_V1beta1_PageRequest) throws -> EventLoopFuture<Array<Cosmos_Auth_V1beta1_BaseAccount>> {
		try buildPromise(call: client.accounts(Cosmos_Auth_V1beta1_QueryAccountsRequest.with {
			$0.pagination = pageRequest
		}), promiseOf: Array<Cosmos_Auth_V1beta1_BaseAccount>.self) { response in
			try response.accounts.map { response -> Cosmos_Auth_V1beta1_BaseAccount in
				if (response.isA(Provenance_Marker_V1_MarkerAccount.self)) {
					return try Provenance_Marker_V1_MarkerAccount.init(unpackingAny: response).baseAccount
				} else {
					return try Cosmos_Auth_V1beta1_BaseAccount.init(unpackingAny: response)
				}
			}
		}.futureResult
	}

}
