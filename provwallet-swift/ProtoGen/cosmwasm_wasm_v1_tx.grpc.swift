//
// DO NOT EDIT.
//
// Generated by the protocol buffer compiler.
// Source: cosmwasm/wasm/v1/tx.proto
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


/// Msg defines the wasm Msg service.
///
/// Usage: instantiate `Cosmwasm_Wasm_V1_MsgClient`, then call methods of this protocol to make API calls.
internal protocol Cosmwasm_Wasm_V1_MsgClientProtocol: GRPCClient {
  var serviceName: String { get }
  var interceptors: Cosmwasm_Wasm_V1_MsgClientInterceptorFactoryProtocol? { get }

  func storeCode(
    _ request: Cosmwasm_Wasm_V1_MsgStoreCode,
    callOptions: CallOptions?
  ) -> UnaryCall<Cosmwasm_Wasm_V1_MsgStoreCode, Cosmwasm_Wasm_V1_MsgStoreCodeResponse>

  func instantiateContract(
    _ request: Cosmwasm_Wasm_V1_MsgInstantiateContract,
    callOptions: CallOptions?
  ) -> UnaryCall<Cosmwasm_Wasm_V1_MsgInstantiateContract, Cosmwasm_Wasm_V1_MsgInstantiateContractResponse>

  func executeContract(
    _ request: Cosmwasm_Wasm_V1_MsgExecuteContract,
    callOptions: CallOptions?
  ) -> UnaryCall<Cosmwasm_Wasm_V1_MsgExecuteContract, Cosmwasm_Wasm_V1_MsgExecuteContractResponse>

  func migrateContract(
    _ request: Cosmwasm_Wasm_V1_MsgMigrateContract,
    callOptions: CallOptions?
  ) -> UnaryCall<Cosmwasm_Wasm_V1_MsgMigrateContract, Cosmwasm_Wasm_V1_MsgMigrateContractResponse>

  func updateAdmin(
    _ request: Cosmwasm_Wasm_V1_MsgUpdateAdmin,
    callOptions: CallOptions?
  ) -> UnaryCall<Cosmwasm_Wasm_V1_MsgUpdateAdmin, Cosmwasm_Wasm_V1_MsgUpdateAdminResponse>

  func clearAdmin(
    _ request: Cosmwasm_Wasm_V1_MsgClearAdmin,
    callOptions: CallOptions?
  ) -> UnaryCall<Cosmwasm_Wasm_V1_MsgClearAdmin, Cosmwasm_Wasm_V1_MsgClearAdminResponse>
}

extension Cosmwasm_Wasm_V1_MsgClientProtocol {
  internal var serviceName: String {
    return "cosmwasm.wasm.v1.Msg"
  }

  /// StoreCode to submit Wasm code to the system
  ///
  /// - Parameters:
  ///   - request: Request to send to StoreCode.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func storeCode(
    _ request: Cosmwasm_Wasm_V1_MsgStoreCode,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Cosmwasm_Wasm_V1_MsgStoreCode, Cosmwasm_Wasm_V1_MsgStoreCodeResponse> {
    return self.makeUnaryCall(
      path: "/cosmwasm.wasm.v1.Msg/StoreCode",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeStoreCodeInterceptors() ?? []
    )
  }

  ///  Instantiate creates a new smart contract instance for the given code id.
  ///
  /// - Parameters:
  ///   - request: Request to send to InstantiateContract.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func instantiateContract(
    _ request: Cosmwasm_Wasm_V1_MsgInstantiateContract,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Cosmwasm_Wasm_V1_MsgInstantiateContract, Cosmwasm_Wasm_V1_MsgInstantiateContractResponse> {
    return self.makeUnaryCall(
      path: "/cosmwasm.wasm.v1.Msg/InstantiateContract",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeInstantiateContractInterceptors() ?? []
    )
  }

  /// Execute submits the given message data to a smart contract
  ///
  /// - Parameters:
  ///   - request: Request to send to ExecuteContract.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func executeContract(
    _ request: Cosmwasm_Wasm_V1_MsgExecuteContract,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Cosmwasm_Wasm_V1_MsgExecuteContract, Cosmwasm_Wasm_V1_MsgExecuteContractResponse> {
    return self.makeUnaryCall(
      path: "/cosmwasm.wasm.v1.Msg/ExecuteContract",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeExecuteContractInterceptors() ?? []
    )
  }

