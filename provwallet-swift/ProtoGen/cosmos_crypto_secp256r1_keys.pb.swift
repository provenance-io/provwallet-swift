// DO NOT EDIT.
// swift-format-ignore-file
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: cosmos/crypto/secp256r1/keys.proto
//
// For information on using the generated types, please see the documentation:
//   https://github.com/apple/swift-protobuf/

import Foundation
import SwiftProtobuf

// If the compiler emits an error on this type, it is because this file
// was generated by a version of the `protoc` Swift plug-in that is
// incompatible with the version of SwiftProtobuf to which you are linking.
// Please ensure that you are building against the same version of the API
// that was used to generate this file.
fileprivate struct _GeneratedWithProtocGenSwiftVersion: SwiftProtobuf.ProtobufAPIVersionCheck {
  struct _2: SwiftProtobuf.ProtobufAPIVersion_2 {}
  typealias Version = _2
}

/// PubKey defines a secp256r1 ECDSA public key.
struct Cosmos_Crypto_Secp256r1_PubKey {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// Point on secp256r1 curve in a compressed representation as specified in section
  /// 4.3.6 of ANSI X9.62: https://webstore.ansi.org/standards/ascx9/ansix9621998
  var key: Data = Data()

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

/// PrivKey defines a secp256r1 ECDSA private key.
struct Cosmos_Crypto_Secp256r1_PrivKey {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// secret number serialized using big-endian encoding
  var secret: Data = Data()

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "cosmos.crypto.secp256r1"

extension Cosmos_Crypto_Secp256r1_PubKey: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".PubKey"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "key"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularBytesField(value: &self.key) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.key.isEmpty {
      try visitor.visitSingularBytesField(value: self.key, fieldNumber: 1)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Cosmos_Crypto_Secp256r1_PubKey, rhs: Cosmos_Crypto_Secp256r1_PubKey) -> Bool {
    if lhs.key != rhs.key {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Cosmos_Crypto_Secp256r1_PrivKey: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".PrivKey"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "secret"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularBytesField(value: &self.secret) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.secret.isEmpty {
      try visitor.visitSingularBytesField(value: self.secret, fieldNumber: 1)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Cosmos_Crypto_Secp256r1_PrivKey, rhs: Cosmos_Crypto_Secp256r1_PrivKey) -> Bool {
    if lhs.secret != rhs.secret {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}
