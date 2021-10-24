// DO NOT EDIT.
// swift-format-ignore-file
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: provenance/metadata/v0/types.proto
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

public enum Types_PublicKeyType: SwiftProtobuf.Enum {
  public typealias RawValue = Int
  case elliptic // = 0
  case UNRECOGNIZED(Int)

  public init() {
    self = .elliptic
  }

  public init?(rawValue: Int) {
    switch rawValue {
    case 0: self = .elliptic
    default: self = .UNRECOGNIZED(rawValue)
    }
  }

  public var rawValue: Int {
    switch self {
    case .elliptic: return 0
    case .UNRECOGNIZED(let i): return i
    }
  }

}

#if swift(>=4.2)

extension Types_PublicKeyType: CaseIterable {
  // The compiler won't synthesize support with the UNRECOGNIZED case.
  public static var allCases: [Types_PublicKeyType] = [
    .elliptic,
  ]
}

#endif  // swift(>=4.2)

public enum Types_PublicKeyCurve: SwiftProtobuf.Enum {
  public typealias RawValue = Int
  case secp256K1 // = 0
  case p256 // = 1
  case UNRECOGNIZED(Int)

  public init() {
    self = .secp256K1
  }

  public init?(rawValue: Int) {
    switch rawValue {
    case 0: self = .secp256K1
    case 1: self = .p256
    default: self = .UNRECOGNIZED(rawValue)
    }
  }

  public var rawValue: Int {
    switch self {
    case .secp256K1: return 0
    case .p256: return 1
    case .UNRECOGNIZED(let i): return i
    }
  }

}

#if swift(>=4.2)

extension Types_PublicKeyCurve: CaseIterable {
  // The compiler won't synthesize support with the UNRECOGNIZED case.
  public static var allCases: [Types_PublicKeyCurve] = [
    .secp256K1,
    .p256,
  ]
}

#endif  // swift(>=4.2)

public enum Types_PartyType: SwiftProtobuf.Enum {
  public typealias RawValue = Int
  case unknown // = 0
  case originator // = 1
  case servicer // = 2
  case investor // = 3
  case custodian // = 4
  case owner // = 5
  case affiliate // = 6
  case omnibus // = 7
  case provenance // = 8
  case marker // = 9
  case UNRECOGNIZED(Int)

  public init() {
    self = .unknown
  }

  public init?(rawValue: Int) {
    switch rawValue {
    case 0: self = .unknown
    case 1: self = .originator
    case 2: self = .servicer
    case 3: self = .investor
    case 4: self = .custodian
    case 5: self = .owner
    case 6: self = .affiliate
    case 7: self = .omnibus
    case 8: self = .provenance
    case 9: self = .marker
    default: self = .UNRECOGNIZED(rawValue)
    }
  }

  public var rawValue: Int {
    switch self {
    case .unknown: return 0
    case .originator: return 1
    case .servicer: return 2
    case .investor: return 3
    case .custodian: return 4
    case .owner: return 5
    case .affiliate: return 6
    case .omnibus: return 7
    case .provenance: return 8
    case .marker: return 9
    case .UNRECOGNIZED(let i): return i
    }
  }

}

#if swift(>=4.2)

extension Types_PartyType: CaseIterable {
  // The compiler won't synthesize support with the UNRECOGNIZED case.
  public static var allCases: [Types_PartyType] = [
    .unknown,
    .originator,
    .servicer,
    .investor,
    .custodian,
    .owner,
    .affiliate,
    .omnibus,
    .provenance,
    .marker,
  ]
}

#endif  // swift(>=4.2)

/// Wrapper for an ISO8601 date string. EX: "2020-05-22"
public struct Types_Date {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  public var value: String = String()

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}
}

/// Wrapper type for a standard uuid.
public struct Types_UUID {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  public var value: String = String()

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}
}

/// Wrap a boolean result type.
public struct Types_BooleanResult {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  public var value: Bool = false

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}
}

