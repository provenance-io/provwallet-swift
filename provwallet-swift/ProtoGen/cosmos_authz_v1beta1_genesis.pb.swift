// DO NOT EDIT.
// swift-format-ignore-file
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: cosmos/authz/v1beta1/genesis.proto
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

/// GenesisState defines the authz module's genesis state.
struct Cosmos_Authz_V1beta1_GenesisState {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var authorization: [Cosmos_Authz_V1beta1_GrantAuthorization] = []

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

/// GrantAuthorization defines the GenesisState/GrantAuthorization type.
struct Cosmos_Authz_V1beta1_GrantAuthorization {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var granter: String = String()

  var grantee: String = String()

  var authorization: SwiftProtobuf.Google_Protobuf_Any {
    get {return _authorization ?? SwiftProtobuf.Google_Protobuf_Any()}
    set {_authorization = newValue}
  }
  /// Returns true if `authorization` has been explicitly set.
  var hasAuthorization: Bool {return self._authorization != nil}
  /// Clears the value of `authorization`. Subsequent reads from it will return its default value.
  mutating func clearAuthorization() {self._authorization = nil}

  var expiration: SwiftProtobuf.Google_Protobuf_Timestamp {
    get {return _expiration ?? SwiftProtobuf.Google_Protobuf_Timestamp()}
    set {_expiration = newValue}
  }
  /// Returns true if `expiration` has been explicitly set.
  var hasExpiration: Bool {return self._expiration != nil}
  /// Clears the value of `expiration`. Subsequent reads from it will return its default value.
  mutating func clearExpiration() {self._expiration = nil}

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}

  fileprivate var _authorization: SwiftProtobuf.Google_Protobuf_Any? = nil
  fileprivate var _expiration: SwiftProtobuf.Google_Protobuf_Timestamp? = nil
}

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "cosmos.authz.v1beta1"

extension Cosmos_Authz_V1beta1_GenesisState: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".GenesisState"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "authorization"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeRepeatedMessageField(value: &self.authorization) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.authorization.isEmpty {
      try visitor.visitRepeatedMessageField(value: self.authorization, fieldNumber: 1)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Cosmos_Authz_V1beta1_GenesisState, rhs: Cosmos_Authz_V1beta1_GenesisState) -> Bool {
    if lhs.authorization != rhs.authorization {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Cosmos_Authz_V1beta1_GrantAuthorization: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".GrantAuthorization"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "granter"),
    2: .same(proto: "grantee"),
    3: .same(proto: "authorization"),
    4: .same(proto: "expiration"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.granter) }()
      case 2: try { try decoder.decodeSingularStringField(value: &self.grantee) }()
      case 3: try { try decoder.decodeSingularMessageField(value: &self._authorization) }()
      case 4: try { try decoder.decodeSingularMessageField(value: &self._expiration) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.granter.isEmpty {
      try visitor.visitSingularStringField(value: self.granter, fieldNumber: 1)
    }
    if !self.grantee.isEmpty {
      try visitor.visitSingularStringField(value: self.grantee, fieldNumber: 2)
    }
    if let v = self._authorization {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 3)
    }
    if let v = self._expiration {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 4)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Cosmos_Authz_V1beta1_GrantAuthorization, rhs: Cosmos_Authz_V1beta1_GrantAuthorization) -> Bool {
    if lhs.granter != rhs.granter {return false}
    if lhs.grantee != rhs.grantee {return false}
    if lhs._authorization != rhs._authorization {return false}
    if lhs._expiration != rhs._expiration {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}
