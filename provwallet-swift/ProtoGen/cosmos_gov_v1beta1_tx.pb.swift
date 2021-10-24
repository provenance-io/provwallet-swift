// DO NOT EDIT.
// swift-format-ignore-file
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: cosmos/gov/v1beta1/tx.proto
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

/// MsgSubmitProposal defines an sdk.Msg type that supports submitting arbitrary
/// proposal Content.
public struct Cosmos_Gov_V1beta1_MsgSubmitProposal {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  public var content: SwiftProtobuf.Google_Protobuf_Any {
    get {return _content ?? SwiftProtobuf.Google_Protobuf_Any()}
    set {_content = newValue}
  }
  /// Returns true if `content` has been explicitly set.
  public var hasContent: Bool {return self._content != nil}
  /// Clears the value of `content`. Subsequent reads from it will return its default value.
  public mutating func clearContent() {self._content = nil}

  public var initialDeposit: [Cosmos_Base_V1beta1_Coin] = []

  public var proposer: String = String()

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}

  fileprivate var _content: SwiftProtobuf.Google_Protobuf_Any? = nil
}

/// MsgSubmitProposalResponse defines the Msg/SubmitProposal response type.
public struct Cosmos_Gov_V1beta1_MsgSubmitProposalResponse {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  public var proposalID: UInt64 = 0

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}
}

/// MsgVote defines a message to cast a vote.
public struct Cosmos_Gov_V1beta1_MsgVote {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  public var proposalID: UInt64 = 0

  public var voter: String = String()

  public var option: Cosmos_Gov_V1beta1_VoteOption = .unspecified

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}
}

/// MsgVoteResponse defines the Msg/Vote response type.
public struct Cosmos_Gov_V1beta1_MsgVoteResponse {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}
}

/// MsgVoteWeighted defines a message to cast a vote.
public struct Cosmos_Gov_V1beta1_MsgVoteWeighted {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  public var proposalID: UInt64 = 0

  public var voter: String = String()

  public var options: [Cosmos_Gov_V1beta1_WeightedVoteOption] = []

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}
}

/// MsgVoteWeightedResponse defines the Msg/VoteWeighted response type.
public struct Cosmos_Gov_V1beta1_MsgVoteWeightedResponse {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}
}

/// MsgDeposit defines a message to submit a deposit to an existing proposal.
public struct Cosmos_Gov_V1beta1_MsgDeposit {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  public var proposalID: UInt64 = 0

  public var depositor: String = String()

  public var amount: [Cosmos_Base_V1beta1_Coin] = []

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}
}

/// MsgDepositResponse defines the Msg/Deposit response type.
public struct Cosmos_Gov_V1beta1_MsgDepositResponse {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}
}

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "cosmos.gov.v1beta1"

