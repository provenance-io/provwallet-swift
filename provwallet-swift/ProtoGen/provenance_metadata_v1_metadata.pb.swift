// DO NOT EDIT.
// swift-format-ignore-file
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: provenance/metadata/v1/metadata.proto
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

/// Params defines the set of params for the metadata module.
public struct Provenance_Metadata_V1_Params {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}
}

/// ScopeIdInfo contains various info regarding a scope id.
public struct Provenance_Metadata_V1_ScopeIdInfo {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// scope_id is the raw bytes of the scope address.
  public var scopeID: Data = Data()

  /// scope_id_prefix is the prefix portion of the scope_id.
  public var scopeIDPrefix: Data = Data()

  /// scope_id_scope_uuid is the scope_uuid portion of the scope_id.
  public var scopeIDScopeUuid: Data = Data()

  /// scope_addr is the bech32 string version of the scope_id.
  public var scopeAddr: String = String()

  /// scope_uuid is the uuid hex string of the scope_id_scope_uuid.
  public var scopeUuid: String = String()

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}
}

/// SessionIdInfo contains various info regarding a session id.
public struct Provenance_Metadata_V1_SessionIdInfo {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// session_id is the raw bytes of the session address.
  public var sessionID: Data = Data()

  /// session_id_prefix is the prefix portion of the session_id.
  public var sessionIDPrefix: Data = Data()

  /// session_id_scope_uuid is the scope_uuid portion of the session_id.
  public var sessionIDScopeUuid: Data = Data()

  /// session_id_session_uuid is the session_uuid portion of the session_id.
  public var sessionIDSessionUuid: Data = Data()

  /// session_addr is the bech32 string version of the session_id.
  public var sessionAddr: String = String()

  /// session_uuid is the uuid hex string of the session_id_session_uuid.
  public var sessionUuid: String = String()

  /// scope_id_info is information about the scope id referenced in the session_id.
  public var scopeIDInfo: Provenance_Metadata_V1_ScopeIdInfo {
    get {return _scopeIDInfo ?? Provenance_Metadata_V1_ScopeIdInfo()}
    set {_scopeIDInfo = newValue}
  }
  /// Returns true if `scopeIDInfo` has been explicitly set.
  public var hasScopeIDInfo: Bool {return self._scopeIDInfo != nil}
  /// Clears the value of `scopeIDInfo`. Subsequent reads from it will return its default value.
  public mutating func clearScopeIDInfo() {self._scopeIDInfo = nil}

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}

  fileprivate var _scopeIDInfo: Provenance_Metadata_V1_ScopeIdInfo? = nil
}

/// RecordIdInfo contains various info regarding a record id.
public struct Provenance_Metadata_V1_RecordIdInfo {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// record_id is the raw bytes of the record address.
  public var recordID: Data = Data()

  /// record_id_prefix is the prefix portion of the record_id.
  public var recordIDPrefix: Data = Data()

  /// record_id_scope_uuid is the scope_uuid portion of the record_id.
  public var recordIDScopeUuid: Data = Data()

  /// record_id_hashed_name is the hashed name portion of the record_id.
  public var recordIDHashedName: Data = Data()

  /// record_addr is the bech32 string version of the record_id.
  public var recordAddr: String = String()

  /// scope_id_info is information about the scope id referenced in the record_id.
  public var scopeIDInfo: Provenance_Metadata_V1_ScopeIdInfo {
    get {return _scopeIDInfo ?? Provenance_Metadata_V1_ScopeIdInfo()}
    set {_scopeIDInfo = newValue}
  }
  /// Returns true if `scopeIDInfo` has been explicitly set.
  public var hasScopeIDInfo: Bool {return self._scopeIDInfo != nil}
  /// Clears the value of `scopeIDInfo`. Subsequent reads from it will return its default value.
  public mutating func clearScopeIDInfo() {self._scopeIDInfo = nil}

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}

  fileprivate var _scopeIDInfo: Provenance_Metadata_V1_ScopeIdInfo? = nil
}

/// ScopeSpecIdInfo contains various info regarding a scope specification id.
public struct Provenance_Metadata_V1_ScopeSpecIdInfo {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// scope_spec_id is the raw bytes of the scope specification address.
  public var scopeSpecID: Data = Data()

  /// scope_spec_id_prefix is the prefix portion of the scope_spec_id.
  public var scopeSpecIDPrefix: Data = Data()

