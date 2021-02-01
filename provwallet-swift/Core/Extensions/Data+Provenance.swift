import Foundation

extension Data {
    public var provenanceSignature: Data {
	    precondition(count == 65, "Signature must be 65 bytes")
	    return dropLast(1)
    }
}
extension Data {
	public var provenancePublicKey: Data {
		precondition(count == 65, "Public key must be uncompressed 140 bytes")
		return dropFirst(1)
	}
}

extension Data {
	public var toExtendedKey: String {
		reduce("") {
			$0 + String(format: "%02x", $1)
		}
	}
}

extension Data {
	func to<T>(type: T.Type) -> T {
		self.withUnsafeBytes { (ptr) -> T in
			ptr.baseAddress!.assumingMemoryBound(to: T.self).pointee
		}
	}
}

extension Data {
	static func randomBytes(length: Int) -> Data {
		var bytes = Data(count: length)
		_ = bytes.withUnsafeMutableBytes { SecRandomCopyBytes(kSecRandomDefault, length, $0.baseAddress!) }
		return bytes
	}
}
