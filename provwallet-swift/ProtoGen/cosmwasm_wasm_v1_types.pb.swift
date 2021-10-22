// DO NOT EDIT.
// swift-format-ignore-file
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: cosmwasm/wasm/v1/types.proto
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

/// AccessType permission types
enum Cosmwasm_Wasm_V1_AccessType: SwiftProtobuf.Enum {
  typealias RawValue = Int

  /// AccessTypeUnspecified placeholder for empty value
  case unspecified // = 0

  /// AccessTypeNobody forbidden
  case nobody // = 1

  /// AccessTypeOnlyAddress restricted to an address
  case onlyAddress // = 2

  /// AccessTypeEverybody unrestricted
  case everybody // = 3
  case UNRECOGNIZED(Int)

  init() {
    self = .unspecified
  }

  init?(rawValue: Int) {
    switch rawValue {
    case 0: self = .unspecified
    case 1: self = .nobody
    case 2: self = .onlyAddress
    case 3: self = .everybody
    default: self = .UNRECOGNIZED(rawValue)
    }
  }

  var rawValue: Int {
    switch self {
    case .unspecified: return 0
    case .nobody: return 1
    case .onlyAddress: return 2
    case .everybody: return 3
    case .UNRECOGNIZED(let i): return i
    }
  }

}

#if swift(>=4.2)

extension Cosmwasm_Wasm_V1_AccessType: CaseIterable {
  // The compiler won't synthesize support with the UNRECOGNIZED case.
  static var allCases: [Cosmwasm_Wasm_V1_AccessType] = [
    .unspecified,
    .nobody,
    .onlyAddress,
    .everybody,
  ]
}

#endif  // swift(>=4.2)

/// ContractCodeHistoryOperationType actions that caused a code change
enum Cosmwasm_Wasm_V1_ContractCodeHistoryOperationType: SwiftProtobuf.Enum {
  typealias RawValue = Int

  /// ContractCodeHistoryOperationTypeUnspecified placeholder for empty value
  case unspecified // = 0

  /// ContractCodeHistoryOperationTypeInit on chain contract instantiation
  case init_ // = 1

  /// ContractCodeHistoryOperationTypeMigrate code migration
  case migrate // = 2

  /// ContractCodeHistoryOperationTypeGenesis based on genesis data
  case genesis // = 3
  case UNRECOGNIZED(Int)

  init() {
    self = .unspecified
  }

  init?(rawValue: Int) {
    switch rawValue {
    case 0: self = .unspecified
    case 1: self = .init_
    case 2: self = .migrate
    case 3: self = .genesis
    default: self = .UNRECOGNIZED(rawValue)
    }
  }

  var rawValue: Int {
    switch self {
    case .unspecified: return 0
    case .init_: return 1
    case .migrate: return 2
    case .genesis: return 3
    case .UNRECOGNIZED(let i): return i
    }
  }

}

#if swift(>=4.2)

extension Cosmwasm_Wasm_V1_ContractCodeHistoryOperationType: CaseIterable {
  // The compiler won't synthesize support with the UNRECOGNIZED case.
  static var allCases: [Cosmwasm_Wasm_V1_ContractCodeHistoryOperationType] = [
    .unspecified,
    .init_,
    .migrate,
    .genesis,
  ]
}

#endif  // swift(>=4.2)

/// AccessTypeParam
struct Cosmwasm_Wasm_V1_AccessTypeParam {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var value: Cosmwasm_Wasm_V1_AccessType = .unspecified

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

/// AccessConfig access control type.
struct Cosmwasm_Wasm_V1_AccessConfig {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var permission: Cosmwasm_Wasm_V1_AccessType = .unspecified

  var address: String = String()

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

/// Params defines the set of wasm parameters.
struct Cosmwasm_Wasm_V1_Params {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var codeUploadAccess: Cosmwasm_Wasm_V1_AccessConfig {
    get {return _codeUploadAccess ?? Cosmwasm_Wasm_V1_AccessConfig()}
    set {_codeUploadAccess = newValue}
  }
  /// Returns true if `codeUploadAccess` has been explicitly set.
  var hasCodeUploadAccess: Bool {return self._codeUploadAccess != nil}
  /// Clears the value of `codeUploadAccess`. Subsequent reads from it will return its default value.
  mutating func clearCodeUploadAccess() {self._codeUploadAccess = nil}

  var instantiateDefaultPermission: Cosmwasm_Wasm_V1_AccessType = .unspecified

  var maxWasmCodeSize: UInt64 = 0

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}

