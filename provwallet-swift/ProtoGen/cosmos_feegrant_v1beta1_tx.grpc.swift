//
// DO NOT EDIT.
//
// Generated by the protocol buffer compiler.
// Source: cosmos/feegrant/v1beta1/tx.proto
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


/// Msg defines the feegrant msg service.
///
/// Usage: instantiate `Cosmos_Feegrant_V1beta1_MsgClient`, then call methods of this protocol to make API calls.
internal protocol Cosmos_Feegrant_V1beta1_MsgClientProtocol: GRPCClient {
  var serviceName: String { get }
  var interceptors: Cosmos_Feegrant_V1beta1_MsgClientInterceptorFactoryProtocol? { get }

  func grantAllowance(
    _ request: Cosmos_Feegrant_V1beta1_MsgGrantAllowance,
    callOptions: CallOptions?
  ) -> UnaryCall<Cosmos_Feegrant_V1beta1_MsgGrantAllowance, Cosmos_Feegrant_V1beta1_MsgGrantAllowanceResponse>

  func revokeAllowance(
    _ request: Cosmos_Feegrant_V1beta1_MsgRevokeAllowance,
    callOptions: CallOptions?
  ) -> UnaryCall<Cosmos_Feegrant_V1beta1_MsgRevokeAllowance, Cosmos_Feegrant_V1beta1_MsgRevokeAllowanceResponse>
}

extension Cosmos_Feegrant_V1beta1_MsgClientProtocol {
  internal var serviceName: String {
    return "cosmos.feegrant.v1beta1.Msg"
  }

  /// GrantAllowance grants fee allowance to the grantee on the granter's
  /// account with the provided expiration time.
  ///
  /// - Parameters:
  ///   - request: Request to send to GrantAllowance.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func grantAllowance(
    _ request: Cosmos_Feegrant_V1beta1_MsgGrantAllowance,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Cosmos_Feegrant_V1beta1_MsgGrantAllowance, Cosmos_Feegrant_V1beta1_MsgGrantAllowanceResponse> {
    return self.makeUnaryCall(
      path: "/cosmos.feegrant.v1beta1.Msg/GrantAllowance",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeGrantAllowanceInterceptors() ?? []
    )
  }

  /// RevokeAllowance revokes any fee allowance of granter's account that
  /// has been granted to the grantee.
  ///
  /// - Parameters:
  ///   - request: Request to send to RevokeAllowance.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func revokeAllowance(
    _ request: Cosmos_Feegrant_V1beta1_MsgRevokeAllowance,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Cosmos_Feegrant_V1beta1_MsgRevokeAllowance, Cosmos_Feegrant_V1beta1_MsgRevokeAllowanceResponse> {
    return self.makeUnaryCall(
      path: "/cosmos.feegrant.v1beta1.Msg/RevokeAllowance",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeRevokeAllowanceInterceptors() ?? []
    )
  }
}

internal protocol Cosmos_Feegrant_V1beta1_MsgClientInterceptorFactoryProtocol {

  /// - Returns: Interceptors to use when invoking 'grantAllowance'.
  func makeGrantAllowanceInterceptors() -> [ClientInterceptor<Cosmos_Feegrant_V1beta1_MsgGrantAllowance, Cosmos_Feegrant_V1beta1_MsgGrantAllowanceResponse>]

  /// - Returns: Interceptors to use when invoking 'revokeAllowance'.
  func makeRevokeAllowanceInterceptors() -> [ClientInterceptor<Cosmos_Feegrant_V1beta1_MsgRevokeAllowance, Cosmos_Feegrant_V1beta1_MsgRevokeAllowanceResponse>]
}

internal final class Cosmos_Feegrant_V1beta1_MsgClient: Cosmos_Feegrant_V1beta1_MsgClientProtocol {
  internal let channel: GRPCChannel
  internal var defaultCallOptions: CallOptions
  internal var interceptors: Cosmos_Feegrant_V1beta1_MsgClientInterceptorFactoryProtocol?

  /// Creates a client for the cosmos.feegrant.v1beta1.Msg service.
  ///
  /// - Parameters:
  ///   - channel: `GRPCChannel` to the service host.
  ///   - defaultCallOptions: Options to use for each service call if the user doesn't provide them.
  ///   - interceptors: A factory providing interceptors for each RPC.
  internal init(
    channel: GRPCChannel,
    defaultCallOptions: CallOptions = CallOptions(),
    interceptors: Cosmos_Feegrant_V1beta1_MsgClientInterceptorFactoryProtocol? = nil
  ) {
    self.channel = channel
    self.defaultCallOptions = defaultCallOptions
    self.interceptors = interceptors
  }
}
