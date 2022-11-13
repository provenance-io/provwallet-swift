// DO NOT EDIT.
// swift-format-ignore-file
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: ibc/core/connection/v1/tx.proto
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

/// MsgConnectionOpenInit defines the msg sent by an account on Chain A to
/// initialize a connection with Chain B.
public struct Ibc_Core_Connection_V1_MsgConnectionOpenInit {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  public var clientID: String = String()

  public var counterparty: Ibc_Core_Connection_V1_Counterparty {
    get {return _counterparty ?? Ibc_Core_Connection_V1_Counterparty()}
    set {_counterparty = newValue}
  }
  /// Returns true if `counterparty` has been explicitly set.
  public var hasCounterparty: Bool {return self._counterparty != nil}
  /// Clears the value of `counterparty`. Subsequent reads from it will return its default value.
  public mutating func clearCounterparty() {self._counterparty = nil}

  public var version: Ibc_Core_Connection_V1_Version {
    get {return _version ?? Ibc_Core_Connection_V1_Version()}
    set {_version = newValue}
  }
  /// Returns true if `version` has been explicitly set.
  public var hasVersion: Bool {return self._version != nil}
  /// Clears the value of `version`. Subsequent reads from it will return its default value.
  public mutating func clearVersion() {self._version = nil}

  public var delayPeriod: UInt64 = 0

  public var signer: String = String()

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}

  fileprivate var _counterparty: Ibc_Core_Connection_V1_Counterparty? = nil
  fileprivate var _version: Ibc_Core_Connection_V1_Version? = nil
}

/// MsgConnectionOpenInitResponse defines the Msg/ConnectionOpenInit response
/// type.
public struct Ibc_Core_Connection_V1_MsgConnectionOpenInitResponse {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}
}

/// MsgConnectionOpenTry defines a msg sent by a Relayer to try to open a
/// connection on Chain B.
public struct Ibc_Core_Connection_V1_MsgConnectionOpenTry {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  public var clientID: String = String()

  /// Deprecated: this field is unused. Crossing hellos are no longer supported in core IBC.
  public var previousConnectionID: String = String()

  public var clientState: SwiftProtobuf.Google_Protobuf_Any {
    get {return _clientState ?? SwiftProtobuf.Google_Protobuf_Any()}
    set {_clientState = newValue}
  }
  /// Returns true if `clientState` has been explicitly set.
  public var hasClientState: Bool {return self._clientState != nil}
  /// Clears the value of `clientState`. Subsequent reads from it will return its default value.
  public mutating func clearClientState() {self._clientState = nil}

  public var counterparty: Ibc_Core_Connection_V1_Counterparty {
    get {return _counterparty ?? Ibc_Core_Connection_V1_Counterparty()}
    set {_counterparty = newValue}
  }
  /// Returns true if `counterparty` has been explicitly set.
  public var hasCounterparty: Bool {return self._counterparty != nil}
  /// Clears the value of `counterparty`. Subsequent reads from it will return its default value.
  public mutating func clearCounterparty() {self._counterparty = nil}

  public var delayPeriod: UInt64 = 0

  public var counterpartyVersions: [Ibc_Core_Connection_V1_Version] = []

  public var proofHeight: Ibc_Core_Client_V1_Height {
    get {return _proofHeight ?? Ibc_Core_Client_V1_Height()}
    set {_proofHeight = newValue}
  }
  /// Returns true if `proofHeight` has been explicitly set.
  public var hasProofHeight: Bool {return self._proofHeight != nil}
  /// Clears the value of `proofHeight`. Subsequent reads from it will return its default value.
  public mutating func clearProofHeight() {self._proofHeight = nil}

  /// proof of the initialization the connection on Chain A: `UNITIALIZED ->
  /// INIT`
  public var proofInit: Data = Data()

  /// proof of client state included in message
  public var proofClient: Data = Data()

  /// proof of client consensus state
  public var proofConsensus: Data = Data()

  public var consensusHeight: Ibc_Core_Client_V1_Height {
    get {return _consensusHeight ?? Ibc_Core_Client_V1_Height()}
    set {_consensusHeight = newValue}
  }
  /// Returns true if `consensusHeight` has been explicitly set.
  public var hasConsensusHeight: Bool {return self._consensusHeight != nil}
  /// Clears the value of `consensusHeight`. Subsequent reads from it will return its default value.
  public mutating func clearConsensusHeight() {self._consensusHeight = nil}

