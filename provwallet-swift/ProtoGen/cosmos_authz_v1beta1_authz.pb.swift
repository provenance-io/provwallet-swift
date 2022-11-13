// DO NOT EDIT.
// swift-format-ignore-file
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: cosmos/authz/v1beta1/authz.proto
//
// For information on using the generated types, please see the documentation:
//   https://github.com/apple/swift-protobuf/

/// Since: cosmos-sdk 0.43

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

/// GenericAuthorization gives the grantee unrestricted permissions to execute
/// the provided method on behalf of the granter's account.
public struct Cosmos_Authz_V1beta1_GenericAuthorization {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// Msg, identified by it's type URL, to grant unrestricted permissions to execute
  public var msg: String = String()

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}
}

/// CountAuthorization gives the grantee unrestricted permissions to execute
/// the provided method on behalf of the granter's account up to the allowed authorizations count.
public struct Cosmos_Authz_V1beta1_CountAuthorization {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// Msg, identified by it's type URL, to grant unrestricted permissions to execute
  public var msg: String = String()

  /// Allowed number of authorizations assigned to grantee
  public var allowedAuthorizations: Int32 = 0

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}
}

/// Grant gives permissions to execute
/// the provide method with expiration time.
public struct Cosmos_Authz_V1beta1_Grant {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  public var authorization: SwiftProtobuf.Google_Protobuf_Any {
    get {return _authorization ?? SwiftProtobuf.Google_Protobuf_Any()}
    set {_authorization = newValue}
  }
  /// Returns true if `authorization` has been explicitly set.
  public var hasAuthorization: Bool {return self._authorization != nil}
  /// Clears the value of `authorization`. Subsequent reads from it will return its default value.
  public mutating func clearAuthorization() {self._authorization = nil}

  /// time when the grant will expire and will be pruned. If null, then the grant
  /// doesn't have a time expiration (other conditions  in `authorization`
  /// may apply to invalidate the grant)
  public var expiration: SwiftProtobuf.Google_Protobuf_Timestamp {
    get {return _expiration ?? SwiftProtobuf.Google_Protobuf_Timestamp()}
    set {_expiration = newValue}
  }
  /// Returns true if `expiration` has been explicitly set.
  public var hasExpiration: Bool {return self._expiration != nil}
  /// Clears the value of `expiration`. Subsequent reads from it will return its default value.
  public mutating func clearExpiration() {self._expiration = nil}

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}

  fileprivate var _authorization: SwiftProtobuf.Google_Protobuf_Any? = nil
  fileprivate var _expiration: SwiftProtobuf.Google_Protobuf_Timestamp? = nil
}

/// GrantAuthorization extends a grant with both the addresses of the grantee and granter.
/// It is used in genesis.proto and query.proto
public struct Cosmos_Authz_V1beta1_GrantAuthorization {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  public var granter: String = String()

  public var grantee: String = String()

  public var authorization: SwiftProtobuf.Google_Protobuf_Any {
    get {return _authorization ?? SwiftProtobuf.Google_Protobuf_Any()}
    set {_authorization = newValue}
  }
  /// Returns true if `authorization` has been explicitly set.
  public var hasAuthorization: Bool {return self._authorization != nil}
  /// Clears the value of `authorization`. Subsequent reads from it will return its default value.
  public mutating func clearAuthorization() {self._authorization = nil}

  public var expiration: SwiftProtobuf.Google_Protobuf_Timestamp {
    get {return _expiration ?? SwiftProtobuf.Google_Protobuf_Timestamp()}
    set {_expiration = newValue}
  }
  /// Returns true if `expiration` has been explicitly set.
  public var hasExpiration: Bool {return self._expiration != nil}
  /// Clears the value of `expiration`. Subsequent reads from it will return its default value.
  public mutating func clearExpiration() {self._expiration = nil}

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}

  fileprivate var _authorization: SwiftProtobuf.Google_Protobuf_Any? = nil
  fileprivate var _expiration: SwiftProtobuf.Google_Protobuf_Timestamp? = nil
}

/// GrantQueueItem contains the list of TypeURL of a sdk.Msg.
public struct Cosmos_Authz_V1beta1_GrantQueueItem {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// msg_type_urls contains the list of TypeURL of a sdk.Msg.
  public var msgTypeUrls: [String] = []

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}
}

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "cosmos.authz.v1beta1"

extension Cosmos_Authz_V1beta1_GenericAuthorization: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".GenericAuthorization"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "msg"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.msg) }()
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.msg.isEmpty {
      try visitor.visitSingularStringField(value: self.msg, fieldNumber: 1)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Cosmos_Authz_V1beta1_GenericAuthorization, rhs: Cosmos_Authz_V1beta1_GenericAuthorization) -> Bool {
    if lhs.msg != rhs.msg {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Cosmos_Authz_V1beta1_CountAuthorization: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".CountAuthorization"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "msg"),
    2: .standard(proto: "allowed_authorizations"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.msg) }()
      case 2: try { try decoder.decodeSingularInt32Field(value: &self.allowedAuthorizations) }()
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.msg.isEmpty {
      try visitor.visitSingularStringField(value: self.msg, fieldNumber: 1)
    }
    if self.allowedAuthorizations != 0 {
      try visitor.visitSingularInt32Field(value: self.allowedAuthorizations, fieldNumber: 2)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Cosmos_Authz_V1beta1_CountAuthorization, rhs: Cosmos_Authz_V1beta1_CountAuthorization) -> Bool {
    if lhs.msg != rhs.msg {return false}
    if lhs.allowedAuthorizations != rhs.allowedAuthorizations {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Cosmos_Authz_V1beta1_Grant: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".Grant"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "authorization"),
    2: .same(proto: "expiration"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularMessageField(value: &self._authorization) }()
      case 2: try { try decoder.decodeSingularMessageField(value: &self._expiration) }()
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if let v = self._authorization {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 1)
    }
    if let v = self._expiration {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 2)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Cosmos_Authz_V1beta1_Grant, rhs: Cosmos_Authz_V1beta1_Grant) -> Bool {
    if lhs._authorization != rhs._authorization {return false}
    if lhs._expiration != rhs._expiration {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Cosmos_Authz_V1beta1_GrantAuthorization: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".GrantAuthorization"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "granter"),
    2: .same(proto: "grantee"),
    3: .same(proto: "authorization"),
    4: .same(proto: "expiration"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
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

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
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

  public static func ==(lhs: Cosmos_Authz_V1beta1_GrantAuthorization, rhs: Cosmos_Authz_V1beta1_GrantAuthorization) -> Bool {
    if lhs.granter != rhs.granter {return false}
    if lhs.grantee != rhs.grantee {return false}
    if lhs._authorization != rhs._authorization {return false}
    if lhs._expiration != rhs._expiration {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Cosmos_Authz_V1beta1_GrantQueueItem: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".GrantQueueItem"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "msg_type_urls"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeRepeatedStringField(value: &self.msgTypeUrls) }()
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.msgTypeUrls.isEmpty {
      try visitor.visitRepeatedStringField(value: self.msgTypeUrls, fieldNumber: 1)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Cosmos_Authz_V1beta1_GrantQueueItem, rhs: Cosmos_Authz_V1beta1_GrantQueueItem) -> Bool {
    if lhs.msgTypeUrls != rhs.msgTypeUrls {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}
