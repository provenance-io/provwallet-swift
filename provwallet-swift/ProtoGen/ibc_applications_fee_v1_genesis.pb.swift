// DO NOT EDIT.
// swift-format-ignore-file
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: ibc/applications/fee/v1/genesis.proto
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

/// GenesisState defines the ICS29 fee middleware genesis state
public struct Ibc_Applications_Fee_V1_GenesisState {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// list of identified packet fees
  public var identifiedFees: [Ibc_Applications_Fee_V1_IdentifiedPacketFees] = []

  /// list of fee enabled channels
  public var feeEnabledChannels: [Ibc_Applications_Fee_V1_FeeEnabledChannel] = []

  /// list of registered payees
  public var registeredPayees: [Ibc_Applications_Fee_V1_RegisteredPayee] = []

  /// list of registered counterparty payees
  public var registeredCounterpartyPayees: [Ibc_Applications_Fee_V1_RegisteredCounterpartyPayee] = []

  /// list of forward relayer addresses
  public var forwardRelayers: [Ibc_Applications_Fee_V1_ForwardRelayerAddress] = []

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}
}

/// FeeEnabledChannel contains the PortID & ChannelID for a fee enabled channel
public struct Ibc_Applications_Fee_V1_FeeEnabledChannel {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// unique port identifier
  public var portID: String = String()

  /// unique channel identifier
  public var channelID: String = String()

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}
}

/// RegisteredPayee contains the relayer address and payee address for a specific channel
public struct Ibc_Applications_Fee_V1_RegisteredPayee {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// unique channel identifier
  public var channelID: String = String()

  /// the relayer address
  public var relayer: String = String()

  /// the payee address
  public var payee: String = String()

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}
}

/// RegisteredCounterpartyPayee contains the relayer address and counterparty payee address for a specific channel (used
/// for recv fee distribution)
public struct Ibc_Applications_Fee_V1_RegisteredCounterpartyPayee {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// unique channel identifier
  public var channelID: String = String()

  /// the relayer address
  public var relayer: String = String()

  /// the counterparty payee address
  public var counterpartyPayee: String = String()

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}
}

/// ForwardRelayerAddress contains the forward relayer address and PacketId used for async acknowledgements
public struct Ibc_Applications_Fee_V1_ForwardRelayerAddress {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// the forward relayer address
  public var address: String = String()

  /// unique packet identifer comprised of the channel ID, port ID and sequence
  public var packetID: Ibc_Core_Channel_V1_PacketId {
    get {return _packetID ?? Ibc_Core_Channel_V1_PacketId()}
    set {_packetID = newValue}
  }
  /// Returns true if `packetID` has been explicitly set.
  public var hasPacketID: Bool {return self._packetID != nil}
  /// Clears the value of `packetID`. Subsequent reads from it will return its default value.
  public mutating func clearPacketID() {self._packetID = nil}

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}

  fileprivate var _packetID: Ibc_Core_Channel_V1_PacketId? = nil
}

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "ibc.applications.fee.v1"