  /// scope_spec_id_scope_spec_uuid is the scope_spec_uuid portion of the scope_spec_id.
  public var scopeSpecIDScopeSpecUuid: Data = Data()

  /// scope_spec_addr is the bech32 string version of the scope_spec_id.
  public var scopeSpecAddr: String = String()

  /// scope_spec_uuid is the uuid hex string of the scope_spec_id_scope_spec_uuid.
  public var scopeSpecUuid: String = String()

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}
}

/// ContractSpecIdInfo contains various info regarding a contract specification id.
public struct Provenance_Metadata_V1_ContractSpecIdInfo {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// contract_spec_id is the raw bytes of the contract specification address.
  public var contractSpecID: Data = Data()

  /// contract_spec_id_prefix is the prefix portion of the contract_spec_id.
  public var contractSpecIDPrefix: Data = Data()

  /// contract_spec_id_contract_spec_uuid is the contract_spec_uuid portion of the contract_spec_id.
  public var contractSpecIDContractSpecUuid: Data = Data()

  /// contract_spec_addr is the bech32 string version of the contract_spec_id.
  public var contractSpecAddr: String = String()

  /// contract_spec_uuid is the uuid hex string of the contract_spec_id_contract_spec_uuid.
  public var contractSpecUuid: String = String()

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}
}

/// RecordSpecIdInfo contains various info regarding a record specification id.
public struct Provenance_Metadata_V1_RecordSpecIdInfo {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// record_spec_id is the raw bytes of the record specification address.
  public var recordSpecID: Data = Data()

  /// record_spec_id_prefix is the prefix portion of the record_spec_id.
  public var recordSpecIDPrefix: Data = Data()

  /// record_spec_id_contract_spec_uuid is the contract_spec_uuid portion of the record_spec_id.
  public var recordSpecIDContractSpecUuid: Data = Data()

  /// record_spec_id_hashed_name is the hashed name portion of the record_spec_id.
  public var recordSpecIDHashedName: Data = Data()

  /// record_spec_addr is the bech32 string version of the record_spec_id.
  public var recordSpecAddr: String = String()

  /// contract_spec_id_info is information about the contract spec id referenced in the record_spec_id.
  public var contractSpecIDInfo: Provenance_Metadata_V1_ContractSpecIdInfo {
    get {return _contractSpecIDInfo ?? Provenance_Metadata_V1_ContractSpecIdInfo()}
    set {_contractSpecIDInfo = newValue}
  }
  /// Returns true if `contractSpecIDInfo` has been explicitly set.
  public var hasContractSpecIDInfo: Bool {return self._contractSpecIDInfo != nil}
  /// Clears the value of `contractSpecIDInfo`. Subsequent reads from it will return its default value.
  public mutating func clearContractSpecIDInfo() {self._contractSpecIDInfo = nil}

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}

  fileprivate var _contractSpecIDInfo: Provenance_Metadata_V1_ContractSpecIdInfo? = nil
}

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "provenance.metadata.v1"

