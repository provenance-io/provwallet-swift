// DO NOT EDIT.
// swift-format-ignore-file
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: tendermint/p2p/pex.proto
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

public struct Tendermint_P2p_PexRequest {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}
}

public struct Tendermint_P2p_PexAddrs {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  public var addrs: [Tendermint_P2p_NetAddress] = []

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}
}

public struct Tendermint_P2p_Message {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  public var sum: Tendermint_P2p_Message.OneOf_Sum? = nil

  public var pexRequest: Tendermint_P2p_PexRequest {
    get {
      if case .pexRequest(let v)? = sum {return v}
      return Tendermint_P2p_PexRequest()
    }
    set {sum = .pexRequest(newValue)}
  }

  public var pexAddrs: Tendermint_P2p_PexAddrs {
    get {
      if case .pexAddrs(let v)? = sum {return v}
      return Tendermint_P2p_PexAddrs()
    }
    set {sum = .pexAddrs(newValue)}
  }

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public enum OneOf_Sum: Equatable {
    case pexRequest(Tendermint_P2p_PexRequest)
    case pexAddrs(Tendermint_P2p_PexAddrs)

  #if !swift(>=4.1)
    public static func ==(lhs: Tendermint_P2p_Message.OneOf_Sum, rhs: Tendermint_P2p_Message.OneOf_Sum) -> Bool {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch (lhs, rhs) {
      case (.pexRequest, .pexRequest): return {
        guard case .pexRequest(let l) = lhs, case .pexRequest(let r) = rhs else { preconditionFailure() }
        return l == r
      }()
      case (.pexAddrs, .pexAddrs): return {
        guard case .pexAddrs(let l) = lhs, case .pexAddrs(let r) = rhs else { preconditionFailure() }
        return l == r
      }()
      default: return false
      }
    }
  #endif
  }

  public init() {}
}

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "tendermint.p2p"

extension Tendermint_P2p_PexRequest: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".PexRequest"
  public static let _protobuf_nameMap = SwiftProtobuf._NameMap()

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let _ = try decoder.nextFieldNumber() {
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Tendermint_P2p_PexRequest, rhs: Tendermint_P2p_PexRequest) -> Bool {
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Tendermint_P2p_PexAddrs: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".PexAddrs"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "addrs"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeRepeatedMessageField(value: &self.addrs) }()
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.addrs.isEmpty {
      try visitor.visitRepeatedMessageField(value: self.addrs, fieldNumber: 1)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Tendermint_P2p_PexAddrs, rhs: Tendermint_P2p_PexAddrs) -> Bool {
    if lhs.addrs != rhs.addrs {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Tendermint_P2p_Message: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".Message"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "pex_request"),
    2: .standard(proto: "pex_addrs"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try {
        var v: Tendermint_P2p_PexRequest?
        if let current = self.sum {
          try decoder.handleConflictingOneOf()
          if case .pexRequest(let m) = current {v = m}
        }
        try decoder.decodeSingularMessageField(value: &v)
        if let v = v {self.sum = .pexRequest(v)}
      }()
      case 2: try {
        var v: Tendermint_P2p_PexAddrs?
        if let current = self.sum {
          try decoder.handleConflictingOneOf()
          if case .pexAddrs(let m) = current {v = m}
        }
        try decoder.decodeSingularMessageField(value: &v)
        if let v = v {self.sum = .pexAddrs(v)}
      }()
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    // The use of inline closures is to circumvent an issue where the compiler
    // allocates stack space for every case branch when no optimizations are
    // enabled. https://github.com/apple/swift-protobuf/issues/1034
    switch self.sum {
    case .pexRequest?: try {
      guard case .pexRequest(let v)? = self.sum else { preconditionFailure() }
      try visitor.visitSingularMessageField(value: v, fieldNumber: 1)
    }()
    case .pexAddrs?: try {
      guard case .pexAddrs(let v)? = self.sum else { preconditionFailure() }
      try visitor.visitSingularMessageField(value: v, fieldNumber: 2)
    }()
    case nil: break
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Tendermint_P2p_Message, rhs: Tendermint_P2p_Message) -> Bool {
    if lhs.sum != rhs.sum {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}