extension Ibc_Applications_Fee_V1_GenesisState: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".GenesisState"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "identified_fees"),
    2: .standard(proto: "fee_enabled_channels"),
    3: .standard(proto: "registered_payees"),
    4: .standard(proto: "registered_counterparty_payees"),
    5: .standard(proto: "forward_relayers"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeRepeatedMessageField(value: &self.identifiedFees) }()
      case 2: try { try decoder.decodeRepeatedMessageField(value: &self.feeEnabledChannels) }()
      case 3: try { try decoder.decodeRepeatedMessageField(value: &self.registeredPayees) }()
      case 4: try { try decoder.decodeRepeatedMessageField(value: &self.registeredCounterpartyPayees) }()
      case 5: try { try decoder.decodeRepeatedMessageField(value: &self.forwardRelayers) }()
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.identifiedFees.isEmpty {
      try visitor.visitRepeatedMessageField(value: self.identifiedFees, fieldNumber: 1)
    }
    if !self.feeEnabledChannels.isEmpty {
      try visitor.visitRepeatedMessageField(value: self.feeEnabledChannels, fieldNumber: 2)
    }
    if !self.registeredPayees.isEmpty {
      try visitor.visitRepeatedMessageField(value: self.registeredPayees, fieldNumber: 3)
    }
    if !self.registeredCounterpartyPayees.isEmpty {
      try visitor.visitRepeatedMessageField(value: self.registeredCounterpartyPayees, fieldNumber: 4)
    }
    if !self.forwardRelayers.isEmpty {
      try visitor.visitRepeatedMessageField(value: self.forwardRelayers, fieldNumber: 5)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Ibc_Applications_Fee_V1_GenesisState, rhs: Ibc_Applications_Fee_V1_GenesisState) -> Bool {
    if lhs.identifiedFees != rhs.identifiedFees {return false}
    if lhs.feeEnabledChannels != rhs.feeEnabledChannels {return false}
    if lhs.registeredPayees != rhs.registeredPayees {return false}
    if lhs.registeredCounterpartyPayees != rhs.registeredCounterpartyPayees {return false}
    if lhs.forwardRelayers != rhs.forwardRelayers {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Ibc_Applications_Fee_V1_FeeEnabledChannel: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".FeeEnabledChannel"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "port_id"),
    2: .standard(proto: "channel_id"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.portID) }()
      case 2: try { try decoder.decodeSingularStringField(value: &self.channelID) }()
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.portID.isEmpty {
      try visitor.visitSingularStringField(value: self.portID, fieldNumber: 1)
    }
    if !self.channelID.isEmpty {
      try visitor.visitSingularStringField(value: self.channelID, fieldNumber: 2)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Ibc_Applications_Fee_V1_FeeEnabledChannel, rhs: Ibc_Applications_Fee_V1_FeeEnabledChannel) -> Bool {
    if lhs.portID != rhs.portID {return false}
    if lhs.channelID != rhs.channelID {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Ibc_Applications_Fee_V1_RegisteredPayee: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".RegisteredPayee"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "channel_id"),
    2: .same(proto: "relayer"),
    3: .same(proto: "payee"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.channelID) }()
      case 2: try { try decoder.decodeSingularStringField(value: &self.relayer) }()
      case 3: try { try decoder.decodeSingularStringField(value: &self.payee) }()
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.channelID.isEmpty {
      try visitor.visitSingularStringField(value: self.channelID, fieldNumber: 1)
    }
    if !self.relayer.isEmpty {
      try visitor.visitSingularStringField(value: self.relayer, fieldNumber: 2)
    }
    if !self.payee.isEmpty {
      try visitor.visitSingularStringField(value: self.payee, fieldNumber: 3)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Ibc_Applications_Fee_V1_RegisteredPayee, rhs: Ibc_Applications_Fee_V1_RegisteredPayee) -> Bool {
    if lhs.channelID != rhs.channelID {return false}
    if lhs.relayer != rhs.relayer {return false}
    if lhs.payee != rhs.payee {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Ibc_Applications_Fee_V1_RegisteredCounterpartyPayee: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".RegisteredCounterpartyPayee"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "channel_id"),
    2: .same(proto: "relayer"),
    3: .standard(proto: "counterparty_payee"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.channelID) }()
      case 2: try { try decoder.decodeSingularStringField(value: &self.relayer) }()
      case 3: try { try decoder.decodeSingularStringField(value: &self.counterpartyPayee) }()
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.channelID.isEmpty {
      try visitor.visitSingularStringField(value: self.channelID, fieldNumber: 1)
    }
    if !self.relayer.isEmpty {
      try visitor.visitSingularStringField(value: self.relayer, fieldNumber: 2)
    }
    if !self.counterpartyPayee.isEmpty {
      try visitor.visitSingularStringField(value: self.counterpartyPayee, fieldNumber: 3)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Ibc_Applications_Fee_V1_RegisteredCounterpartyPayee, rhs: Ibc_Applications_Fee_V1_RegisteredCounterpartyPayee) -> Bool {
    if lhs.channelID != rhs.channelID {return false}
    if lhs.relayer != rhs.relayer {return false}
    if lhs.counterpartyPayee != rhs.counterpartyPayee {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Ibc_Applications_Fee_V1_ForwardRelayerAddress: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".ForwardRelayerAddress"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "address"),
    2: .standard(proto: "packet_id"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.address) }()
      case 2: try { try decoder.decodeSingularMessageField(value: &self._packetID) }()
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.address.isEmpty {
      try visitor.visitSingularStringField(value: self.address, fieldNumber: 1)
    }
    if let v = self._packetID {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 2)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Ibc_Applications_Fee_V1_ForwardRelayerAddress, rhs: Ibc_Applications_Fee_V1_ForwardRelayerAddress) -> Bool {
    if lhs.address != rhs.address {return false}
    if lhs._packetID != rhs._packetID {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}