  public var signer: String = String()

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}

  fileprivate var _clientState: SwiftProtobuf.Google_Protobuf_Any? = nil
  fileprivate var _counterparty: Ibc_Core_Connection_V1_Counterparty? = nil
  fileprivate var _proofHeight: Ibc_Core_Client_V1_Height? = nil
  fileprivate var _consensusHeight: Ibc_Core_Client_V1_Height? = nil
}

/// MsgConnectionOpenTryResponse defines the Msg/ConnectionOpenTry response type.
public struct Ibc_Core_Connection_V1_MsgConnectionOpenTryResponse {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}
}

/// MsgConnectionOpenAck defines a msg sent by a Relayer to Chain A to
/// acknowledge the change of connection state to TRYOPEN on Chain B.
public struct Ibc_Core_Connection_V1_MsgConnectionOpenAck {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  public var connectionID: String = String()

  public var counterpartyConnectionID: String = String()

  public var version: Ibc_Core_Connection_V1_Version {
    get {return _version ?? Ibc_Core_Connection_V1_Version()}
    set {_version = newValue}
  }
  /// Returns true if `version` has been explicitly set.
  public var hasVersion: Bool {return self._version != nil}
  /// Clears the value of `version`. Subsequent reads from it will return its default value.
  public mutating func clearVersion() {self._version = nil}

  public var clientState: SwiftProtobuf.Google_Protobuf_Any {
    get {return _clientState ?? SwiftProtobuf.Google_Protobuf_Any()}
    set {_clientState = newValue}
  }
  /// Returns true if `clientState` has been explicitly set.
  public var hasClientState: Bool {return self._clientState != nil}
  /// Clears the value of `clientState`. Subsequent reads from it will return its default value.
  public mutating func clearClientState() {self._clientState = nil}

  public var proofHeight: Ibc_Core_Client_V1_Height {
    get {return _proofHeight ?? Ibc_Core_Client_V1_Height()}
    set {_proofHeight = newValue}
  }
  /// Returns true if `proofHeight` has been explicitly set.
  public var hasProofHeight: Bool {return self._proofHeight != nil}
  /// Clears the value of `proofHeight`. Subsequent reads from it will return its default value.
  public mutating func clearProofHeight() {self._proofHeight = nil}

  /// proof of the initialization the connection on Chain B: `UNITIALIZED ->
  /// TRYOPEN`
  public var proofTry: Data = Data()

  /// proof of client state included in message
  public var proofClient: Data = Data()

  /// proof of client consensus state
  public var proofConsensus: Data = Data()

  public var consensusHeight: Ibc_Core_Client_V1_Height {
    get {return _consensusHeight ?? Ibc_Core_Client_V1_Height()}
    set {_consensusHeight = newValue}
  }
  /// Returns true if `consensusHeight` has been explicitly set.
  public var hasConsensusHeight: Bool {return self._consensusHeight != nil}
  /// Clears the value of `consensusHeight`. Subsequent reads from it will return its default value.
  public mutating func clearConsensusHeight() {self._consensusHeight = nil}

  public var signer: String = String()

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}

  fileprivate var _version: Ibc_Core_Connection_V1_Version? = nil
  fileprivate var _clientState: SwiftProtobuf.Google_Protobuf_Any? = nil
  fileprivate var _proofHeight: Ibc_Core_Client_V1_Height? = nil
  fileprivate var _consensusHeight: Ibc_Core_Client_V1_Height? = nil
}

/// MsgConnectionOpenAckResponse defines the Msg/ConnectionOpenAck response type.
public struct Ibc_Core_Connection_V1_MsgConnectionOpenAckResponse {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}
}

/// MsgConnectionOpenConfirm defines a msg sent by a Relayer to Chain B to
/// acknowledge the change of connection state to OPEN on Chain A.
public struct Ibc_Core_Connection_V1_MsgConnectionOpenConfirm {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  public var connectionID: String = String()

  /// proof for the change of the connection state on Chain A: `INIT -> OPEN`
  public var proofAck: Data = Data()