  fileprivate var _codeUploadAccess: Cosmwasm_Wasm_V1_AccessConfig? = nil
}

/// CodeInfo is data for the uploaded contract WASM code
struct Cosmwasm_Wasm_V1_CodeInfo {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// CodeHash is the unique identifier created by wasmvm
  var codeHash: Data = Data()

  /// Creator address who initially stored the code
  var creator: String = String()

  /// InstantiateConfig access control to apply on contract creation, optional
  var instantiateConfig: Cosmwasm_Wasm_V1_AccessConfig {
    get {return _instantiateConfig ?? Cosmwasm_Wasm_V1_AccessConfig()}
    set {_instantiateConfig = newValue}
  }
  /// Returns true if `instantiateConfig` has been explicitly set.
  var hasInstantiateConfig: Bool {return self._instantiateConfig != nil}
  /// Clears the value of `instantiateConfig`. Subsequent reads from it will return its default value.
  mutating func clearInstantiateConfig() {self._instantiateConfig = nil}

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}

  fileprivate var _instantiateConfig: Cosmwasm_Wasm_V1_AccessConfig? = nil
}

/// ContractInfo stores a WASM contract instance
struct Cosmwasm_Wasm_V1_ContractInfo {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// CodeID is the reference to the stored Wasm code
  var codeID: UInt64 = 0

  /// Creator address who initially instantiated the contract
  var creator: String = String()

  /// Admin is an optional address that can execute migrations
  var admin: String = String()

  /// Label is optional metadata to be stored with a contract instance.
  var label: String = String()

  /// Created Tx position when the contract was instantiated.
  /// This data should kept internal and not be exposed via query results. Just
  /// use for sorting
  var created: Cosmwasm_Wasm_V1_AbsoluteTxPosition {
    get {return _created ?? Cosmwasm_Wasm_V1_AbsoluteTxPosition()}
    set {_created = newValue}
  }
  /// Returns true if `created` has been explicitly set.
  var hasCreated: Bool {return self._created != nil}
  /// Clears the value of `created`. Subsequent reads from it will return its default value.
  mutating func clearCreated() {self._created = nil}

  var ibcPortID: String = String()

  /// Extension is an extension point to store custom metadata within the
  /// persistence model.
  var `extension`: SwiftProtobuf.Google_Protobuf_Any {
    get {return _extension ?? SwiftProtobuf.Google_Protobuf_Any()}
    set {_extension = newValue}
  }
  /// Returns true if ``extension`` has been explicitly set.
  var hasExtension: Bool {return self._extension != nil}
  /// Clears the value of ``extension``. Subsequent reads from it will return its default value.
  mutating func clearExtension() {self._extension = nil}

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}

  fileprivate var _created: Cosmwasm_Wasm_V1_AbsoluteTxPosition? = nil
  fileprivate var _extension: SwiftProtobuf.Google_Protobuf_Any? = nil
}

/// ContractCodeHistoryEntry metadata to a contract.
struct Cosmwasm_Wasm_V1_ContractCodeHistoryEntry {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var operation: Cosmwasm_Wasm_V1_ContractCodeHistoryOperationType = .unspecified

  /// CodeID is the reference to the stored WASM code
  var codeID: UInt64 = 0

  /// Updated Tx position when the operation was executed.
  var updated: Cosmwasm_Wasm_V1_AbsoluteTxPosition {
    get {return _updated ?? Cosmwasm_Wasm_V1_AbsoluteTxPosition()}
    set {_updated = newValue}
  }
  /// Returns true if `updated` has been explicitly set.
  var hasUpdated: Bool {return self._updated != nil}
  /// Clears the value of `updated`. Subsequent reads from it will return its default value.
  mutating func clearUpdated() {self._updated = nil}

  var msg: Data = Data()

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}

  fileprivate var _updated: Cosmwasm_Wasm_V1_AbsoluteTxPosition? = nil
}

/// AbsoluteTxPosition is a unique transaction position that allows for global
/// ordering of transactions.
struct Cosmwasm_Wasm_V1_AbsoluteTxPosition {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// BlockHeight is the block the contract was created at
  var blockHeight: UInt64 = 0

  /// TxIndex is a monotonic counter within the block (actual transaction index,
  /// or gas consumed)
  var txIndex: UInt64 = 0

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

/// Model is a struct that holds a KV pair
struct Cosmwasm_Wasm_V1_Model {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// hex-encode key to read it better (this is often ascii)
  var key: Data = Data()

