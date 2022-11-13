// DO NOT EDIT.
// swift-format-ignore-file
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: cosmos/orm/v1/orm.proto
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

/// TableDescriptor describes an ORM table.
public struct Cosmos_Orm_V1_TableDescriptor {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// primary_key defines the primary key for the table.
  public var primaryKey: Cosmos_Orm_V1_PrimaryKeyDescriptor {
    get {return _primaryKey ?? Cosmos_Orm_V1_PrimaryKeyDescriptor()}
    set {_primaryKey = newValue}
  }
  /// Returns true if `primaryKey` has been explicitly set.
  public var hasPrimaryKey: Bool {return self._primaryKey != nil}
  /// Clears the value of `primaryKey`. Subsequent reads from it will return its default value.
  public mutating func clearPrimaryKey() {self._primaryKey = nil}

  /// index defines one or more secondary indexes.
  public var index: [Cosmos_Orm_V1_SecondaryIndexDescriptor] = []

  /// id is a non-zero integer ID that must be unique within the
  /// tables and singletons in this file. It may be deprecated in the future when this
  /// can be auto-generated.
  public var id: UInt32 = 0

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}

  fileprivate var _primaryKey: Cosmos_Orm_V1_PrimaryKeyDescriptor? = nil
}

/// PrimaryKeyDescriptor describes a table primary key.
public struct Cosmos_Orm_V1_PrimaryKeyDescriptor {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// fields is a comma-separated list of fields in the primary key. Spaces are
  /// not allowed. Supported field types, their encodings, and any applicable constraints
  /// are described below.
  ///   - uint32 are encoded as 2,3,4 or 5 bytes using a compact encoding that
  ///     is suitable for sorted iteration (not varint encoding). This type is
  ///     well-suited for small integers.
  ///   - uint64 are encoded as 2,4,6 or 9 bytes using a compact encoding that
  ///     is suitable for sorted iteration (not varint encoding). This type is
  ///     well-suited for small integers such as auto-incrementing sequences.
  ///   - fixed32, fixed64 are encoded as big-endian fixed width bytes and support
  ///   sorted iteration. These types are well-suited for encoding fixed with
  ///   decimals as integers.
  ///   - string's are encoded as raw bytes in terminal key segments and null-terminated
  ///   in non-terminal segments. Null characters are thus forbidden in strings.
  ///   string fields support sorted iteration.
  ///   - bytes are encoded as raw bytes in terminal segments and length-prefixed
  ///   with a 32-bit unsigned varint in non-terminal segments.
  ///   - int32, sint32, int64, sint64, sfixed32, sfixed64 are encoded as fixed width bytes with
  ///   an encoding that enables sorted iteration.
  ///   - google.protobuf.Timestamp and google.protobuf.Duration are encoded
  ///   as 12 bytes using an encoding that enables sorted iteration.
  ///   - enum fields are encoded using varint encoding and do not support sorted
  ///   iteration.
  ///   - bool fields are encoded as a single byte 0 or 1.
  ///
  /// All other fields types are unsupported in keys including repeated and
  /// oneof fields.
  ///
  /// Primary keys are prefixed by the varint encoded table id and the byte 0x0
  /// plus any additional prefix specified by the schema.
  public var fields: String = String()

  /// auto_increment specifies that the primary key is generated by an
  /// auto-incrementing integer. If this is set to true fields must only
  /// contain one field of that is of type uint64.
  public var autoIncrement: Bool = false

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}
}

/// PrimaryKeyDescriptor describes a table secondary index.
public struct Cosmos_Orm_V1_SecondaryIndexDescriptor {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// fields is a comma-separated list of fields in the index. The supported
  /// field types are the same as those for PrimaryKeyDescriptor.fields.
  /// Index keys are prefixed by the varint encoded table id and the varint
  /// encoded index id plus any additional prefix specified by the schema.
  ///
  /// In addition the field segments, non-unique index keys are suffixed with
  /// any additional primary key fields not present in the index fields so that the
  /// primary key can be reconstructed. Unique indexes instead of being suffixed
  /// store the remaining primary key fields in the value..
  public var fields: String = String()

