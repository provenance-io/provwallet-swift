import Foundation

public enum Coin {
	case mainnet
	case testnet


	public var addressPrefix: String {
		switch self {
			case .mainnet:
				return "pb"
			case .testnet:
				return "tp"
		}
	}

	public var coinType: UInt32 {
		switch self {
			case .mainnet:
				return 505
			case .testnet:
				return 1
		}
	}
}
