//
// Created by Jason Davidson on 2/15/22.
//

import Foundation

public class GasEstimate: NSObject {
	public let txFees: Provenance_Msgfees_V1_CalculateTxFeesResponse!
	public let gas: UInt64!
	public let gasFee: UInt64!
	public let denom: String!

	init(txFees: Provenance_Msgfees_V1_CalculateTxFeesResponse!, gas: UInt64!, gasFee: UInt64!, denom: String) {
		self.txFees = txFees
		self.gas = gas
		self.gasFee = gasFee
		self.denom = denom
		super.init()
	}

	static func baseFee(_ gas: UInt64) -> GasEstimate {
		var gasFactor: Double = Double(gas) * Tx.gasFactor
		gasFactor.round(.up)

		return GasEstimate(
				txFees: Provenance_Msgfees_V1_CalculateTxFeesResponse(),
				gas: gas,
				gasFee: gas * UInt64(gasFactor),
				denom: Tx.baseDenom)
	}

	static func baseFee(_ txFees: Provenance_Msgfees_V1_CalculateTxFeesResponse) -> GasEstimate {
		var gasFactor: Double = Double(txFees.estimatedGas) * Tx.gasFactor
		gasFactor.round(.up)

		/*
		 	Here's how we calculate gas:
		 		let afSum = sum of all `additionalFees` collection where denom is `nhash`
		 		let adjustedGas = `estimatedGas` * gasFactor
		  		let gasFee = (`adjustedGas` * 1905) + afSum
		 */

		let afSum = txFees.additionalFees.filter { coin in coin.denom == Tx.baseDenom }
		                  .map { coin -> UInt64 in
			                  UInt64(coin.amount) ?? 0
		                  }.reduce(0, +)

		let gasFee = afSum + (UInt64(gasFactor) * Tx.gasPrice)

		return GasEstimate(
				txFees: txFees,
				gas: UInt64(gasFactor),
				gasFee: gasFee,
				denom: Tx.baseDenom)
	}
	
	static func emptyEstimate() -> GasEstimate {
		GasEstimate(
				txFees: Provenance_Msgfees_V1_CalculateTxFeesResponse(),
				gas: 0,
				gasFee: 0,
				denom: Tx.baseDenom)
	}
}