/// Wrap a location.
public struct Types_Location {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  public var ref: Types_ProvenanceReference {
    get {return _ref ?? Types_ProvenanceReference()}
    set {_ref = newValue}
  }
  /// Returns true if `ref` has been explicitly set.
  public var hasRef: Bool {return self._ref != nil}
  /// Clears the value of `ref`. Subsequent reads from it will return its default value.
  public mutating func clearRef() {self._ref = nil}

  public var classname: String = String()

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}

  fileprivate var _ref: Types_ProvenanceReference? = nil
}

/// Wrap a factual data element.
public struct Types_Fact {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  public var name: String = String()

  public var dataLocation: Types_Location {
    get {return _dataLocation ?? Types_Location()}
    set {_dataLocation = newValue}
  }
  /// Returns true if `dataLocation` has been explicitly set.
  public var hasDataLocation: Bool {return self._dataLocation != nil}
  /// Clears the value of `dataLocation`. Subsequent reads from it will return its default value.
  public mutating func clearDataLocation() {self._dataLocation = nil}

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}

  fileprivate var _dataLocation: Types_Location? = nil
}

public struct Types_ProvenanceReference {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// [Req] [Scope.uuid]
  /// Scope ID
  public var scopeUuid: Types_UUID {
    get {return _scopeUuid ?? Types_UUID()}
    set {_scopeUuid = newValue}
  }
  /// Returns true if `scopeUuid` has been explicitly set.
  public var hasScopeUuid: Bool {return self._scopeUuid != nil}
  /// Clears the value of `scopeUuid`. Subsequent reads from it will return its default value.
  public mutating func clearScopeUuid() {self._scopeUuid = nil}

  /// [Opt] [RecordGroup.group_uuid]
  /// require record to be within a specific group
  public var groupUuid: Types_UUID {
    get {return _groupUuid ?? Types_UUID()}
    set {_groupUuid = newValue}
  }
  /// Returns true if `groupUuid` has been explicitly set.
  public var hasGroupUuid: Bool {return self._groupUuid != nil}
  /// Clears the value of `groupUuid`. Subsequent reads from it will return its default value.
  public mutating func clearGroupUuid() {self._groupUuid = nil}

  /// [Opt] [Record.result_hash]
  /// specify a specific record inside a scope (and group) by result-hash
  public var hash: String = String()

  /// [Opt] [Record.result_name]
  /// specify a result-name of a record within a scope
  public var name: String = String()

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}

  fileprivate var _scopeUuid: Types_UUID? = nil
  fileprivate var _groupUuid: Types_UUID? = nil
}

/// Wrapper around a standard signature.
public struct Types_Signature {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// Signature Detail
  public var algo: String = String()

  public var provider: String = String()

  public var signature: String = String()

  /// Identity of signer
  public var signer: Types_SigningAndEncryptionPublicKeys {
    get {return _signer ?? Types_SigningAndEncryptionPublicKeys()}
    set {_signer = newValue}
  }
  /// Returns true if `signer` has been explicitly set.
  public var hasSigner: Bool {return self._signer != nil}
  /// Clears the value of `signer`. Subsequent reads from it will return its default value.
  public mutating func clearSigner() {self._signer = nil}

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}

  fileprivate var _signer: Types_SigningAndEncryptionPublicKeys? = nil
}

/// A collection of signatures
public struct Types_SignatureSet {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  public var signatures: [Types_Signature] = []

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}
}

public struct Types_PublicKey {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  public var publicKeyBytes: Data = Data()

  public var type: Types_PublicKeyType = .elliptic

  public var curve: Types_PublicKeyCurve = .secp256K1

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}
}

public struct Types_SigningAndEncryptionPublicKeys {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  public var signingPublicKey: Types_PublicKey {
    get {return _signingPublicKey ?? Types_PublicKey()}
    set {_signingPublicKey = newValue}
  }
  /// Returns true if `signingPublicKey` has been explicitly set.
  public var hasSigningPublicKey: Bool {return self._signingPublicKey != nil}
  /// Clears the value of `signingPublicKey`. Subsequent reads from it will return its default value.
  public mutating func clearSigningPublicKey() {self._signingPublicKey = nil}