extension Provenance_Metadata_V1_Params: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".Params"
  public static let _protobuf_nameMap = SwiftProtobuf._NameMap()

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let _ = try decoder.nextFieldNumber() {
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Provenance_Metadata_V1_Params, rhs: Provenance_Metadata_V1_Params) -> Bool {
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Provenance_Metadata_V1_ScopeIdInfo: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".ScopeIdInfo"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "scope_id"),
    2: .standard(proto: "scope_id_prefix"),
    3: .standard(proto: "scope_id_scope_uuid"),
    4: .standard(proto: "scope_addr"),
    5: .standard(proto: "scope_uuid"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularBytesField(value: &self.scopeID) }()
      case 2: try { try decoder.decodeSingularBytesField(value: &self.scopeIDPrefix) }()
      case 3: try { try decoder.decodeSingularBytesField(value: &self.scopeIDScopeUuid) }()
      case 4: try { try decoder.decodeSingularStringField(value: &self.scopeAddr) }()
      case 5: try { try decoder.decodeSingularStringField(value: &self.scopeUuid) }()
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.scopeID.isEmpty {
      try visitor.visitSingularBytesField(value: self.scopeID, fieldNumber: 1)
    }
    if !self.scopeIDPrefix.isEmpty {
      try visitor.visitSingularBytesField(value: self.scopeIDPrefix, fieldNumber: 2)
    }
    if !self.scopeIDScopeUuid.isEmpty {
      try visitor.visitSingularBytesField(value: self.scopeIDScopeUuid, fieldNumber: 3)
    }
    if !self.scopeAddr.isEmpty {
      try visitor.visitSingularStringField(value: self.scopeAddr, fieldNumber: 4)
    }
    if !self.scopeUuid.isEmpty {
      try visitor.visitSingularStringField(value: self.scopeUuid, fieldNumber: 5)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Provenance_Metadata_V1_ScopeIdInfo, rhs: Provenance_Metadata_V1_ScopeIdInfo) -> Bool {
    if lhs.scopeID != rhs.scopeID {return false}
    if lhs.scopeIDPrefix != rhs.scopeIDPrefix {return false}
    if lhs.scopeIDScopeUuid != rhs.scopeIDScopeUuid {return false}
    if lhs.scopeAddr != rhs.scopeAddr {return false}
    if lhs.scopeUuid != rhs.scopeUuid {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Provenance_Metadata_V1_SessionIdInfo: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".SessionIdInfo"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "session_id"),
    2: .standard(proto: "session_id_prefix"),
    3: .standard(proto: "session_id_scope_uuid"),
    4: .standard(proto: "session_id_session_uuid"),
    5: .standard(proto: "session_addr"),
    6: .standard(proto: "session_uuid"),
    7: .standard(proto: "scope_id_info"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularBytesField(value: &self.sessionID) }()
      case 2: try { try decoder.decodeSingularBytesField(value: &self.sessionIDPrefix) }()
      case 3: try { try decoder.decodeSingularBytesField(value: &self.sessionIDScopeUuid) }()
      case 4: try { try decoder.decodeSingularBytesField(value: &self.sessionIDSessionUuid) }()
      case 5: try { try decoder.decodeSingularStringField(value: &self.sessionAddr) }()
      case 6: try { try decoder.decodeSingularStringField(value: &self.sessionUuid) }()
      case 7: try { try decoder.decodeSingularMessageField(value: &self._scopeIDInfo) }()
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.sessionID.isEmpty {
      try visitor.visitSingularBytesField(value: self.sessionID, fieldNumber: 1)
    }
    if !self.sessionIDPrefix.isEmpty {
      try visitor.visitSingularBytesField(value: self.sessionIDPrefix, fieldNumber: 2)
    }
    if !self.sessionIDScopeUuid.isEmpty {
      try visitor.visitSingularBytesField(value: self.sessionIDScopeUuid, fieldNumber: 3)
    }
    if !self.sessionIDSessionUuid.isEmpty {
      try visitor.visitSingularBytesField(value: self.sessionIDSessionUuid, fieldNumber: 4)
    }
    if !self.sessionAddr.isEmpty {
      try visitor.visitSingularStringField(value: self.sessionAddr, fieldNumber: 5)
    }
    if !self.sessionUuid.isEmpty {
      try visitor.visitSingularStringField(value: self.sessionUuid, fieldNumber: 6)
    }
    if let v = self._scopeIDInfo {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 7)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Provenance_Metadata_V1_SessionIdInfo, rhs: Provenance_Metadata_V1_SessionIdInfo) -> Bool {
    if lhs.sessionID != rhs.sessionID {return false}
    if lhs.sessionIDPrefix != rhs.sessionIDPrefix {return false}
    if lhs.sessionIDScopeUuid != rhs.sessionIDScopeUuid {return false}
    if lhs.sessionIDSessionUuid != rhs.sessionIDSessionUuid {return false}
    if lhs.sessionAddr != rhs.sessionAddr {return false}
    if lhs.sessionUuid != rhs.sessionUuid {return false}
    if lhs._scopeIDInfo != rhs._scopeIDInfo {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Provenance_Metadata_V1_RecordIdInfo: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".RecordIdInfo"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "record_id"),
    2: .standard(proto: "record_id_prefix"),
    3: .standard(proto: "record_id_scope_uuid"),
    4: .standard(proto: "record_id_hashed_name"),
    5: .standard(proto: "record_addr"),
    6: .standard(proto: "scope_id_info"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularBytesField(value: &self.recordID) }()
      case 2: try { try decoder.decodeSingularBytesField(value: &self.recordIDPrefix) }()
      case 3: try { try decoder.decodeSingularBytesField(value: &self.recordIDScopeUuid) }()
      case 4: try { try decoder.decodeSingularBytesField(value: &self.recordIDHashedName) }()
      case 5: try { try decoder.decodeSingularStringField(value: &self.recordAddr) }()
      case 6: try { try decoder.decodeSingularMessageField(value: &self._scopeIDInfo) }()
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.recordID.isEmpty {
      try visitor.visitSingularBytesField(value: self.recordID, fieldNumber: 1)
    }
    if !self.recordIDPrefix.isEmpty {
      try visitor.visitSingularBytesField(value: self.recordIDPrefix, fieldNumber: 2)
    }
    if !self.recordIDScopeUuid.isEmpty {
      try visitor.visitSingularBytesField(value: self.recordIDScopeUuid, fieldNumber: 3)
    }
    if !self.recordIDHashedName.isEmpty {
      try visitor.visitSingularBytesField(value: self.recordIDHashedName, fieldNumber: 4)
    }
    if !self.recordAddr.isEmpty {
      try visitor.visitSingularStringField(value: self.recordAddr, fieldNumber: 5)
    }
    if let v = self._scopeIDInfo {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 6)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Provenance_Metadata_V1_RecordIdInfo, rhs: Provenance_Metadata_V1_RecordIdInfo) -> Bool {
    if lhs.recordID != rhs.recordID {return false}
    if lhs.recordIDPrefix != rhs.recordIDPrefix {return false}
    if lhs.recordIDScopeUuid != rhs.recordIDScopeUuid {return false}
    if lhs.recordIDHashedName != rhs.recordIDHashedName {return false}
    if lhs.recordAddr != rhs.recordAddr {return false}
    if lhs._scopeIDInfo != rhs._scopeIDInfo {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Provenance_Metadata_V1_ScopeSpecIdInfo: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".ScopeSpecIdInfo"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "scope_spec_id"),
    2: .standard(proto: "scope_spec_id_prefix"),
    3: .standard(proto: "scope_spec_id_scope_spec_uuid"),
    4: .standard(proto: "scope_spec_addr"),
    5: .standard(proto: "scope_spec_uuid"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularBytesField(value: &self.scopeSpecID) }()
      case 2: try { try decoder.decodeSingularBytesField(value: &self.scopeSpecIDPrefix) }()
      case 3: try { try decoder.decodeSingularBytesField(value: &self.scopeSpecIDScopeSpecUuid) }()
      case 4: try { try decoder.decodeSingularStringField(value: &self.scopeSpecAddr) }()
      case 5: try { try decoder.decodeSingularStringField(value: &self.scopeSpecUuid) }()
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.scopeSpecID.isEmpty {
      try visitor.visitSingularBytesField(value: self.scopeSpecID, fieldNumber: 1)
    }
    if !self.scopeSpecIDPrefix.isEmpty {
      try visitor.visitSingularBytesField(value: self.scopeSpecIDPrefix, fieldNumber: 2)
    }
    if !self.scopeSpecIDScopeSpecUuid.isEmpty {
      try visitor.visitSingularBytesField(value: self.scopeSpecIDScopeSpecUuid, fieldNumber: 3)
    }
    if !self.scopeSpecAddr.isEmpty {
      try visitor.visitSingularStringField(value: self.scopeSpecAddr, fieldNumber: 4)
    }
    if !self.scopeSpecUuid.isEmpty {
      try visitor.visitSingularStringField(value: self.scopeSpecUuid, fieldNumber: 5)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Provenance_Metadata_V1_ScopeSpecIdInfo, rhs: Provenance_Metadata_V1_ScopeSpecIdInfo) -> Bool {
    if lhs.scopeSpecID != rhs.scopeSpecID {return false}
    if lhs.scopeSpecIDPrefix != rhs.scopeSpecIDPrefix {return false}
    if lhs.scopeSpecIDScopeSpecUuid != rhs.scopeSpecIDScopeSpecUuid {return false}
    if lhs.scopeSpecAddr != rhs.scopeSpecAddr {return false}
    if lhs.scopeSpecUuid != rhs.scopeSpecUuid {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Provenance_Metadata_V1_ContractSpecIdInfo: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".ContractSpecIdInfo"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "contract_spec_id"),
    2: .standard(proto: "contract_spec_id_prefix"),
    3: .standard(proto: "contract_spec_id_contract_spec_uuid"),
    4: .standard(proto: "contract_spec_addr"),
    5: .standard(proto: "contract_spec_uuid"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularBytesField(value: &self.contractSpecID) }()
      case 2: try { try decoder.decodeSingularBytesField(value: &self.contractSpecIDPrefix) }()
      case 3: try { try decoder.decodeSingularBytesField(value: &self.contractSpecIDContractSpecUuid) }()
      case 4: try { try decoder.decodeSingularStringField(value: &self.contractSpecAddr) }()
      case 5: try { try decoder.decodeSingularStringField(value: &self.contractSpecUuid) }()
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.contractSpecID.isEmpty {
      try visitor.visitSingularBytesField(value: self.contractSpecID, fieldNumber: 1)
    }
    if !self.contractSpecIDPrefix.isEmpty {
      try visitor.visitSingularBytesField(value: self.contractSpecIDPrefix, fieldNumber: 2)
    }
    if !self.contractSpecIDContractSpecUuid.isEmpty {
      try visitor.visitSingularBytesField(value: self.contractSpecIDContractSpecUuid, fieldNumber: 3)
    }
    if !self.contractSpecAddr.isEmpty {
      try visitor.visitSingularStringField(value: self.contractSpecAddr, fieldNumber: 4)
    }
    if !self.contractSpecUuid.isEmpty {
      try visitor.visitSingularStringField(value: self.contractSpecUuid, fieldNumber: 5)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Provenance_Metadata_V1_ContractSpecIdInfo, rhs: Provenance_Metadata_V1_ContractSpecIdInfo) -> Bool {
    if lhs.contractSpecID != rhs.contractSpecID {return false}
    if lhs.contractSpecIDPrefix != rhs.contractSpecIDPrefix {return false}
    if lhs.contractSpecIDContractSpecUuid != rhs.contractSpecIDContractSpecUuid {return false}
    if lhs.contractSpecAddr != rhs.contractSpecAddr {return false}
    if lhs.contractSpecUuid != rhs.contractSpecUuid {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Provenance_Metadata_V1_RecordSpecIdInfo: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".RecordSpecIdInfo"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "record_spec_id"),
    2: .standard(proto: "record_spec_id_prefix"),
    3: .standard(proto: "record_spec_id_contract_spec_uuid"),
    4: .standard(proto: "record_spec_id_hashed_name"),
    5: .standard(proto: "record_spec_addr"),
    6: .standard(proto: "contract_spec_id_info"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularBytesField(value: &self.recordSpecID) }()
      case 2: try { try decoder.decodeSingularBytesField(value: &self.recordSpecIDPrefix) }()
      case 3: try { try decoder.decodeSingularBytesField(value: &self.recordSpecIDContractSpecUuid) }()
      case 4: try { try decoder.decodeSingularBytesField(value: &self.recordSpecIDHashedName) }()
      case 5: try { try decoder.decodeSingularStringField(value: &self.recordSpecAddr) }()
      case 6: try { try decoder.decodeSingularMessageField(value: &self._contractSpecIDInfo) }()
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.recordSpecID.isEmpty {
      try visitor.visitSingularBytesField(value: self.recordSpecID, fieldNumber: 1)
    }
    if !self.recordSpecIDPrefix.isEmpty {
      try visitor.visitSingularBytesField(value: self.recordSpecIDPrefix, fieldNumber: 2)
    }
    if !self.recordSpecIDContractSpecUuid.isEmpty {
      try visitor.visitSingularBytesField(value: self.recordSpecIDContractSpecUuid, fieldNumber: 3)
    }
    if !self.recordSpecIDHashedName.isEmpty {
      try visitor.visitSingularBytesField(value: self.recordSpecIDHashedName, fieldNumber: 4)
    }
    if !self.recordSpecAddr.isEmpty {
      try visitor.visitSingularStringField(value: self.recordSpecAddr, fieldNumber: 5)
    }
    if let v = self._contractSpecIDInfo {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 6)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Provenance_Metadata_V1_RecordSpecIdInfo, rhs: Provenance_Metadata_V1_RecordSpecIdInfo) -> Bool {
    if lhs.recordSpecID != rhs.recordSpecID {return false}
    if lhs.recordSpecIDPrefix != rhs.recordSpecIDPrefix {return false}
    if lhs.recordSpecIDContractSpecUuid != rhs.recordSpecIDContractSpecUuid {return false}
    if lhs.recordSpecIDHashedName != rhs.recordSpecIDHashedName {return false}
    if lhs.recordSpecAddr != rhs.recordSpecAddr {return false}
    if lhs._contractSpecIDInfo != rhs._contractSpecIDInfo {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}