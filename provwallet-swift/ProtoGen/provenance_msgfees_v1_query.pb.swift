// DO NOT EDIT.
// swift-format-ignore-file
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: provenance/msgfees/v1/query.proto
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

/// QueryParamsRequest is the request type for the Query/Params RPC method.
public struct Provenance_Msgfees_V1_QueryParamsRequest {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}
}

/// QueryParamsResponse is the response type for the Query/Params RPC method.
public struct Provenance_Msgfees_V1_QueryParamsResponse {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// params defines the parameters of the module.
  public var params: Provenance_Msgfees_V1_Params {
    get {return _params ?? Provenance_Msgfees_V1_Params()}
    set {_params = newValue}
  }
  /// Returns true if `params` has been explicitly set.
  public var hasParams: Bool {return self._params != nil}
  /// Clears the value of `params`. Subsequent reads from it will return its default value.
  public mutating func clearParams() {self._params = nil}

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}

  fileprivate var _params: Provenance_Msgfees_V1_Params? = nil
}

/// QueryAllMsgFeesRequest queries all Msg which have fees associated with them.
public struct Provenance_Msgfees_V1_QueryAllMsgFeesRequest {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// pagination defines an optional pagination for the request.
  public var pagination: Cosmos_Base_Query_V1beta1_PageRequest {
    get {return _pagination ?? Cosmos_Base_Query_V1beta1_PageRequest()}
    set {_pagination = newValue}
  }
  /// Returns true if `pagination` has been explicitly set.
  public var hasPagination: Bool {return self._pagination != nil}
  /// Clears the value of `pagination`. Subsequent reads from it will return its default value.
  public mutating func clearPagination() {self._pagination = nil}

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}

  fileprivate var _pagination: Cosmos_Base_Query_V1beta1_PageRequest? = nil
}

/// response for querying all msg's with fees associated with them
public struct Provenance_Msgfees_V1_QueryAllMsgFeesResponse {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  public var msgFees: [Provenance_Msgfees_V1_MsgFee] = []

  /// pagination defines an optional pagination for the request.
  public var pagination: Cosmos_Base_Query_V1beta1_PageResponse {
    get {return _pagination ?? Cosmos_Base_Query_V1beta1_PageResponse()}
    set {_pagination = newValue}
  }
  /// Returns true if `pagination` has been explicitly set.
  public var hasPagination: Bool {return self._pagination != nil}
  /// Clears the value of `pagination`. Subsequent reads from it will return its default value.
  public mutating func clearPagination() {self._pagination = nil}

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}

  fileprivate var _pagination: Cosmos_Base_Query_V1beta1_PageResponse? = nil
}

/// CalculateTxFeesRequest is the request type for the Query RPC method.
public struct Provenance_Msgfees_V1_CalculateTxFeesRequest {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// tx_bytes is the transaction to simulate.
  public var txBytes: Data = Data()

  /// default_base_denom is used to set the denom used for gas fees
  /// if not set it will default to nhash.
  public var defaultBaseDenom: String = String()

  /// gas_adjustment is the adjustment factor to be multiplied against the estimate returned by the tx simulation
  public var gasAdjustment: Float = 0

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}
}

/// CalculateTxFeesResponse is the response type for the Query RPC method.
public struct Provenance_Msgfees_V1_CalculateTxFeesResponse {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// additional_fees are the amount of coins to be for addition msg fees
  public var additionalFees: [Cosmos_Base_V1beta1_Coin] = []

  /// total_fees are the total amount of fees needed for the transactions (msg fees + gas fee)
  /// note: the gas fee is calculated with the floor gas price module param.
  public var totalFees: [Cosmos_Base_V1beta1_Coin] = []

  /// estimated_gas is the amount of gas needed for the transaction
  public var estimatedGas: UInt64 = 0

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}
}

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "provenance.msgfees.v1"