  public var encryptionPublicKey: Types_PublicKey {
    get {return _encryptionPublicKey ?? Types_PublicKey()}
    set {_encryptionPublicKey = newValue}
  }
  /// Returns true if `encryptionPublicKey` has been explicitly set.
  public var hasEncryptionPublicKey: Bool {return self._encryptionPublicKey != nil}
  /// Clears the value of `encryptionPublicKey`. Subsequent reads from it will return its default value.
  public mutating func clearEncryptionPublicKey() {self._encryptionPublicKey = nil}

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}

  fileprivate var _signingPublicKey: Types_PublicKey? = nil
  fileprivate var _encryptionPublicKey: Types_PublicKey? = nil
}

/// Audit
public struct Types_AuditFields {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  public var createdDate: Types_GogoTimeHack {
    get {return _createdDate ?? Types_GogoTimeHack()}
    set {_createdDate = newValue}
  }
  /// Returns true if `createdDate` has been explicitly set.
  public var hasCreatedDate: Bool {return self._createdDate != nil}
  /// Clears the value of `createdDate`. Subsequent reads from it will return its default value.
  public mutating func clearCreatedDate() {self._createdDate = nil}

  public var createdBy: String = String()

  public var updatedDate: Types_GogoTimeHack {
    get {return _updatedDate ?? Types_GogoTimeHack()}
    set {_updatedDate = newValue}
  }
  /// Returns true if `updatedDate` has been explicitly set.
  public var hasUpdatedDate: Bool {return self._updatedDate != nil}
  /// Clears the value of `updatedDate`. Subsequent reads from it will return its default value.
  public mutating func clearUpdatedDate() {self._updatedDate = nil}

  public var updatedBy: String = String()

  public var version: Int32 = 0

  public var message: String = String()

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}

  fileprivate var _createdDate: Types_GogoTimeHack? = nil
  fileprivate var _updatedDate: Types_GogoTimeHack? = nil
}

/// proto 3 timestamp structure (hack to get around gogo issues with invalid dates)
public struct Types_GogoTimeHack {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  public var seconds: Int64 = 0

  public var nanos: Int32 = 0

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}
}

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "types"

extension Types_PublicKeyType: SwiftProtobuf._ProtoNameProviding {
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    0: .same(proto: "ELLIPTIC"),
  ]
}

extension Types_PublicKeyCurve: SwiftProtobuf._ProtoNameProviding {
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    0: .same(proto: "SECP256K1"),
    1: .same(proto: "P256"),
  ]
}

extension Types_PartyType: SwiftProtobuf._ProtoNameProviding {
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    0: .same(proto: "PARTY_TYPE_UNKNOWN"),
    1: .same(proto: "PARTY_TYPE_ORIGINATOR"),
    2: .same(proto: "PARTY_TYPE_SERVICER"),
    3: .same(proto: "PARTY_TYPE_INVESTOR"),
    4: .same(proto: "PARTY_TYPE_CUSTODIAN"),
    5: .same(proto: "PARTY_TYPE_OWNER"),
    6: .same(proto: "PARTY_TYPE_AFFILIATE"),
    7: .same(proto: "PARTY_TYPE_OMNIBUS"),
    8: .same(proto: "PARTY_TYPE_PROVENANCE"),
    9: .same(proto: "PARTY_TYPE_MARKER"),
  ]
}

