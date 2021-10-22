//
// DO NOT EDIT.
//
// Generated by the protocol buffer compiler.
// Source: ibc/core/client/v1/query.proto
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


/// Query provides defines the gRPC querier service
///
/// Usage: instantiate `Ibc_Core_Client_V1_QueryClient`, then call methods of this protocol to make API calls.
internal protocol Ibc_Core_Client_V1_QueryClientProtocol: GRPCClient {
  var serviceName: String { get }
  var interceptors: Ibc_Core_Client_V1_QueryClientInterceptorFactoryProtocol? { get }

  func clientState(
    _ request: Ibc_Core_Client_V1_QueryClientStateRequest,
    callOptions: CallOptions?
  ) -> UnaryCall<Ibc_Core_Client_V1_QueryClientStateRequest, Ibc_Core_Client_V1_QueryClientStateResponse>

  func clientStates(
    _ request: Ibc_Core_Client_V1_QueryClientStatesRequest,
    callOptions: CallOptions?
  ) -> UnaryCall<Ibc_Core_Client_V1_QueryClientStatesRequest, Ibc_Core_Client_V1_QueryClientStatesResponse>

  func consensusState(
    _ request: Ibc_Core_Client_V1_QueryConsensusStateRequest,
    callOptions: CallOptions?
  ) -> UnaryCall<Ibc_Core_Client_V1_QueryConsensusStateRequest, Ibc_Core_Client_V1_QueryConsensusStateResponse>

  func consensusStates(
    _ request: Ibc_Core_Client_V1_QueryConsensusStatesRequest,
    callOptions: CallOptions?
  ) -> UnaryCall<Ibc_Core_Client_V1_QueryConsensusStatesRequest, Ibc_Core_Client_V1_QueryConsensusStatesResponse>

  func clientParams(
    _ request: Ibc_Core_Client_V1_QueryClientParamsRequest,
    callOptions: CallOptions?
  ) -> UnaryCall<Ibc_Core_Client_V1_QueryClientParamsRequest, Ibc_Core_Client_V1_QueryClientParamsResponse>
}

extension Ibc_Core_Client_V1_QueryClientProtocol {
  internal var serviceName: String {
    return "ibc.core.client.v1.Query"
  }

  /// ClientState queries an IBC light client.
  ///
  /// - Parameters:
  ///   - request: Request to send to ClientState.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func clientState(
    _ request: Ibc_Core_Client_V1_QueryClientStateRequest,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Ibc_Core_Client_V1_QueryClientStateRequest, Ibc_Core_Client_V1_QueryClientStateResponse> {
    return self.makeUnaryCall(
      path: "/ibc.core.client.v1.Query/ClientState",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeClientStateInterceptors() ?? []
    )
  }

  /// ClientStates queries all the IBC light clients of a chain.
  ///
  /// - Parameters:
  ///   - request: Request to send to ClientStates.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func clientStates(
    _ request: Ibc_Core_Client_V1_QueryClientStatesRequest,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Ibc_Core_Client_V1_QueryClientStatesRequest, Ibc_Core_Client_V1_QueryClientStatesResponse> {
    return self.makeUnaryCall(
      path: "/ibc.core.client.v1.Query/ClientStates",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeClientStatesInterceptors() ?? []
    )
  }

  /// ConsensusState queries a consensus state associated with a client state at
  /// a given height.
  ///
  /// - Parameters:
  ///   - request: Request to send to ConsensusState.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func consensusState(
    _ request: Ibc_Core_Client_V1_QueryConsensusStateRequest,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Ibc_Core_Client_V1_QueryConsensusStateRequest, Ibc_Core_Client_V1_QueryConsensusStateResponse> {
    return self.makeUnaryCall(
      path: "/ibc.core.client.v1.Query/ConsensusState",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeConsensusStateInterceptors() ?? []
    )
  }

  /// ConsensusStates queries all the consensus state associated with a given
  /// client.
  ///
  /// - Parameters:
  ///   - request: Request to send to ConsensusStates.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func consensusStates(
    _ request: Ibc_Core_Client_V1_QueryConsensusStatesRequest,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Ibc_Core_Client_V1_QueryConsensusStatesRequest, Ibc_Core_Client_V1_QueryConsensusStatesResponse> {
    return self.makeUnaryCall(
      path: "/ibc.core.client.v1.Query/ConsensusStates",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeConsensusStatesInterceptors() ?? []
    )
  }

  /// ClientParams queries all parameters of the ibc client.
  ///
  /// - Parameters:
  ///   - request: Request to send to ClientParams.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func clientParams(
    _ request: Ibc_Core_Client_V1_QueryClientParamsRequest,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Ibc_Core_Client_V1_QueryClientParamsRequest, Ibc_Core_Client_V1_QueryClientParamsResponse> {
    return self.makeUnaryCall(
      path: "/ibc.core.client.v1.Query/ClientParams",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeClientParamsInterceptors() ?? []
    )
  }
}

internal protocol Ibc_Core_Client_V1_QueryClientInterceptorFactoryProtocol {

  /// - Returns: Interceptors to use when invoking 'clientState'.
  func makeClientStateInterceptors() -> [ClientInterceptor<Ibc_Core_Client_V1_QueryClientStateRequest, Ibc_Core_Client_V1_QueryClientStateResponse>]

  /// - Returns: Interceptors to use when invoking 'clientStates'.
  func makeClientStatesInterceptors() -> [ClientInterceptor<Ibc_Core_Client_V1_QueryClientStatesRequest, Ibc_Core_Client_V1_QueryClientStatesResponse>]

  /// - Returns: Interceptors to use when invoking 'consensusState'.
  func makeConsensusStateInterceptors() -> [ClientInterceptor<Ibc_Core_Client_V1_QueryConsensusStateRequest, Ibc_Core_Client_V1_QueryConsensusStateResponse>]

  /// - Returns: Interceptors to use when invoking 'consensusStates'.
  func makeConsensusStatesInterceptors() -> [ClientInterceptor<Ibc_Core_Client_V1_QueryConsensusStatesRequest, Ibc_Core_Client_V1_QueryConsensusStatesResponse>]

  /// - Returns: Interceptors to use when invoking 'clientParams'.
  func makeClientParamsInterceptors() -> [ClientInterceptor<Ibc_Core_Client_V1_QueryClientParamsRequest, Ibc_Core_Client_V1_QueryClientParamsResponse>]
}

internal final class Ibc_Core_Client_V1_QueryClient: Ibc_Core_Client_V1_QueryClientProtocol {
  internal let channel: GRPCChannel
  internal var defaultCallOptions: CallOptions
  internal var interceptors: Ibc_Core_Client_V1_QueryClientInterceptorFactoryProtocol?

  /// Creates a client for the ibc.core.client.v1.Query service.
  ///
  /// - Parameters:
  ///   - channel: `GRPCChannel` to the service host.
  ///   - defaultCallOptions: Options to use for each service call if the user doesn't provide them.
  ///   - interceptors: A factory providing interceptors for each RPC.
  internal init(
    channel: GRPCChannel,
    defaultCallOptions: CallOptions = CallOptions(),
    interceptors: Ibc_Core_Client_V1_QueryClientInterceptorFactoryProtocol? = nil
  ) {
    self.channel = channel
    self.defaultCallOptions = defaultCallOptions
    self.interceptors = interceptors
  }
}

