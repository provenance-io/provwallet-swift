//
// Created by Jason Davidson on 11/16/21.
//

import Foundation

public struct RawTxResponsePair {

	public let txRaw: Cosmos_Tx_V1beta1_TxRaw
	public let txResponse: Cosmos_Base_Abci_V1beta1_TxResponse
	public init(txRaw: Cosmos_Tx_V1beta1_TxRaw, txResponse: Cosmos_Base_Abci_V1beta1_TxResponse) {
		self.txRaw = txRaw
		self.txResponse = txResponse
	}

	public func asJsonString() throws -> String {
		// blech
		try "{\"txRaw\": \(txRaw.jsonString()), \"txResponse\": \(txResponse.jsonString()) }"
	}
}