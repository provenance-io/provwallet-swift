// DO NOT EDIT.
// swift-format-ignore-file
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: provenance/attribute/v1/attribute.proto
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

/// AttributeType defines the type of the data stored in the attribute value
public enum Provenance_Attribute_V1_AttributeType: SwiftProtobuf.Enum {
  public typealias RawValue = Int

  /// ATTRIBUTE_TYPE_UNSPECIFIED defines an unknown/invalid type
  case unspecified // = 0

  /// ATTRIBUTE_TYPE_UUID defines an attribute value that contains a string value representation of a V4 uuid
  case uuid // = 1

  /// ATTRIBUTE_TYPE_JSON defines an attribute value that contains a byte string containing json data
  case json // = 2

  /// ATTRIBUTE_TYPE_STRING defines an attribute value that contains a generic string value
  case string // = 3

  /// ATTRIBUTE_TYPE_URI defines an attribute value that contains a URI
  case uri // = 4

  /// ATTRIBUTE_TYPE_INT defines an attribute value that contains an integer (cast as int64)
  case int // = 5

  /// ATTRIBUTE_TYPE_FLOAT defines an attribute value that contains a float
  case float // = 6

  /// ATTRIBUTE_TYPE_PROTO defines an attribute value that contains a serialized proto value in bytes
  case proto // = 7

  /// ATTRIBUTE_TYPE_BYTES defines an attribute value that contains an untyped array of bytes
  case bytes // = 8
  case UNRECOGNIZED(Int)

  public init() {
    self = .unspecified
  }

  public init?(rawValue: Int) {
    switch rawValue {
    case 0: self = .unspecified
    case 1: self = .uuid
    case 2: self = .json
    case 3: self = .string
    case 4: self = .uri
    case 5: self = .int
    case 6: self = .float
    case 7: self = .proto
    case 8: self = .bytes
    default: self = .UNRECOGNIZED(rawValue)
    }
  }

  public var rawValue: Int {
    switch self {
    case .unspecified: return 0
    case .uuid: return 1
    case .json: return 2
    case .string: return 3
    case .uri: return 4
    case .int: return 5
    case .float: return 6
    case .proto: return 7
    case .bytes: return 8
    case .UNRECOGNIZED(let i): return i
    }
  }

}

#if swift(>=4.2)

extension Provenance_Attribute_V1_AttributeType: CaseIterable {
  // The compiler won't synthesize support with the UNRECOGNIZED case.
  public static var allCases: [Provenance_Attribute_V1_AttributeType] = [
    .unspecified,
    .uuid,
    .json,
    .string,
    .uri,
    .int,
    .float,
    .proto,
    .bytes,
  ]
}

#endif  // swift(>=4.2)

/// Params defines the set of params for the attribute module.
public struct Provenance_Attribute_V1_Params {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// maximum length of data to allow in an attribute value
  public var maxValueLength: UInt32 = 0

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}
}

/// Attribute holds a typed key/value structure for data associated with an account
public struct Provenance_Attribute_V1_Attribute {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// The attribute name.
  public var name: String = String()

  /// The attribute value.
  public var value: Data = Data()

  /// The attribute value type.
  public var attributeType: Provenance_Attribute_V1_AttributeType = .unspecified

  /// The address the attribute is bound to
  public var address: String = String()

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}
}

/// EventAttributeAdd event emitted when attribute is added
public struct Provenance_Attribute_V1_EventAttributeAdd {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  public var name: String = String()

  public var value: String = String()

  public var type: String = String()

  public var account: String = String()

  public var owner: String = String()

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}
}

/// EventAttributeUpdate event emitted when attribute is updated
public struct Provenance_Attribute_V1_EventAttributeUpdate {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  public var name: String = String()

  public var originalValue: String = String()

  public var originalType: String = String()

  public var updateValue: String = String()

  public var updateType: String = String()

  public var account: String = String()

  public var owner: String = String()

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}
}

/// EventAttributeDelete event emitted when attribute is deleted
public struct Provenance_Attribute_V1_EventAttributeDelete {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  public var name: String = String()

  public var account: String = String()

  public var owner: String = String()

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}
}

/// EventAttributeDistinctDelete event emitted when attribute is deleted with matching value
public struct Provenance_Attribute_V1_EventAttributeDistinctDelete {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  public var name: String = String()

  public var value: String = String()

  public var attributeType: String = String()

  public var account: String = String()

  public var owner: String = String()

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}
}

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "provenance.attribute.v1"