extension Types_Date: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".Date"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "value"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.value) }()
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.value.isEmpty {
      try visitor.visitSingularStringField(value: self.value, fieldNumber: 1)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Types_Date, rhs: Types_Date) -> Bool {
    if lhs.value != rhs.value {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Types_UUID: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".UUID"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "value"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.value) }()
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.value.isEmpty {
      try visitor.visitSingularStringField(value: self.value, fieldNumber: 1)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Types_UUID, rhs: Types_UUID) -> Bool {
    if lhs.value != rhs.value {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Types_BooleanResult: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".BooleanResult"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "value"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularBoolField(value: &self.value) }()
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if self.value != false {
      try visitor.visitSingularBoolField(value: self.value, fieldNumber: 1)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Types_BooleanResult, rhs: Types_BooleanResult) -> Bool {
    if lhs.value != rhs.value {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Types_Location: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".Location"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "ref"),
    2: .same(proto: "classname"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularMessageField(value: &self._ref) }()
      case 2: try { try decoder.decodeSingularStringField(value: &self.classname) }()
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if let v = self._ref {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 1)
    }
    if !self.classname.isEmpty {
      try visitor.visitSingularStringField(value: self.classname, fieldNumber: 2)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Types_Location, rhs: Types_Location) -> Bool {
    if lhs._ref != rhs._ref {return false}
    if lhs.classname != rhs.classname {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Types_Fact: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".Fact"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "name"),
    2: .standard(proto: "data_location"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.name) }()
      case 2: try { try decoder.decodeSingularMessageField(value: &self._dataLocation) }()
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.name.isEmpty {
      try visitor.visitSingularStringField(value: self.name, fieldNumber: 1)
    }
    if let v = self._dataLocation {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 2)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Types_Fact, rhs: Types_Fact) -> Bool {
    if lhs.name != rhs.name {return false}
    if lhs._dataLocation != rhs._dataLocation {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Types_ProvenanceReference: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".ProvenanceReference"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "scope_uuid"),
    2: .standard(proto: "group_uuid"),
    3: .same(proto: "hash"),
    4: .same(proto: "name"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularMessageField(value: &self._scopeUuid) }()
      case 2: try { try decoder.decodeSingularMessageField(value: &self._groupUuid) }()
      case 3: try { try decoder.decodeSingularStringField(value: &self.hash) }()
      case 4: try { try decoder.decodeSingularStringField(value: &self.name) }()
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if let v = self._scopeUuid {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 1)
    }
    if let v = self._groupUuid {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 2)
    }
    if !self.hash.isEmpty {
      try visitor.visitSingularStringField(value: self.hash, fieldNumber: 3)
    }
    if !self.name.isEmpty {
      try visitor.visitSingularStringField(value: self.name, fieldNumber: 4)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Types_ProvenanceReference, rhs: Types_ProvenanceReference) -> Bool {
    if lhs._scopeUuid != rhs._scopeUuid {return false}
    if lhs._groupUuid != rhs._groupUuid {return false}
    if lhs.hash != rhs.hash {return false}
    if lhs.name != rhs.name {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Types_Signature: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".Signature"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "algo"),
    2: .same(proto: "provider"),
    3: .same(proto: "signature"),
    4: .same(proto: "signer"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.algo) }()
      case 2: try { try decoder.decodeSingularStringField(value: &self.provider) }()
      case 3: try { try decoder.decodeSingularStringField(value: &self.signature) }()
      case 4: try { try decoder.decodeSingularMessageField(value: &self._signer) }()
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.algo.isEmpty {
      try visitor.visitSingularStringField(value: self.algo, fieldNumber: 1)
    }
    if !self.provider.isEmpty {
      try visitor.visitSingularStringField(value: self.provider, fieldNumber: 2)
    }
    if !self.signature.isEmpty {
      try visitor.visitSingularStringField(value: self.signature, fieldNumber: 3)
    }
    if let v = self._signer {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 4)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Types_Signature, rhs: Types_Signature) -> Bool {
    if lhs.algo != rhs.algo {return false}
    if lhs.provider != rhs.provider {return false}
    if lhs.signature != rhs.signature {return false}
    if lhs._signer != rhs._signer {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Types_SignatureSet: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".SignatureSet"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "signatures"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeRepeatedMessageField(value: &self.signatures) }()
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.signatures.isEmpty {
      try visitor.visitRepeatedMessageField(value: self.signatures, fieldNumber: 1)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Types_SignatureSet, rhs: Types_SignatureSet) -> Bool {
    if lhs.signatures != rhs.signatures {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Types_PublicKey: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".PublicKey"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "public_key_bytes"),
    2: .same(proto: "type"),
    3: .same(proto: "curve"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularBytesField(value: &self.publicKeyBytes) }()
      case 2: try { try decoder.decodeSingularEnumField(value: &self.type) }()
      case 3: try { try decoder.decodeSingularEnumField(value: &self.curve) }()
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.publicKeyBytes.isEmpty {
      try visitor.visitSingularBytesField(value: self.publicKeyBytes, fieldNumber: 1)
    }
    if self.type != .elliptic {
      try visitor.visitSingularEnumField(value: self.type, fieldNumber: 2)
    }
    if self.curve != .secp256K1 {
      try visitor.visitSingularEnumField(value: self.curve, fieldNumber: 3)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Types_PublicKey, rhs: Types_PublicKey) -> Bool {
    if lhs.publicKeyBytes != rhs.publicKeyBytes {return false}
    if lhs.type != rhs.type {return false}
    if lhs.curve != rhs.curve {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Types_SigningAndEncryptionPublicKeys: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".SigningAndEncryptionPublicKeys"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "signing_public_key"),
    2: .standard(proto: "encryption_public_key"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularMessageField(value: &self._signingPublicKey) }()
      case 2: try { try decoder.decodeSingularMessageField(value: &self._encryptionPublicKey) }()
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if let v = self._signingPublicKey {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 1)
    }
    if let v = self._encryptionPublicKey {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 2)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Types_SigningAndEncryptionPublicKeys, rhs: Types_SigningAndEncryptionPublicKeys) -> Bool {
    if lhs._signingPublicKey != rhs._signingPublicKey {return false}
    if lhs._encryptionPublicKey != rhs._encryptionPublicKey {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Types_AuditFields: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".AuditFields"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "created_date"),
    2: .standard(proto: "created_by"),
    3: .standard(proto: "updated_date"),
    4: .standard(proto: "updated_by"),
    5: .same(proto: "version"),
    6: .same(proto: "message"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularMessageField(value: &self._createdDate) }()
      case 2: try { try decoder.decodeSingularStringField(value: &self.createdBy) }()
      case 3: try { try decoder.decodeSingularMessageField(value: &self._updatedDate) }()
      case 4: try { try decoder.decodeSingularStringField(value: &self.updatedBy) }()
      case 5: try { try decoder.decodeSingularInt32Field(value: &self.version) }()
      case 6: try { try decoder.decodeSingularStringField(value: &self.message) }()
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if let v = self._createdDate {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 1)
    }
    if !self.createdBy.isEmpty {
      try visitor.visitSingularStringField(value: self.createdBy, fieldNumber: 2)
    }
    if let v = self._updatedDate {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 3)
    }
    if !self.updatedBy.isEmpty {
      try visitor.visitSingularStringField(value: self.updatedBy, fieldNumber: 4)
    }
    if self.version != 0 {
      try visitor.visitSingularInt32Field(value: self.version, fieldNumber: 5)
    }
    if !self.message.isEmpty {
      try visitor.visitSingularStringField(value: self.message, fieldNumber: 6)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Types_AuditFields, rhs: Types_AuditFields) -> Bool {
    if lhs._createdDate != rhs._createdDate {return false}
    if lhs.createdBy != rhs.createdBy {return false}
    if lhs._updatedDate != rhs._updatedDate {return false}
    if lhs.updatedBy != rhs.updatedBy {return false}
    if lhs.version != rhs.version {return false}
    if lhs.message != rhs.message {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Types_GogoTimeHack: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".GogoTimeHack"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "seconds"),
    2: .same(proto: "nanos"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularInt64Field(value: &self.seconds) }()
      case 2: try { try decoder.decodeSingularInt32Field(value: &self.nanos) }()
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if self.seconds != 0 {
      try visitor.visitSingularInt64Field(value: self.seconds, fieldNumber: 1)
    }
    if self.nanos != 0 {
      try visitor.visitSingularInt32Field(value: self.nanos, fieldNumber: 2)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Types_GogoTimeHack, rhs: Types_GogoTimeHack) -> Bool {
    if lhs.seconds != rhs.seconds {return false}
    if lhs.nanos != rhs.nanos {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}