//
// DO NOT EDIT.
//
// Generated by the protocol buffer compiler.
// Source: cosmos/upgrade/v1beta1/tx.proto
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


/// Msg defines the upgrade Msg service.
///
/// Usage: instantiate `Cosmos_Upgrade_V1beta1_MsgClient`, then call methods of this protocol to make API calls.
internal protocol Cosmos_Upgrade_V1beta1_MsgClientProtocol: GRPCClient {
  var serviceName: String { get }
  var interceptors: Cosmos_Upgrade_V1beta1_MsgClientInterceptorFactoryProtocol? { get }

  func softwareUpgrade(
    _ request: Cosmos_Upgrade_V1beta1_MsgSoftwareUpgrade,
    callOptions: CallOptions?
  ) -> UnaryCall<Cosmos_Upgrade_V1beta1_MsgSoftwareUpgrade, Cosmos_Upgrade_V1beta1_MsgSoftwareUpgradeResponse>

  func cancelUpgrade(
    _ request: Cosmos_Upgrade_V1beta1_MsgCancelUpgrade,
    callOptions: CallOptions?
  ) -> UnaryCall<Cosmos_Upgrade_V1beta1_MsgCancelUpgrade, Cosmos_Upgrade_V1beta1_MsgCancelUpgradeResponse>
}

extension Cosmos_Upgrade_V1beta1_MsgClientProtocol {
  internal var serviceName: String {
    return "cosmos.upgrade.v1beta1.Msg"
  }

  /// SoftwareUpgrade is a governance operation for initiating a software upgrade.
  ///
  /// Since: cosmos-sdk 0.46
  ///
  /// - Parameters:
  ///   - request: Request to send to SoftwareUpgrade.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func softwareUpgrade(
    _ request: Cosmos_Upgrade_V1beta1_MsgSoftwareUpgrade,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Cosmos_Upgrade_V1beta1_MsgSoftwareUpgrade, Cosmos_Upgrade_V1beta1_MsgSoftwareUpgradeResponse> {
    return self.makeUnaryCall(
      path: "/cosmos.upgrade.v1beta1.Msg/SoftwareUpgrade",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeSoftwareUpgradeInterceptors() ?? []
    )
  }

  /// CancelUpgrade is a governance operation for cancelling a previously
  /// approvid software upgrade.
  ///
  /// Since: cosmos-sdk 0.46
  ///
  /// - Parameters:
  ///   - request: Request to send to CancelUpgrade.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func cancelUpgrade(
    _ request: Cosmos_Upgrade_V1beta1_MsgCancelUpgrade,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Cosmos_Upgrade_V1beta1_MsgCancelUpgrade, Cosmos_Upgrade_V1beta1_MsgCancelUpgradeResponse> {
    return self.makeUnaryCall(
      path: "/cosmos.upgrade.v1beta1.Msg/CancelUpgrade",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeCancelUpgradeInterceptors() ?? []
    )
  }
}

internal protocol Cosmos_Upgrade_V1beta1_MsgClientInterceptorFactoryProtocol {

  /// - Returns: Interceptors to use when invoking 'softwareUpgrade'.
  func makeSoftwareUpgradeInterceptors() -> [ClientInterceptor<Cosmos_Upgrade_V1beta1_MsgSoftwareUpgrade, Cosmos_Upgrade_V1beta1_MsgSoftwareUpgradeResponse>]

  /// - Returns: Interceptors to use when invoking 'cancelUpgrade'.
  func makeCancelUpgradeInterceptors() -> [ClientInterceptor<Cosmos_Upgrade_V1beta1_MsgCancelUpgrade, Cosmos_Upgrade_V1beta1_MsgCancelUpgradeResponse>]
}

internal final class Cosmos_Upgrade_V1beta1_MsgClient: Cosmos_Upgrade_V1beta1_MsgClientProtocol {
  internal let channel: GRPCChannel
  internal var defaultCallOptions: CallOptions
  internal var interceptors: Cosmos_Upgrade_V1beta1_MsgClientInterceptorFactoryProtocol?

  /// Creates a client for the cosmos.upgrade.v1beta1.Msg service.
  ///
  /// - Parameters:
  ///   - channel: `GRPCChannel` to the service host.
  ///   - defaultCallOptions: Options to use for each service call if the user doesn't provide them.
  ///   - interceptors: A factory providing interceptors for each RPC.
  internal init(
    channel: GRPCChannel,
    defaultCallOptions: CallOptions = CallOptions(),
    interceptors: Cosmos_Upgrade_V1beta1_MsgClientInterceptorFactoryProtocol? = nil
  ) {
    self.channel = channel
    self.defaultCallOptions = defaultCallOptions
    self.interceptors = interceptors
  }
}

