//
// DO NOT EDIT.
//
// Generated by the protocol buffer compiler.
// Source: cosmos/feegrant/v1beta1/query.proto
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


/// Query defines the gRPC querier service.
///
/// Usage: instantiate `Cosmos_Feegrant_V1beta1_QueryClient`, then call methods of this protocol to make API calls.
internal protocol Cosmos_Feegrant_V1beta1_QueryClientProtocol: GRPCClient {
  var serviceName: String { get }
  var interceptors: Cosmos_Feegrant_V1beta1_QueryClientInterceptorFactoryProtocol? { get }

  func allowance(
    _ request: Cosmos_Feegrant_V1beta1_QueryAllowanceRequest,
    callOptions: CallOptions?
  ) -> UnaryCall<Cosmos_Feegrant_V1beta1_QueryAllowanceRequest, Cosmos_Feegrant_V1beta1_QueryAllowanceResponse>

  func allowances(
    _ request: Cosmos_Feegrant_V1beta1_QueryAllowancesRequest,
    callOptions: CallOptions?
  ) -> UnaryCall<Cosmos_Feegrant_V1beta1_QueryAllowancesRequest, Cosmos_Feegrant_V1beta1_QueryAllowancesResponse>
}

extension Cosmos_Feegrant_V1beta1_QueryClientProtocol {
  internal var serviceName: String {
    return "cosmos.feegrant.v1beta1.Query"
  }

  /// Allowance returns fee granted to the grantee by the granter.
  ///
  /// - Parameters:
  ///   - request: Request to send to Allowance.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func allowance(
    _ request: Cosmos_Feegrant_V1beta1_QueryAllowanceRequest,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Cosmos_Feegrant_V1beta1_QueryAllowanceRequest, Cosmos_Feegrant_V1beta1_QueryAllowanceResponse> {
    return self.makeUnaryCall(
      path: "/cosmos.feegrant.v1beta1.Query/Allowance",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeAllowanceInterceptors() ?? []
    )
  }

  /// Allowances returns all the grants for address.
  ///
  /// - Parameters:
  ///   - request: Request to send to Allowances.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func allowances(
    _ request: Cosmos_Feegrant_V1beta1_QueryAllowancesRequest,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Cosmos_Feegrant_V1beta1_QueryAllowancesRequest, Cosmos_Feegrant_V1beta1_QueryAllowancesResponse> {
    return self.makeUnaryCall(
      path: "/cosmos.feegrant.v1beta1.Query/Allowances",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeAllowancesInterceptors() ?? []
    )
  }
}

internal protocol Cosmos_Feegrant_V1beta1_QueryClientInterceptorFactoryProtocol {

  /// - Returns: Interceptors to use when invoking 'allowance'.
  func makeAllowanceInterceptors() -> [ClientInterceptor<Cosmos_Feegrant_V1beta1_QueryAllowanceRequest, Cosmos_Feegrant_V1beta1_QueryAllowanceResponse>]

  /// - Returns: Interceptors to use when invoking 'allowances'.
  func makeAllowancesInterceptors() -> [ClientInterceptor<Cosmos_Feegrant_V1beta1_QueryAllowancesRequest, Cosmos_Feegrant_V1beta1_QueryAllowancesResponse>]
}

internal final class Cosmos_Feegrant_V1beta1_QueryClient: Cosmos_Feegrant_V1beta1_QueryClientProtocol {
  internal let channel: GRPCChannel
  internal var defaultCallOptions: CallOptions
  internal var interceptors: Cosmos_Feegrant_V1beta1_QueryClientInterceptorFactoryProtocol?

  /// Creates a client for the cosmos.feegrant.v1beta1.Query service.
  ///
  /// - Parameters:
  ///   - channel: `GRPCChannel` to the service host.
  ///   - defaultCallOptions: Options to use for each service call if the user doesn't provide them.
  ///   - interceptors: A factory providing interceptors for each RPC.
  internal init(
    channel: GRPCChannel,
    defaultCallOptions: CallOptions = CallOptions(),
    interceptors: Cosmos_Feegrant_V1beta1_QueryClientInterceptorFactoryProtocol? = nil
  ) {
    self.channel = channel
    self.defaultCallOptions = defaultCallOptions
    self.interceptors = interceptors
  }
}