extension Provenance_Attribute_V1_AttributeType: SwiftProtobuf._ProtoNameProviding {
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    0: .same(proto: "ATTRIBUTE_TYPE_UNSPECIFIED"),
    1: .same(proto: "ATTRIBUTE_TYPE_UUID"),
    2: .same(proto: "ATTRIBUTE_TYPE_JSON"),
    3: .same(proto: "ATTRIBUTE_TYPE_STRING"),
    4: .same(proto: "ATTRIBUTE_TYPE_URI"),
    5: .same(proto: "ATTRIBUTE_TYPE_INT"),
    6: .same(proto: "ATTRIBUTE_TYPE_FLOAT"),
    7: .same(proto: "ATTRIBUTE_TYPE_PROTO"),
    8: .same(proto: "ATTRIBUTE_TYPE_BYTES"),
  ]
}

extension Provenance_Attribute_V1_Params: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".Params"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "max_value_length"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularUInt32Field(value: &self.maxValueLength) }()
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if self.maxValueLength != 0 {
      try visitor.visitSingularUInt32Field(value: self.maxValueLength, fieldNumber: 1)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Provenance_Attribute_V1_Params, rhs: Provenance_Attribute_V1_Params) -> Bool {
    if lhs.maxValueLength != rhs.maxValueLength {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Provenance_Attribute_V1_Attribute: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".Attribute"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "name"),
    2: .same(proto: "value"),
    3: .standard(proto: "attribute_type"),
    4: .same(proto: "address"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.name) }()
      case 2: try { try decoder.decodeSingularBytesField(value: &self.value) }()
      case 3: try { try decoder.decodeSingularEnumField(value: &self.attributeType) }()
      case 4: try { try decoder.decodeSingularStringField(value: &self.address) }()
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.name.isEmpty {
      try visitor.visitSingularStringField(value: self.name, fieldNumber: 1)
    }
    if !self.value.isEmpty {
      try visitor.visitSingularBytesField(value: self.value, fieldNumber: 2)
    }
    if self.attributeType != .unspecified {
      try visitor.visitSingularEnumField(value: self.attributeType, fieldNumber: 3)
    }
    if !self.address.isEmpty {
      try visitor.visitSingularStringField(value: self.address, fieldNumber: 4)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Provenance_Attribute_V1_Attribute, rhs: Provenance_Attribute_V1_Attribute) -> Bool {
    if lhs.name != rhs.name {return false}
    if lhs.value != rhs.value {return false}
    if lhs.attributeType != rhs.attributeType {return false}
    if lhs.address != rhs.address {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Provenance_Attribute_V1_EventAttributeAdd: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".EventAttributeAdd"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "name"),
    2: .same(proto: "value"),
    3: .same(proto: "type"),
    4: .same(proto: "account"),
    5: .same(proto: "owner"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.name) }()
      case 2: try { try decoder.decodeSingularStringField(value: &self.value) }()
      case 3: try { try decoder.decodeSingularStringField(value: &self.type) }()
      case 4: try { try decoder.decodeSingularStringField(value: &self.account) }()
      case 5: try { try decoder.decodeSingularStringField(value: &self.owner) }()
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.name.isEmpty {
      try visitor.visitSingularStringField(value: self.name, fieldNumber: 1)
    }
    if !self.value.isEmpty {
      try visitor.visitSingularStringField(value: self.value, fieldNumber: 2)
    }
    if !self.type.isEmpty {
      try visitor.visitSingularStringField(value: self.type, fieldNumber: 3)
    }
    if !self.account.isEmpty {
      try visitor.visitSingularStringField(value: self.account, fieldNumber: 4)
    }
    if !self.owner.isEmpty {
      try visitor.visitSingularStringField(value: self.owner, fieldNumber: 5)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Provenance_Attribute_V1_EventAttributeAdd, rhs: Provenance_Attribute_V1_EventAttributeAdd) -> Bool {
    if lhs.name != rhs.name {return false}
    if lhs.value != rhs.value {return false}
    if lhs.type != rhs.type {return false}
    if lhs.account != rhs.account {return false}
    if lhs.owner != rhs.owner {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Provenance_Attribute_V1_EventAttributeUpdate: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".EventAttributeUpdate"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "name"),
    2: .standard(proto: "original_value"),
    3: .standard(proto: "original_type"),
    4: .standard(proto: "update_value"),
    5: .standard(proto: "update_type"),
    6: .same(proto: "account"),
    7: .same(proto: "owner"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.name) }()
      case 2: try { try decoder.decodeSingularStringField(value: &self.originalValue) }()
      case 3: try { try decoder.decodeSingularStringField(value: &self.originalType) }()
      case 4: try { try decoder.decodeSingularStringField(value: &self.updateValue) }()
      case 5: try { try decoder.decodeSingularStringField(value: &self.updateType) }()
      case 6: try { try decoder.decodeSingularStringField(value: &self.account) }()
      case 7: try { try decoder.decodeSingularStringField(value: &self.owner) }()
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.name.isEmpty {
      try visitor.visitSingularStringField(value: self.name, fieldNumber: 1)
    }
    if !self.originalValue.isEmpty {
      try visitor.visitSingularStringField(value: self.originalValue, fieldNumber: 2)
    }
    if !self.originalType.isEmpty {
      try visitor.visitSingularStringField(value: self.originalType, fieldNumber: 3)
    }
    if !self.updateValue.isEmpty {
      try visitor.visitSingularStringField(value: self.updateValue, fieldNumber: 4)
    }
    if !self.updateType.isEmpty {
      try visitor.visitSingularStringField(value: self.updateType, fieldNumber: 5)
    }
    if !self.account.isEmpty {
      try visitor.visitSingularStringField(value: self.account, fieldNumber: 6)
    }
    if !self.owner.isEmpty {
      try visitor.visitSingularStringField(value: self.owner, fieldNumber: 7)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Provenance_Attribute_V1_EventAttributeUpdate, rhs: Provenance_Attribute_V1_EventAttributeUpdate) -> Bool {
    if lhs.name != rhs.name {return false}
    if lhs.originalValue != rhs.originalValue {return false}
    if lhs.originalType != rhs.originalType {return false}
    if lhs.updateValue != rhs.updateValue {return false}
    if lhs.updateType != rhs.updateType {return false}
    if lhs.account != rhs.account {return false}
    if lhs.owner != rhs.owner {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Provenance_Attribute_V1_EventAttributeDelete: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".EventAttributeDelete"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "name"),
    2: .same(proto: "account"),
    3: .same(proto: "owner"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.name) }()
      case 2: try { try decoder.decodeSingularStringField(value: &self.account) }()
      case 3: try { try decoder.decodeSingularStringField(value: &self.owner) }()
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.name.isEmpty {
      try visitor.visitSingularStringField(value: self.name, fieldNumber: 1)
    }
    if !self.account.isEmpty {
      try visitor.visitSingularStringField(value: self.account, fieldNumber: 2)
    }
    if !self.owner.isEmpty {
      try visitor.visitSingularStringField(value: self.owner, fieldNumber: 3)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Provenance_Attribute_V1_EventAttributeDelete, rhs: Provenance_Attribute_V1_EventAttributeDelete) -> Bool {
    if lhs.name != rhs.name {return false}
    if lhs.account != rhs.account {return false}
    if lhs.owner != rhs.owner {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Provenance_Attribute_V1_EventAttributeDistinctDelete: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".EventAttributeDistinctDelete"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "name"),
    2: .same(proto: "value"),
    3: .standard(proto: "attribute_type"),
    4: .same(proto: "account"),
    5: .same(proto: "owner"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.name) }()
      case 2: try { try decoder.decodeSingularStringField(value: &self.value) }()
      case 3: try { try decoder.decodeSingularStringField(value: &self.attributeType) }()
      case 4: try { try decoder.decodeSingularStringField(value: &self.account) }()
      case 5: try { try decoder.decodeSingularStringField(value: &self.owner) }()
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.name.isEmpty {
      try visitor.visitSingularStringField(value: self.name, fieldNumber: 1)
    }
    if !self.value.isEmpty {
      try visitor.visitSingularStringField(value: self.value, fieldNumber: 2)
    }
    if !self.attributeType.isEmpty {
      try visitor.visitSingularStringField(value: self.attributeType, fieldNumber: 3)
    }
    if !self.account.isEmpty {
      try visitor.visitSingularStringField(value: self.account, fieldNumber: 4)
    }
    if !self.owner.isEmpty {
      try visitor.visitSingularStringField(value: self.owner, fieldNumber: 5)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Provenance_Attribute_V1_EventAttributeDistinctDelete, rhs: Provenance_Attribute_V1_EventAttributeDistinctDelete) -> Bool {
    if lhs.name != rhs.name {return false}
    if lhs.value != rhs.value {return false}
    if lhs.attributeType != rhs.attributeType {return false}
    if lhs.account != rhs.account {return false}
    if lhs.owner != rhs.owner {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}