  /// base64-encode raw value
  var value: Data = Data()

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "cosmwasm.wasm.v1"

extension Cosmwasm_Wasm_V1_AccessType: SwiftProtobuf._ProtoNameProviding {
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    0: .same(proto: "ACCESS_TYPE_UNSPECIFIED"),
    1: .same(proto: "ACCESS_TYPE_NOBODY"),
    2: .same(proto: "ACCESS_TYPE_ONLY_ADDRESS"),
    3: .same(proto: "ACCESS_TYPE_EVERYBODY"),
  ]
}

extension Cosmwasm_Wasm_V1_ContractCodeHistoryOperationType: SwiftProtobuf._ProtoNameProviding {
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    0: .same(proto: "CONTRACT_CODE_HISTORY_OPERATION_TYPE_UNSPECIFIED"),
    1: .same(proto: "CONTRACT_CODE_HISTORY_OPERATION_TYPE_INIT"),
    2: .same(proto: "CONTRACT_CODE_HISTORY_OPERATION_TYPE_MIGRATE"),
    3: .same(proto: "CONTRACT_CODE_HISTORY_OPERATION_TYPE_GENESIS"),
  ]
}

extension Cosmwasm_Wasm_V1_AccessTypeParam: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".AccessTypeParam"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "value"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularEnumField(value: &self.value) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if self.value != .unspecified {
      try visitor.visitSingularEnumField(value: self.value, fieldNumber: 1)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Cosmwasm_Wasm_V1_AccessTypeParam, rhs: Cosmwasm_Wasm_V1_AccessTypeParam) -> Bool {
    if lhs.value != rhs.value {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Cosmwasm_Wasm_V1_AccessConfig: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".AccessConfig"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "permission"),
    2: .same(proto: "address"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularEnumField(value: &self.permission) }()
      case 2: try { try decoder.decodeSingularStringField(value: &self.address) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if self.permission != .unspecified {
      try visitor.visitSingularEnumField(value: self.permission, fieldNumber: 1)
    }
    if !self.address.isEmpty {
      try visitor.visitSingularStringField(value: self.address, fieldNumber: 2)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Cosmwasm_Wasm_V1_AccessConfig, rhs: Cosmwasm_Wasm_V1_AccessConfig) -> Bool {
    if lhs.permission != rhs.permission {return false}
    if lhs.address != rhs.address {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Cosmwasm_Wasm_V1_Params: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".Params"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "code_upload_access"),
    2: .standard(proto: "instantiate_default_permission"),
    3: .standard(proto: "max_wasm_code_size"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularMessageField(value: &self._codeUploadAccess) }()
      case 2: try { try decoder.decodeSingularEnumField(value: &self.instantiateDefaultPermission) }()
      case 3: try { try decoder.decodeSingularUInt64Field(value: &self.maxWasmCodeSize) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if let v = self._codeUploadAccess {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 1)
    }
    if self.instantiateDefaultPermission != .unspecified {
      try visitor.visitSingularEnumField(value: self.instantiateDefaultPermission, fieldNumber: 2)
    }
    if self.maxWasmCodeSize != 0 {
      try visitor.visitSingularUInt64Field(value: self.maxWasmCodeSize, fieldNumber: 3)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Cosmwasm_Wasm_V1_Params, rhs: Cosmwasm_Wasm_V1_Params) -> Bool {
    if lhs._codeUploadAccess != rhs._codeUploadAccess {return false}
    if lhs.instantiateDefaultPermission != rhs.instantiateDefaultPermission {return false}
    if lhs.maxWasmCodeSize != rhs.maxWasmCodeSize {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Cosmwasm_Wasm_V1_CodeInfo: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".CodeInfo"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "code_hash"),
    2: .same(proto: "creator"),
    5: .standard(proto: "instantiate_config"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularBytesField(value: &self.codeHash) }()
      case 2: try { try decoder.decodeSingularStringField(value: &self.creator) }()
      case 5: try { try decoder.decodeSingularMessageField(value: &self._instantiateConfig) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.codeHash.isEmpty {
      try visitor.visitSingularBytesField(value: self.codeHash, fieldNumber: 1)
    }
    if !self.creator.isEmpty {
      try visitor.visitSingularStringField(value: self.creator, fieldNumber: 2)
    }
    if let v = self._instantiateConfig {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 5)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Cosmwasm_Wasm_V1_CodeInfo, rhs: Cosmwasm_Wasm_V1_CodeInfo) -> Bool {
    if lhs.codeHash != rhs.codeHash {return false}
    if lhs.creator != rhs.creator {return false}
    if lhs._instantiateConfig != rhs._instantiateConfig {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Cosmwasm_Wasm_V1_ContractInfo: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".ContractInfo"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "code_id"),
    2: .same(proto: "creator"),
    3: .same(proto: "admin"),
    4: .same(proto: "label"),
    5: .same(proto: "created"),
    6: .standard(proto: "ibc_port_id"),
    7: .same(proto: "extension"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularUInt64Field(value: &self.codeID) }()
      case 2: try { try decoder.decodeSingularStringField(value: &self.creator) }()
      case 3: try { try decoder.decodeSingularStringField(value: &self.admin) }()
      case 4: try { try decoder.decodeSingularStringField(value: &self.label) }()
      case 5: try { try decoder.decodeSingularMessageField(value: &self._created) }()
      case 6: try { try decoder.decodeSingularStringField(value: &self.ibcPortID) }()
      case 7: try { try decoder.decodeSingularMessageField(value: &self._extension) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if self.codeID != 0 {
      try visitor.visitSingularUInt64Field(value: self.codeID, fieldNumber: 1)
    }
    if !self.creator.isEmpty {
      try visitor.visitSingularStringField(value: self.creator, fieldNumber: 2)
    }
    if !self.admin.isEmpty {
      try visitor.visitSingularStringField(value: self.admin, fieldNumber: 3)
    }
    if !self.label.isEmpty {
      try visitor.visitSingularStringField(value: self.label, fieldNumber: 4)
    }
    if let v = self._created {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 5)
    }
    if !self.ibcPortID.isEmpty {
      try visitor.visitSingularStringField(value: self.ibcPortID, fieldNumber: 6)
    }
    if let v = self._extension {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 7)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Cosmwasm_Wasm_V1_ContractInfo, rhs: Cosmwasm_Wasm_V1_ContractInfo) -> Bool {
    if lhs.codeID != rhs.codeID {return false}
    if lhs.creator != rhs.creator {return false}
    if lhs.admin != rhs.admin {return false}
    if lhs.label != rhs.label {return false}
    if lhs._created != rhs._created {return false}
    if lhs.ibcPortID != rhs.ibcPortID {return false}
    if lhs._extension != rhs._extension {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Cosmwasm_Wasm_V1_ContractCodeHistoryEntry: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".ContractCodeHistoryEntry"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "operation"),
    2: .standard(proto: "code_id"),
    3: .same(proto: "updated"),
    4: .same(proto: "msg"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularEnumField(value: &self.operation) }()
      case 2: try { try decoder.decodeSingularUInt64Field(value: &self.codeID) }()
      case 3: try { try decoder.decodeSingularMessageField(value: &self._updated) }()
      case 4: try { try decoder.decodeSingularBytesField(value: &self.msg) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if self.operation != .unspecified {
      try visitor.visitSingularEnumField(value: self.operation, fieldNumber: 1)
    }
    if self.codeID != 0 {
      try visitor.visitSingularUInt64Field(value: self.codeID, fieldNumber: 2)
    }
    if let v = self._updated {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 3)
    }
    if !self.msg.isEmpty {
      try visitor.visitSingularBytesField(value: self.msg, fieldNumber: 4)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Cosmwasm_Wasm_V1_ContractCodeHistoryEntry, rhs: Cosmwasm_Wasm_V1_ContractCodeHistoryEntry) -> Bool {
    if lhs.operation != rhs.operation {return false}
    if lhs.codeID != rhs.codeID {return false}
    if lhs._updated != rhs._updated {return false}
    if lhs.msg != rhs.msg {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Cosmwasm_Wasm_V1_AbsoluteTxPosition: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".AbsoluteTxPosition"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "block_height"),
    2: .standard(proto: "tx_index"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularUInt64Field(value: &self.blockHeight) }()
      case 2: try { try decoder.decodeSingularUInt64Field(value: &self.txIndex) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if self.blockHeight != 0 {
      try visitor.visitSingularUInt64Field(value: self.blockHeight, fieldNumber: 1)
    }
    if self.txIndex != 0 {
      try visitor.visitSingularUInt64Field(value: self.txIndex, fieldNumber: 2)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Cosmwasm_Wasm_V1_AbsoluteTxPosition, rhs: Cosmwasm_Wasm_V1_AbsoluteTxPosition) -> Bool {
    if lhs.blockHeight != rhs.blockHeight {return false}
    if lhs.txIndex != rhs.txIndex {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Cosmwasm_Wasm_V1_Model: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".Model"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "key"),
    2: .same(proto: "value"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularBytesField(value: &self.key) }()
      case 2: try { try decoder.decodeSingularBytesField(value: &self.value) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.key.isEmpty {
      try visitor.visitSingularBytesField(value: self.key, fieldNumber: 1)
    }
    if !self.value.isEmpty {
      try visitor.visitSingularBytesField(value: self.value, fieldNumber: 2)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Cosmwasm_Wasm_V1_Model, rhs: Cosmwasm_Wasm_V1_Model) -> Bool {
    if lhs.key != rhs.key {return false}
    if lhs.value != rhs.value {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}