  /// id is a non-zero integer ID that must be unique within the indexes for this
  /// table and less than 32768. It may be deprecated in the future when this can
  /// be auto-generated.
  public var id: UInt32 = 0

  /// unique specifies that this an unique index.
  public var unique: Bool = false

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}
}

/// TableDescriptor describes an ORM singleton table which has at most one instance.
public struct Cosmos_Orm_V1_SingletonDescriptor {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// id is a non-zero integer ID that must be unique within the
  /// tables and singletons in this file. It may be deprecated in the future when this
  /// can be auto-generated.
  public var id: UInt32 = 0

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}
}

// MARK: - Extension support defined in orm.proto.

// MARK: - Extension Properties

// Swift Extensions on the exteneded Messages to add easy access to the declared
// extension fields. The names are based on the extension field name from the proto
// declaration. To avoid naming collisions, the names are prefixed with the name of
// the scope where the extend directive occurs.

extension SwiftProtobuf.Google_Protobuf_MessageOptions {

  /// table specifies that this message will be used as an ORM table. It cannot
  /// be used together with the singleton option.
  public var Cosmos_Orm_V1_table: Cosmos_Orm_V1_TableDescriptor {
    get {return getExtensionValue(ext: Cosmos_Orm_V1_Extensions_table) ?? Cosmos_Orm_V1_TableDescriptor()}
    set {setExtensionValue(ext: Cosmos_Orm_V1_Extensions_table, value: newValue)}
  }
  /// Returns true if extension `Cosmos_Orm_V1_Extensions_table`
  /// has been explicitly set.
  public var hasCosmos_Orm_V1_table: Bool {
    return hasExtensionValue(ext: Cosmos_Orm_V1_Extensions_table)
  }
  /// Clears the value of extension `Cosmos_Orm_V1_Extensions_table`.
  /// Subsequent reads from it will return its default value.
  public mutating func clearCosmos_Orm_V1_table() {
    clearExtensionValue(ext: Cosmos_Orm_V1_Extensions_table)
  }

  /// singleton specifies that this message will be used as an ORM singleton. It cannot
  /// be used together with the table option.
  public var Cosmos_Orm_V1_singleton: Cosmos_Orm_V1_SingletonDescriptor {
    get {return getExtensionValue(ext: Cosmos_Orm_V1_Extensions_singleton) ?? Cosmos_Orm_V1_SingletonDescriptor()}
    set {setExtensionValue(ext: Cosmos_Orm_V1_Extensions_singleton, value: newValue)}
  }
  /// Returns true if extension `Cosmos_Orm_V1_Extensions_singleton`
  /// has been explicitly set.
  public var hasCosmos_Orm_V1_singleton: Bool {
    return hasExtensionValue(ext: Cosmos_Orm_V1_Extensions_singleton)
  }
  /// Clears the value of extension `Cosmos_Orm_V1_Extensions_singleton`.
  /// Subsequent reads from it will return its default value.
  public mutating func clearCosmos_Orm_V1_singleton() {
    clearExtensionValue(ext: Cosmos_Orm_V1_Extensions_singleton)
  }

}

// MARK: - File's ExtensionMap: Cosmos_Orm_V1_Orm_Extensions

/// A `SwiftProtobuf.SimpleExtensionMap` that includes all of the extensions defined by
/// this .proto file. It can be used any place an `SwiftProtobuf.ExtensionMap` is needed
/// in parsing, or it can be combined with other `SwiftProtobuf.SimpleExtensionMap`s to create
/// a larger `SwiftProtobuf.SimpleExtensionMap`.
public let Cosmos_Orm_V1_Orm_Extensions: SwiftProtobuf.SimpleExtensionMap = [
  Cosmos_Orm_V1_Extensions_table,
  Cosmos_Orm_V1_Extensions_singleton
]

// Extension Objects - The only reason these might be needed is when manually
// constructing a `SimpleExtensionMap`, otherwise, use the above _Extension Properties_
// accessors for the extension fields on the messages directly.

