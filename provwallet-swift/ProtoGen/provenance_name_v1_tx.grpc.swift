//
// DO NOT EDIT.
//
// Generated by the protocol buffer compiler.
// Source: provenance/name/v1/tx.proto
//

//
// Copyright 2018, gRPC Authors All rights reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//
import GRPC
import NIO
import SwiftProtobuf


/// Msg defines the bank Msg service.
///
/// Usage: instantiate `Provenance_Name_V1_MsgClient`, then call methods of this protocol to make API calls.
internal protocol Provenance_Name_V1_MsgClientProtocol: GRPCClient {
  var serviceName: String { get }
  var interceptors: Provenance_Name_V1_MsgClientInterceptorFactoryProtocol? { get }

  func bindName(
    _ request: Provenance_Name_V1_MsgBindNameRequest,
    callOptions: CallOptions?
  ) -> UnaryCall<Provenance_Name_V1_MsgBindNameRequest, Provenance_Name_V1_MsgBindNameResponse>

  func deleteName(
    _ request: Provenance_Name_V1_MsgDeleteNameRequest,
    callOptions: CallOptions?
  ) -> UnaryCall<Provenance_Name_V1_MsgDeleteNameRequest, Provenance_Name_V1_MsgDeleteNameResponse>
}

extension Provenance_Name_V1_MsgClientProtocol {
  internal var serviceName: String {
    return "provenance.name.v1.Msg"
  }

  /// BindName binds a name to an address under a root name.
  ///
  /// - Parameters:
  ///   - request: Request to send to BindName.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func bindName(
    _ request: Provenance_Name_V1_MsgBindNameRequest,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Provenance_Name_V1_MsgBindNameRequest, Provenance_Name_V1_MsgBindNameResponse> {
    return self.makeUnaryCall(
      path: "/provenance.name.v1.Msg/BindName",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeBindNameInterceptors() ?? []
    )
  }

  /// DeleteName defines a method to verify a particular invariance.
  ///
  /// - Parameters:
  ///   - request: Request to send to DeleteName.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func deleteName(
    _ request: Provenance_Name_V1_MsgDeleteNameRequest,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Provenance_Name_V1_MsgDeleteNameRequest, Provenance_Name_V1_MsgDeleteNameResponse> {
    return self.makeUnaryCall(
      path: "/provenance.name.v1.Msg/DeleteName",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeDeleteNameInterceptors() ?? []
    )
  }
}

internal protocol Provenance_Name_V1_MsgClientInterceptorFactoryProtocol {

  /// - Returns: Interceptors to use when invoking 'bindName'.
  func makeBindNameInterceptors() -> [ClientInterceptor<Provenance_Name_V1_MsgBindNameRequest, Provenance_Name_V1_MsgBindNameResponse>]

  /// - Returns: Interceptors to use when invoking 'deleteName'.
  func makeDeleteNameInterceptors() -> [ClientInterceptor<Provenance_Name_V1_MsgDeleteNameRequest, Provenance_Name_V1_MsgDeleteNameResponse>]
}

internal final class Provenance_Name_V1_MsgClient: Provenance_Name_V1_MsgClientProtocol {
  internal let channel: GRPCChannel
  internal var defaultCallOptions: CallOptions
  internal var interceptors: Provenance_Name_V1_MsgClientInterceptorFactoryProtocol?

  /// Creates a client for the provenance.name.v1.Msg service.
  ///
  /// - Parameters:
  ///   - channel: `GRPCChannel` to the service host.
  ///   - defaultCallOptions: Options to use for each service call if the user doesn't provide them.
  ///   - interceptors: A factory providing interceptors for each RPC.
  internal init(
    channel: GRPCChannel,
    defaultCallOptions: CallOptions = CallOptions(),
    interceptors: Provenance_Name_V1_MsgClientInterceptorFactoryProtocol? = nil
  ) {
    self.channel = channel
    self.defaultCallOptions = defaultCallOptions
    self.interceptors = interceptors
  }
}