extension Provenance_Msgfees_V1_QueryParamsRequest: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".QueryParamsRequest"
  public static let _protobuf_nameMap = SwiftProtobuf._NameMap()

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let _ = try decoder.nextFieldNumber() {
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Provenance_Msgfees_V1_QueryParamsRequest, rhs: Provenance_Msgfees_V1_QueryParamsRequest) -> Bool {
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Provenance_Msgfees_V1_QueryParamsResponse: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".QueryParamsResponse"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "params"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularMessageField(value: &self._params) }()
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if let v = self._params {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 1)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Provenance_Msgfees_V1_QueryParamsResponse, rhs: Provenance_Msgfees_V1_QueryParamsResponse) -> Bool {
    if lhs._params != rhs._params {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Provenance_Msgfees_V1_QueryAllMsgFeesRequest: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".QueryAllMsgFeesRequest"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    2: .same(proto: "pagination"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 2: try { try decoder.decodeSingularMessageField(value: &self._pagination) }()
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if let v = self._pagination {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 2)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Provenance_Msgfees_V1_QueryAllMsgFeesRequest, rhs: Provenance_Msgfees_V1_QueryAllMsgFeesRequest) -> Bool {
    if lhs._pagination != rhs._pagination {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Provenance_Msgfees_V1_QueryAllMsgFeesResponse: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".QueryAllMsgFeesResponse"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "msg_fees"),
    2: .same(proto: "pagination"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeRepeatedMessageField(value: &self.msgFees) }()
      case 2: try { try decoder.decodeSingularMessageField(value: &self._pagination) }()
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.msgFees.isEmpty {
      try visitor.visitRepeatedMessageField(value: self.msgFees, fieldNumber: 1)
    }
    if let v = self._pagination {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 2)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Provenance_Msgfees_V1_QueryAllMsgFeesResponse, rhs: Provenance_Msgfees_V1_QueryAllMsgFeesResponse) -> Bool {
    if lhs.msgFees != rhs.msgFees {return false}
    if lhs._pagination != rhs._pagination {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Provenance_Msgfees_V1_CalculateTxFeesRequest: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".CalculateTxFeesRequest"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "tx_bytes"),
    2: .standard(proto: "default_base_denom"),
    3: .standard(proto: "gas_adjustment"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularBytesField(value: &self.txBytes) }()
      case 2: try { try decoder.decodeSingularStringField(value: &self.defaultBaseDenom) }()
      case 3: try { try decoder.decodeSingularFloatField(value: &self.gasAdjustment) }()
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.txBytes.isEmpty {
      try visitor.visitSingularBytesField(value: self.txBytes, fieldNumber: 1)
    }
    if !self.defaultBaseDenom.isEmpty {
      try visitor.visitSingularStringField(value: self.defaultBaseDenom, fieldNumber: 2)
    }
    if self.gasAdjustment != 0 {
      try visitor.visitSingularFloatField(value: self.gasAdjustment, fieldNumber: 3)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Provenance_Msgfees_V1_CalculateTxFeesRequest, rhs: Provenance_Msgfees_V1_CalculateTxFeesRequest) -> Bool {
    if lhs.txBytes != rhs.txBytes {return false}
    if lhs.defaultBaseDenom != rhs.defaultBaseDenom {return false}
    if lhs.gasAdjustment != rhs.gasAdjustment {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Provenance_Msgfees_V1_CalculateTxFeesResponse: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".CalculateTxFeesResponse"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "additional_fees"),
    2: .standard(proto: "total_fees"),
    3: .standard(proto: "estimated_gas"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeRepeatedMessageField(value: &self.additionalFees) }()
      case 2: try { try decoder.decodeRepeatedMessageField(value: &self.totalFees) }()
      case 3: try { try decoder.decodeSingularUInt64Field(value: &self.estimatedGas) }()
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.additionalFees.isEmpty {
      try visitor.visitRepeatedMessageField(value: self.additionalFees, fieldNumber: 1)
    }
    if !self.totalFees.isEmpty {
      try visitor.visitRepeatedMessageField(value: self.totalFees, fieldNumber: 2)
    }
    if self.estimatedGas != 0 {
      try visitor.visitSingularUInt64Field(value: self.estimatedGas, fieldNumber: 3)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Provenance_Msgfees_V1_CalculateTxFeesResponse, rhs: Provenance_Msgfees_V1_CalculateTxFeesResponse) -> Bool {
    if lhs.additionalFees != rhs.additionalFees {return false}
    if lhs.totalFees != rhs.totalFees {return false}
    if lhs.estimatedGas != rhs.estimatedGas {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}