  public var proofHeight: Ibc_Core_Client_V1_Height {
    get {return _proofHeight ?? Ibc_Core_Client_V1_Height()}
    set {_proofHeight = newValue}
  }
  /// Returns true if `proofHeight` has been explicitly set.
  public var hasProofHeight: Bool {return self._proofHeight != nil}
  /// Clears the value of `proofHeight`. Subsequent reads from it will return its default value.
  public mutating func clearProofHeight() {self._proofHeight = nil}

  public var signer: String = String()

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}

  fileprivate var _proofHeight: Ibc_Core_Client_V1_Height? = nil
}

/// MsgConnectionOpenConfirmResponse defines the Msg/ConnectionOpenConfirm
/// response type.
public struct Ibc_Core_Connection_V1_MsgConnectionOpenConfirmResponse {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}
}

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "ibc.core.connection.v1"

extension Ibc_Core_Connection_V1_MsgConnectionOpenInit: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".MsgConnectionOpenInit"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "client_id"),
    2: .same(proto: "counterparty"),
    3: .same(proto: "version"),
    4: .standard(proto: "delay_period"),
    5: .same(proto: "signer"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.clientID) }()
      case 2: try { try decoder.decodeSingularMessageField(value: &self._counterparty) }()
      case 3: try { try decoder.decodeSingularMessageField(value: &self._version) }()
      case 4: try { try decoder.decodeSingularUInt64Field(value: &self.delayPeriod) }()
      case 5: try { try decoder.decodeSingularStringField(value: &self.signer) }()
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.clientID.isEmpty {
      try visitor.visitSingularStringField(value: self.clientID, fieldNumber: 1)
    }
    if let v = self._counterparty {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 2)
    }
    if let v = self._version {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 3)
    }
    if self.delayPeriod != 0 {
      try visitor.visitSingularUInt64Field(value: self.delayPeriod, fieldNumber: 4)
    }
    if !self.signer.isEmpty {
      try visitor.visitSingularStringField(value: self.signer, fieldNumber: 5)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Ibc_Core_Connection_V1_MsgConnectionOpenInit, rhs: Ibc_Core_Connection_V1_MsgConnectionOpenInit) -> Bool {
    if lhs.clientID != rhs.clientID {return false}
    if lhs._counterparty != rhs._counterparty {return false}
    if lhs._version != rhs._version {return false}
    if lhs.delayPeriod != rhs.delayPeriod {return false}
    if lhs.signer != rhs.signer {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Ibc_Core_Connection_V1_MsgConnectionOpenInitResponse: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".MsgConnectionOpenInitResponse"
  public static let _protobuf_nameMap = SwiftProtobuf._NameMap()

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let _ = try decoder.nextFieldNumber() {
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Ibc_Core_Connection_V1_MsgConnectionOpenInitResponse, rhs: Ibc_Core_Connection_V1_MsgConnectionOpenInitResponse) -> Bool {
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Ibc_Core_Connection_V1_MsgConnectionOpenTry: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".MsgConnectionOpenTry"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "client_id"),
    2: .standard(proto: "previous_connection_id"),
    3: .standard(proto: "client_state"),
    4: .same(proto: "counterparty"),
    5: .standard(proto: "delay_period"),
    6: .standard(proto: "counterparty_versions"),
    7: .standard(proto: "proof_height"),
    8: .standard(proto: "proof_init"),
    9: .standard(proto: "proof_client"),
    10: .standard(proto: "proof_consensus"),
    11: .standard(proto: "consensus_height"),
    12: .same(proto: "signer"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.clientID) }()
      case 2: try { try decoder.decodeSingularStringField(value: &self.previousConnectionID) }()
      case 3: try { try decoder.decodeSingularMessageField(value: &self._clientState) }()
      case 4: try { try decoder.decodeSingularMessageField(value: &self._counterparty) }()
      case 5: try { try decoder.decodeSingularUInt64Field(value: &self.delayPeriod) }()
      case 6: try { try decoder.decodeRepeatedMessageField(value: &self.counterpartyVersions) }()
      case 7: try { try decoder.decodeSingularMessageField(value: &self._proofHeight) }()
      case 8: try { try decoder.decodeSingularBytesField(value: &self.proofInit) }()
      case 9: try { try decoder.decodeSingularBytesField(value: &self.proofClient) }()
      case 10: try { try decoder.decodeSingularBytesField(value: &self.proofConsensus) }()
      case 11: try { try decoder.decodeSingularMessageField(value: &self._consensusHeight) }()
      case 12: try { try decoder.decodeSingularStringField(value: &self.signer) }()
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.clientID.isEmpty {
      try visitor.visitSingularStringField(value: self.clientID, fieldNumber: 1)
    }
    if !self.previousConnectionID.isEmpty {
      try visitor.visitSingularStringField(value: self.previousConnectionID, fieldNumber: 2)
    }
    if let v = self._clientState {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 3)
    }
    if let v = self._counterparty {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 4)
    }
    if self.delayPeriod != 0 {
      try visitor.visitSingularUInt64Field(value: self.delayPeriod, fieldNumber: 5)
    }
    if !self.counterpartyVersions.isEmpty {
      try visitor.visitRepeatedMessageField(value: self.counterpartyVersions, fieldNumber: 6)
    }
    if let v = self._proofHeight {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 7)
    }
    if !self.proofInit.isEmpty {
      try visitor.visitSingularBytesField(value: self.proofInit, fieldNumber: 8)
    }
    if !self.proofClient.isEmpty {
      try visitor.visitSingularBytesField(value: self.proofClient, fieldNumber: 9)
    }
    if !self.proofConsensus.isEmpty {
      try visitor.visitSingularBytesField(value: self.proofConsensus, fieldNumber: 10)
    }
    if let v = self._consensusHeight {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 11)
    }
    if !self.signer.isEmpty {
      try visitor.visitSingularStringField(value: self.signer, fieldNumber: 12)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Ibc_Core_Connection_V1_MsgConnectionOpenTry, rhs: Ibc_Core_Connection_V1_MsgConnectionOpenTry) -> Bool {
    if lhs.clientID != rhs.clientID {return false}
    if lhs.previousConnectionID != rhs.previousConnectionID {return false}
    if lhs._clientState != rhs._clientState {return false}
    if lhs._counterparty != rhs._counterparty {return false}
    if lhs.delayPeriod != rhs.delayPeriod {return false}
    if lhs.counterpartyVersions != rhs.counterpartyVersions {return false}
    if lhs._proofHeight != rhs._proofHeight {return false}
    if lhs.proofInit != rhs.proofInit {return false}
    if lhs.proofClient != rhs.proofClient {return false}
    if lhs.proofConsensus != rhs.proofConsensus {return false}
    if lhs._consensusHeight != rhs._consensusHeight {return false}
    if lhs.signer != rhs.signer {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Ibc_Core_Connection_V1_MsgConnectionOpenTryResponse: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".MsgConnectionOpenTryResponse"
  public static let _protobuf_nameMap = SwiftProtobuf._NameMap()

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let _ = try decoder.nextFieldNumber() {
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Ibc_Core_Connection_V1_MsgConnectionOpenTryResponse, rhs: Ibc_Core_Connection_V1_MsgConnectionOpenTryResponse) -> Bool {
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Ibc_Core_Connection_V1_MsgConnectionOpenAck: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".MsgConnectionOpenAck"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "connection_id"),
    2: .standard(proto: "counterparty_connection_id"),
    3: .same(proto: "version"),
    4: .standard(proto: "client_state"),
    5: .standard(proto: "proof_height"),
    6: .standard(proto: "proof_try"),
    7: .standard(proto: "proof_client"),
    8: .standard(proto: "proof_consensus"),
    9: .standard(proto: "consensus_height"),
    10: .same(proto: "signer"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.connectionID) }()
      case 2: try { try decoder.decodeSingularStringField(value: &self.counterpartyConnectionID) }()
      case 3: try { try decoder.decodeSingularMessageField(value: &self._version) }()
      case 4: try { try decoder.decodeSingularMessageField(value: &self._clientState) }()
      case 5: try { try decoder.decodeSingularMessageField(value: &self._proofHeight) }()
      case 6: try { try decoder.decodeSingularBytesField(value: &self.proofTry) }()
      case 7: try { try decoder.decodeSingularBytesField(value: &self.proofClient) }()
      case 8: try { try decoder.decodeSingularBytesField(value: &self.proofConsensus) }()
      case 9: try { try decoder.decodeSingularMessageField(value: &self._consensusHeight) }()
      case 10: try { try decoder.decodeSingularStringField(value: &self.signer) }()
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.connectionID.isEmpty {
      try visitor.visitSingularStringField(value: self.connectionID, fieldNumber: 1)
    }
    if !self.counterpartyConnectionID.isEmpty {
      try visitor.visitSingularStringField(value: self.counterpartyConnectionID, fieldNumber: 2)
    }
    if let v = self._version {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 3)
    }
    if let v = self._clientState {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 4)
    }
    if let v = self._proofHeight {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 5)
    }
    if !self.proofTry.isEmpty {
      try visitor.visitSingularBytesField(value: self.proofTry, fieldNumber: 6)
    }
    if !self.proofClient.isEmpty {
      try visitor.visitSingularBytesField(value: self.proofClient, fieldNumber: 7)
    }
    if !self.proofConsensus.isEmpty {
      try visitor.visitSingularBytesField(value: self.proofConsensus, fieldNumber: 8)
    }
    if let v = self._consensusHeight {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 9)
    }
    if !self.signer.isEmpty {
      try visitor.visitSingularStringField(value: self.signer, fieldNumber: 10)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Ibc_Core_Connection_V1_MsgConnectionOpenAck, rhs: Ibc_Core_Connection_V1_MsgConnectionOpenAck) -> Bool {
    if lhs.connectionID != rhs.connectionID {return false}
    if lhs.counterpartyConnectionID != rhs.counterpartyConnectionID {return false}
    if lhs._version != rhs._version {return false}
    if lhs._clientState != rhs._clientState {return false}
    if lhs._proofHeight != rhs._proofHeight {return false}
    if lhs.proofTry != rhs.proofTry {return false}
    if lhs.proofClient != rhs.proofClient {return false}
    if lhs.proofConsensus != rhs.proofConsensus {return false}
    if lhs._consensusHeight != rhs._consensusHeight {return false}
    if lhs.signer != rhs.signer {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Ibc_Core_Connection_V1_MsgConnectionOpenAckResponse: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".MsgConnectionOpenAckResponse"
  public static let _protobuf_nameMap = SwiftProtobuf._NameMap()

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let _ = try decoder.nextFieldNumber() {
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Ibc_Core_Connection_V1_MsgConnectionOpenAckResponse, rhs: Ibc_Core_Connection_V1_MsgConnectionOpenAckResponse) -> Bool {
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Ibc_Core_Connection_V1_MsgConnectionOpenConfirm: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".MsgConnectionOpenConfirm"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "connection_id"),
    2: .standard(proto: "proof_ack"),
    3: .standard(proto: "proof_height"),
    4: .same(proto: "signer"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.connectionID) }()
      case 2: try { try decoder.decodeSingularBytesField(value: &self.proofAck) }()
      case 3: try { try decoder.decodeSingularMessageField(value: &self._proofHeight) }()
      case 4: try { try decoder.decodeSingularStringField(value: &self.signer) }()
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.connectionID.isEmpty {
      try visitor.visitSingularStringField(value: self.connectionID, fieldNumber: 1)
    }
    if !self.proofAck.isEmpty {
      try visitor.visitSingularBytesField(value: self.proofAck, fieldNumber: 2)
    }
    if let v = self._proofHeight {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 3)
    }
    if !self.signer.isEmpty {
      try visitor.visitSingularStringField(value: self.signer, fieldNumber: 4)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Ibc_Core_Connection_V1_MsgConnectionOpenConfirm, rhs: Ibc_Core_Connection_V1_MsgConnectionOpenConfirm) -> Bool {
    if lhs.connectionID != rhs.connectionID {return false}
    if lhs.proofAck != rhs.proofAck {return false}
    if lhs._proofHeight != rhs._proofHeight {return false}
    if lhs.signer != rhs.signer {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Ibc_Core_Connection_V1_MsgConnectionOpenConfirmResponse: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".MsgConnectionOpenConfirmResponse"
  public static let _protobuf_nameMap = SwiftProtobuf._NameMap()

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let _ = try decoder.nextFieldNumber() {
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Ibc_Core_Connection_V1_MsgConnectionOpenConfirmResponse, rhs: Ibc_Core_Connection_V1_MsgConnectionOpenConfirmResponse) -> Bool {
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}
