// DO NOT EDIT.
// swift-format-ignore-file
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: cosmos/upgrade/v1beta1/query.proto
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

/// QueryCurrentPlanRequest is the request type for the Query/CurrentPlan RPC
/// method.
struct Cosmos_Upgrade_V1beta1_QueryCurrentPlanRequest {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

/// QueryCurrentPlanResponse is the response type for the Query/CurrentPlan RPC
/// method.
struct Cosmos_Upgrade_V1beta1_QueryCurrentPlanResponse {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// plan is the current upgrade plan.
  var plan: Cosmos_Upgrade_V1beta1_Plan {
    get {return _plan ?? Cosmos_Upgrade_V1beta1_Plan()}
    set {_plan = newValue}
  }
  /// Returns true if `plan` has been explicitly set.
  var hasPlan: Bool {return self._plan != nil}
  /// Clears the value of `plan`. Subsequent reads from it will return its default value.
  mutating func clearPlan() {self._plan = nil}

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}

  fileprivate var _plan: Cosmos_Upgrade_V1beta1_Plan? = nil
}

/// QueryCurrentPlanRequest is the request type for the Query/AppliedPlan RPC
/// method.
struct Cosmos_Upgrade_V1beta1_QueryAppliedPlanRequest {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// name is the name of the applied plan to query for.
  var name: String = String()

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

/// QueryAppliedPlanResponse is the response type for the Query/AppliedPlan RPC
/// method.
struct Cosmos_Upgrade_V1beta1_QueryAppliedPlanResponse {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// height is the block height at which the plan was applied.
  var height: Int64 = 0

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

/// QueryUpgradedConsensusStateRequest is the request type for the Query/UpgradedConsensusState
/// RPC method.
struct Cosmos_Upgrade_V1beta1_QueryUpgradedConsensusStateRequest {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// last height of the current chain must be sent in request
  /// as this is the height under which next consensus state is stored
  var lastHeight: Int64 = 0

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

/// QueryUpgradedConsensusStateResponse is the response type for the Query/UpgradedConsensusState
/// RPC method.
struct Cosmos_Upgrade_V1beta1_QueryUpgradedConsensusStateResponse {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var upgradedConsensusState: Data = Data()

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

/// QueryModuleVersionsRequest is the request type for the Query/ModuleVersions
/// RPC method.
struct Cosmos_Upgrade_V1beta1_QueryModuleVersionsRequest {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// module_name is a field to query a specific module
  /// consensus version from state. Leaving this empty will
  /// fetch the full list of module versions from state
  var moduleName: String = String()

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

/// QueryModuleVersionsResponse is the response type for the Query/ModuleVersions
/// RPC method.
struct Cosmos_Upgrade_V1beta1_QueryModuleVersionsResponse {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// module_versions is a list of module names with their consensus versions.
  var moduleVersions: [Cosmos_Upgrade_V1beta1_ModuleVersion] = []

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "cosmos.upgrade.v1beta1"

extension Cosmos_Upgrade_V1beta1_QueryCurrentPlanRequest: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".QueryCurrentPlanRequest"
  static let _protobuf_nameMap = SwiftProtobuf._NameMap()

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let _ = try decoder.nextFieldNumber() {
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Cosmos_Upgrade_V1beta1_QueryCurrentPlanRequest, rhs: Cosmos_Upgrade_V1beta1_QueryCurrentPlanRequest) -> Bool {
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Cosmos_Upgrade_V1beta1_QueryCurrentPlanResponse: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".QueryCurrentPlanResponse"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "plan"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularMessageField(value: &self._plan) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if let v = self._plan {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 1)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Cosmos_Upgrade_V1beta1_QueryCurrentPlanResponse, rhs: Cosmos_Upgrade_V1beta1_QueryCurrentPlanResponse) -> Bool {
    if lhs._plan != rhs._plan {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Cosmos_Upgrade_V1beta1_QueryAppliedPlanRequest: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".QueryAppliedPlanRequest"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "name"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.name) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.name.isEmpty {
      try visitor.visitSingularStringField(value: self.name, fieldNumber: 1)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Cosmos_Upgrade_V1beta1_QueryAppliedPlanRequest, rhs: Cosmos_Upgrade_V1beta1_QueryAppliedPlanRequest) -> Bool {
    if lhs.name != rhs.name {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Cosmos_Upgrade_V1beta1_QueryAppliedPlanResponse: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".QueryAppliedPlanResponse"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "height"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularInt64Field(value: &self.height) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if self.height != 0 {
      try visitor.visitSingularInt64Field(value: self.height, fieldNumber: 1)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Cosmos_Upgrade_V1beta1_QueryAppliedPlanResponse, rhs: Cosmos_Upgrade_V1beta1_QueryAppliedPlanResponse) -> Bool {
    if lhs.height != rhs.height {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Cosmos_Upgrade_V1beta1_QueryUpgradedConsensusStateRequest: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".QueryUpgradedConsensusStateRequest"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "last_height"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularInt64Field(value: &self.lastHeight) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if self.lastHeight != 0 {
      try visitor.visitSingularInt64Field(value: self.lastHeight, fieldNumber: 1)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Cosmos_Upgrade_V1beta1_QueryUpgradedConsensusStateRequest, rhs: Cosmos_Upgrade_V1beta1_QueryUpgradedConsensusStateRequest) -> Bool {
    if lhs.lastHeight != rhs.lastHeight {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Cosmos_Upgrade_V1beta1_QueryUpgradedConsensusStateResponse: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".QueryUpgradedConsensusStateResponse"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    2: .standard(proto: "upgraded_consensus_state"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 2: try { try decoder.decodeSingularBytesField(value: &self.upgradedConsensusState) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.upgradedConsensusState.isEmpty {
      try visitor.visitSingularBytesField(value: self.upgradedConsensusState, fieldNumber: 2)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Cosmos_Upgrade_V1beta1_QueryUpgradedConsensusStateResponse, rhs: Cosmos_Upgrade_V1beta1_QueryUpgradedConsensusStateResponse) -> Bool {
    if lhs.upgradedConsensusState != rhs.upgradedConsensusState {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Cosmos_Upgrade_V1beta1_QueryModuleVersionsRequest: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".QueryModuleVersionsRequest"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "module_name"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.moduleName) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.moduleName.isEmpty {
      try visitor.visitSingularStringField(value: self.moduleName, fieldNumber: 1)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Cosmos_Upgrade_V1beta1_QueryModuleVersionsRequest, rhs: Cosmos_Upgrade_V1beta1_QueryModuleVersionsRequest) -> Bool {
    if lhs.moduleName != rhs.moduleName {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Cosmos_Upgrade_V1beta1_QueryModuleVersionsResponse: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".QueryModuleVersionsResponse"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "module_versions"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeRepeatedMessageField(value: &self.moduleVersions) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.moduleVersions.isEmpty {
      try visitor.visitRepeatedMessageField(value: self.moduleVersions, fieldNumber: 1)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Cosmos_Upgrade_V1beta1_QueryModuleVersionsResponse, rhs: Cosmos_Upgrade_V1beta1_QueryModuleVersionsResponse) -> Bool {
    if lhs.moduleVersions != rhs.moduleVersions {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}