/// table specifies that this message will be used as an ORM table. It cannot
/// be used together with the singleton option.
public let Cosmos_Orm_V1_Extensions_table = SwiftProtobuf.MessageExtension<SwiftProtobuf.OptionalMessageExtensionField<Cosmos_Orm_V1_TableDescriptor>, SwiftProtobuf.Google_Protobuf_MessageOptions>(
  _protobuf_fieldNumber: 104503790,
  fieldName: "cosmos.orm.v1.table"
)

/// singleton specifies that this message will be used as an ORM singleton. It cannot
/// be used together with the table option.
public let Cosmos_Orm_V1_Extensions_singleton = SwiftProtobuf.MessageExtension<SwiftProtobuf.OptionalMessageExtensionField<Cosmos_Orm_V1_SingletonDescriptor>, SwiftProtobuf.Google_Protobuf_MessageOptions>(
  _protobuf_fieldNumber: 104503791,
  fieldName: "cosmos.orm.v1.singleton"
)

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "cosmos.orm.v1"

extension Cosmos_Orm_V1_TableDescriptor: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".TableDescriptor"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "primary_key"),
    2: .same(proto: "index"),
    3: .same(proto: "id"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularMessageField(value: &self._primaryKey) }()
      case 2: try { try decoder.decodeRepeatedMessageField(value: &self.index) }()
      case 3: try { try decoder.decodeSingularUInt32Field(value: &self.id) }()
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if let v = self._primaryKey {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 1)
    }
    if !self.index.isEmpty {
      try visitor.visitRepeatedMessageField(value: self.index, fieldNumber: 2)
    }
    if self.id != 0 {
      try visitor.visitSingularUInt32Field(value: self.id, fieldNumber: 3)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Cosmos_Orm_V1_TableDescriptor, rhs: Cosmos_Orm_V1_TableDescriptor) -> Bool {
    if lhs._primaryKey != rhs._primaryKey {return false}
    if lhs.index != rhs.index {return false}
    if lhs.id != rhs.id {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Cosmos_Orm_V1_PrimaryKeyDescriptor: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".PrimaryKeyDescriptor"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "fields"),
    2: .standard(proto: "auto_increment"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.fields) }()
      case 2: try { try decoder.decodeSingularBoolField(value: &self.autoIncrement) }()
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.fields.isEmpty {
      try visitor.visitSingularStringField(value: self.fields, fieldNumber: 1)
    }
    if self.autoIncrement != false {
      try visitor.visitSingularBoolField(value: self.autoIncrement, fieldNumber: 2)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Cosmos_Orm_V1_PrimaryKeyDescriptor, rhs: Cosmos_Orm_V1_PrimaryKeyDescriptor) -> Bool {
    if lhs.fields != rhs.fields {return false}
    if lhs.autoIncrement != rhs.autoIncrement {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Cosmos_Orm_V1_SecondaryIndexDescriptor: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".SecondaryIndexDescriptor"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "fields"),
    2: .same(proto: "id"),
    3: .same(proto: "unique"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.fields) }()
      case 2: try { try decoder.decodeSingularUInt32Field(value: &self.id) }()
      case 3: try { try decoder.decodeSingularBoolField(value: &self.unique) }()
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.fields.isEmpty {
      try visitor.visitSingularStringField(value: self.fields, fieldNumber: 1)
    }
    if self.id != 0 {
      try visitor.visitSingularUInt32Field(value: self.id, fieldNumber: 2)
    }
    if self.unique != false {
      try visitor.visitSingularBoolField(value: self.unique, fieldNumber: 3)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Cosmos_Orm_V1_SecondaryIndexDescriptor, rhs: Cosmos_Orm_V1_SecondaryIndexDescriptor) -> Bool {
    if lhs.fields != rhs.fields {return false}
    if lhs.id != rhs.id {return false}
    if lhs.unique != rhs.unique {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Cosmos_Orm_V1_SingletonDescriptor: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".SingletonDescriptor"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "id"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularUInt32Field(value: &self.id) }()
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if self.id != 0 {
      try visitor.visitSingularUInt32Field(value: self.id, fieldNumber: 1)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Cosmos_Orm_V1_SingletonDescriptor, rhs: Cosmos_Orm_V1_SingletonDescriptor) -> Bool {
    if lhs.id != rhs.id {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}