extension Cosmos_Gov_V1beta1_MsgSubmitProposal: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".MsgSubmitProposal"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "content"),
    2: .standard(proto: "initial_deposit"),
    3: .same(proto: "proposer"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularMessageField(value: &self._content) }()
      case 2: try { try decoder.decodeRepeatedMessageField(value: &self.initialDeposit) }()
      case 3: try { try decoder.decodeSingularStringField(value: &self.proposer) }()
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if let v = self._content {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 1)
    }
    if !self.initialDeposit.isEmpty {
      try visitor.visitRepeatedMessageField(value: self.initialDeposit, fieldNumber: 2)
    }
    if !self.proposer.isEmpty {
      try visitor.visitSingularStringField(value: self.proposer, fieldNumber: 3)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Cosmos_Gov_V1beta1_MsgSubmitProposal, rhs: Cosmos_Gov_V1beta1_MsgSubmitProposal) -> Bool {
    if lhs._content != rhs._content {return false}
    if lhs.initialDeposit != rhs.initialDeposit {return false}
    if lhs.proposer != rhs.proposer {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Cosmos_Gov_V1beta1_MsgSubmitProposalResponse: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".MsgSubmitProposalResponse"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "proposal_id"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularUInt64Field(value: &self.proposalID) }()
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if self.proposalID != 0 {
      try visitor.visitSingularUInt64Field(value: self.proposalID, fieldNumber: 1)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Cosmos_Gov_V1beta1_MsgSubmitProposalResponse, rhs: Cosmos_Gov_V1beta1_MsgSubmitProposalResponse) -> Bool {
    if lhs.proposalID != rhs.proposalID {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Cosmos_Gov_V1beta1_MsgVote: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".MsgVote"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "proposal_id"),
    2: .same(proto: "voter"),
    3: .same(proto: "option"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularUInt64Field(value: &self.proposalID) }()
      case 2: try { try decoder.decodeSingularStringField(value: &self.voter) }()
      case 3: try { try decoder.decodeSingularEnumField(value: &self.option) }()
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if self.proposalID != 0 {
      try visitor.visitSingularUInt64Field(value: self.proposalID, fieldNumber: 1)
    }
    if !self.voter.isEmpty {
      try visitor.visitSingularStringField(value: self.voter, fieldNumber: 2)
    }
    if self.option != .unspecified {
      try visitor.visitSingularEnumField(value: self.option, fieldNumber: 3)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Cosmos_Gov_V1beta1_MsgVote, rhs: Cosmos_Gov_V1beta1_MsgVote) -> Bool {
    if lhs.proposalID != rhs.proposalID {return false}
    if lhs.voter != rhs.voter {return false}
    if lhs.option != rhs.option {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Cosmos_Gov_V1beta1_MsgVoteResponse: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".MsgVoteResponse"
  public static let _protobuf_nameMap = SwiftProtobuf._NameMap()

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let _ = try decoder.nextFieldNumber() {
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Cosmos_Gov_V1beta1_MsgVoteResponse, rhs: Cosmos_Gov_V1beta1_MsgVoteResponse) -> Bool {
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Cosmos_Gov_V1beta1_MsgVoteWeighted: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".MsgVoteWeighted"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "proposal_id"),
    2: .same(proto: "voter"),
    3: .same(proto: "options"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularUInt64Field(value: &self.proposalID) }()
      case 2: try { try decoder.decodeSingularStringField(value: &self.voter) }()
      case 3: try { try decoder.decodeRepeatedMessageField(value: &self.options) }()
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if self.proposalID != 0 {
      try visitor.visitSingularUInt64Field(value: self.proposalID, fieldNumber: 1)
    }
    if !self.voter.isEmpty {
      try visitor.visitSingularStringField(value: self.voter, fieldNumber: 2)
    }
    if !self.options.isEmpty {
      try visitor.visitRepeatedMessageField(value: self.options, fieldNumber: 3)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Cosmos_Gov_V1beta1_MsgVoteWeighted, rhs: Cosmos_Gov_V1beta1_MsgVoteWeighted) -> Bool {
    if lhs.proposalID != rhs.proposalID {return false}
    if lhs.voter != rhs.voter {return false}
    if lhs.options != rhs.options {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Cosmos_Gov_V1beta1_MsgVoteWeightedResponse: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".MsgVoteWeightedResponse"
  public static let _protobuf_nameMap = SwiftProtobuf._NameMap()

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let _ = try decoder.nextFieldNumber() {
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Cosmos_Gov_V1beta1_MsgVoteWeightedResponse, rhs: Cosmos_Gov_V1beta1_MsgVoteWeightedResponse) -> Bool {
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Cosmos_Gov_V1beta1_MsgDeposit: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".MsgDeposit"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "proposal_id"),
    2: .same(proto: "depositor"),
    3: .same(proto: "amount"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularUInt64Field(value: &self.proposalID) }()
      case 2: try { try decoder.decodeSingularStringField(value: &self.depositor) }()
      case 3: try { try decoder.decodeRepeatedMessageField(value: &self.amount) }()
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if self.proposalID != 0 {
      try visitor.visitSingularUInt64Field(value: self.proposalID, fieldNumber: 1)
    }
    if !self.depositor.isEmpty {
      try visitor.visitSingularStringField(value: self.depositor, fieldNumber: 2)
    }
    if !self.amount.isEmpty {
      try visitor.visitRepeatedMessageField(value: self.amount, fieldNumber: 3)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Cosmos_Gov_V1beta1_MsgDeposit, rhs: Cosmos_Gov_V1beta1_MsgDeposit) -> Bool {
    if lhs.proposalID != rhs.proposalID {return false}
    if lhs.depositor != rhs.depositor {return false}
    if lhs.amount != rhs.amount {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Cosmos_Gov_V1beta1_MsgDepositResponse: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".MsgDepositResponse"
  public static let _protobuf_nameMap = SwiftProtobuf._NameMap()

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let _ = try decoder.nextFieldNumber() {
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Cosmos_Gov_V1beta1_MsgDepositResponse, rhs: Cosmos_Gov_V1beta1_MsgDepositResponse) -> Bool {
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}