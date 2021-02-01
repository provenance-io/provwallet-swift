import Foundation
import CryptoKit

// CryptoKit.Digest utils
extension Digest {
	var bytes: [UInt8] { Array(makeIterator()) }
	var data: Data { Data(bytes) }

	var hex: String {
		bytes.map { String(format: "%02X", $0) }.joined()
	}
}