  /// Migrate runs a code upgrade/ downgrade for a smart contract
  ///
  /// - Parameters:
  ///   - request: Request to send to MigrateContract.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func migrateContract(
    _ request: Cosmwasm_Wasm_V1_MsgMigrateContract,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Cosmwasm_Wasm_V1_MsgMigrateContract, Cosmwasm_Wasm_V1_MsgMigrateContractResponse> {
    return self.makeUnaryCall(
      path: "/cosmwasm.wasm.v1.Msg/MigrateContract",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeMigrateContractInterceptors() ?? []
    )
  }

  /// UpdateAdmin sets a new   admin for a smart contract
  ///
  /// - Parameters:
  ///   - request: Request to send to UpdateAdmin.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func updateAdmin(
    _ request: Cosmwasm_Wasm_V1_MsgUpdateAdmin,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Cosmwasm_Wasm_V1_MsgUpdateAdmin, Cosmwasm_Wasm_V1_MsgUpdateAdminResponse> {
    return self.makeUnaryCall(
      path: "/cosmwasm.wasm.v1.Msg/UpdateAdmin",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeUpdateAdminInterceptors() ?? []
    )
  }

  /// ClearAdmin removes any admin stored for a smart contract
  ///
  /// - Parameters:
  ///   - request: Request to send to ClearAdmin.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func clearAdmin(
    _ request: Cosmwasm_Wasm_V1_MsgClearAdmin,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Cosmwasm_Wasm_V1_MsgClearAdmin, Cosmwasm_Wasm_V1_MsgClearAdminResponse> {
    return self.makeUnaryCall(
      path: "/cosmwasm.wasm.v1.Msg/ClearAdmin",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeClearAdminInterceptors() ?? []
    )
  }
}

internal protocol Cosmwasm_Wasm_V1_MsgClientInterceptorFactoryProtocol {

  /// - Returns: Interceptors to use when invoking 'storeCode'.
  func makeStoreCodeInterceptors() -> [ClientInterceptor<Cosmwasm_Wasm_V1_MsgStoreCode, Cosmwasm_Wasm_V1_MsgStoreCodeResponse>]

  /// - Returns: Interceptors to use when invoking 'instantiateContract'.
  func makeInstantiateContractInterceptors() -> [ClientInterceptor<Cosmwasm_Wasm_V1_MsgInstantiateContract, Cosmwasm_Wasm_V1_MsgInstantiateContractResponse>]

  /// - Returns: Interceptors to use when invoking 'executeContract'.
  func makeExecuteContractInterceptors() -> [ClientInterceptor<Cosmwasm_Wasm_V1_MsgExecuteContract, Cosmwasm_Wasm_V1_MsgExecuteContractResponse>]

  /// - Returns: Interceptors to use when invoking 'migrateContract'.
  func makeMigrateContractInterceptors() -> [ClientInterceptor<Cosmwasm_Wasm_V1_MsgMigrateContract, Cosmwasm_Wasm_V1_MsgMigrateContractResponse>]

  /// - Returns: Interceptors to use when invoking 'updateAdmin'.
  func makeUpdateAdminInterceptors() -> [ClientInterceptor<Cosmwasm_Wasm_V1_MsgUpdateAdmin, Cosmwasm_Wasm_V1_MsgUpdateAdminResponse>]

  /// - Returns: Interceptors to use when invoking 'clearAdmin'.
  func makeClearAdminInterceptors() -> [ClientInterceptor<Cosmwasm_Wasm_V1_MsgClearAdmin, Cosmwasm_Wasm_V1_MsgClearAdminResponse>]
}

internal final class Cosmwasm_Wasm_V1_MsgClient: Cosmwasm_Wasm_V1_MsgClientProtocol {
  internal let channel: GRPCChannel
  internal var defaultCallOptions: CallOptions
  internal var interceptors: Cosmwasm_Wasm_V1_MsgClientInterceptorFactoryProtocol?

  /// Creates a client for the cosmwasm.wasm.v1.Msg service.
  ///
  /// - Parameters:
  ///   - channel: `GRPCChannel` to the service host.
  ///   - defaultCallOptions: Options to use for each service call if the user doesn't provide them.
  ///   - interceptors: A factory providing interceptors for each RPC.
  internal init(
    channel: GRPCChannel,
    defaultCallOptions: CallOptions = CallOptions(),
    interceptors: Cosmwasm_Wasm_V1_MsgClientInterceptorFactoryProtocol? = nil
  ) {
    self.channel = channel
    self.defaultCallOptions = defaultCallOptions
    self.interceptors = interceptors
  }
}

