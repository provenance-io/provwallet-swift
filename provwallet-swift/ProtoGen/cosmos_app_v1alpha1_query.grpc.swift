//
// DO NOT EDIT.
//
// Generated by the protocol buffer compiler.
// Source: cosmos/app/v1alpha1/query.proto
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


/// Query is the app module query service.
///
/// Usage: instantiate `Cosmos_App_V1alpha1_QueryClient`, then call methods of this protocol to make API calls.
internal protocol Cosmos_App_V1alpha1_QueryClientProtocol: GRPCClient {
  var serviceName: String { get }
  var interceptors: Cosmos_App_V1alpha1_QueryClientInterceptorFactoryProtocol? { get }

  func config(
    _ request: Cosmos_App_V1alpha1_QueryConfigRequest,
    callOptions: CallOptions?
  ) -> UnaryCall<Cosmos_App_V1alpha1_QueryConfigRequest, Cosmos_App_V1alpha1_QueryConfigResponse>
}

extension Cosmos_App_V1alpha1_QueryClientProtocol {
  internal var serviceName: String {
    return "cosmos.app.v1alpha1.Query"
  }

  /// Config returns the current app config.
  ///
  /// - Parameters:
  ///   - request: Request to send to Config.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func config(
    _ request: Cosmos_App_V1alpha1_QueryConfigRequest,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Cosmos_App_V1alpha1_QueryConfigRequest, Cosmos_App_V1alpha1_QueryConfigResponse> {
    return self.makeUnaryCall(
      path: "/cosmos.app.v1alpha1.Query/Config",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeConfigInterceptors() ?? []
    )
  }
}

internal protocol Cosmos_App_V1alpha1_QueryClientInterceptorFactoryProtocol {

  /// - Returns: Interceptors to use when invoking 'config'.
  func makeConfigInterceptors() -> [ClientInterceptor<Cosmos_App_V1alpha1_QueryConfigRequest, Cosmos_App_V1alpha1_QueryConfigResponse>]
}

internal final class Cosmos_App_V1alpha1_QueryClient: Cosmos_App_V1alpha1_QueryClientProtocol {
  internal let channel: GRPCChannel
  internal var defaultCallOptions: CallOptions
  internal var interceptors: Cosmos_App_V1alpha1_QueryClientInterceptorFactoryProtocol?

  /// Creates a client for the cosmos.app.v1alpha1.Query service.
  ///
  /// - Parameters:
  ///   - channel: `GRPCChannel` to the service host.
  ///   - defaultCallOptions: Options to use for each service call if the user doesn't provide them.
  ///   - interceptors: A factory providing interceptors for each RPC.
  internal init(
    channel: GRPCChannel,
    defaultCallOptions: CallOptions = CallOptions(),
    interceptors: Cosmos_App_V1alpha1_QueryClientInterceptorFactoryProtocol? = nil
  ) {
    self.channel = channel
    self.defaultCallOptions = defaultCallOptions
    self.interceptors = interceptors
  }
}

