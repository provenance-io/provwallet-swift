//
// DO NOT EDIT.
//
// Generated by the protocol buffer compiler.
// Source: provenance/marker/v1/tx.proto
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


/// Msg defines the Marker Msg service.
///
/// Usage: instantiate `Provenance_Marker_V1_MsgClient`, then call methods of this protocol to make API calls.
internal protocol Provenance_Marker_V1_MsgClientProtocol: GRPCClient {
  var serviceName: String { get }
  var interceptors: Provenance_Marker_V1_MsgClientInterceptorFactoryProtocol? { get }

  func finalize(
    _ request: Provenance_Marker_V1_MsgFinalizeRequest,
    callOptions: CallOptions?
  ) -> UnaryCall<Provenance_Marker_V1_MsgFinalizeRequest, Provenance_Marker_V1_MsgFinalizeResponse>

  func activate(
    _ request: Provenance_Marker_V1_MsgActivateRequest,
    callOptions: CallOptions?
  ) -> UnaryCall<Provenance_Marker_V1_MsgActivateRequest, Provenance_Marker_V1_MsgActivateResponse>

  func cancel(
    _ request: Provenance_Marker_V1_MsgCancelRequest,
    callOptions: CallOptions?
  ) -> UnaryCall<Provenance_Marker_V1_MsgCancelRequest, Provenance_Marker_V1_MsgCancelResponse>

  func delete(
    _ request: Provenance_Marker_V1_MsgDeleteRequest,
    callOptions: CallOptions?
  ) -> UnaryCall<Provenance_Marker_V1_MsgDeleteRequest, Provenance_Marker_V1_MsgDeleteResponse>

  func mint(
    _ request: Provenance_Marker_V1_MsgMintRequest,
    callOptions: CallOptions?
  ) -> UnaryCall<Provenance_Marker_V1_MsgMintRequest, Provenance_Marker_V1_MsgMintResponse>

  func burn(
    _ request: Provenance_Marker_V1_MsgBurnRequest,
    callOptions: CallOptions?
  ) -> UnaryCall<Provenance_Marker_V1_MsgBurnRequest, Provenance_Marker_V1_MsgBurnResponse>

  func addAccess(
    _ request: Provenance_Marker_V1_MsgAddAccessRequest,
    callOptions: CallOptions?
  ) -> UnaryCall<Provenance_Marker_V1_MsgAddAccessRequest, Provenance_Marker_V1_MsgAddAccessResponse>

  func deleteAccess(
    _ request: Provenance_Marker_V1_MsgDeleteAccessRequest,
    callOptions: CallOptions?
  ) -> UnaryCall<Provenance_Marker_V1_MsgDeleteAccessRequest, Provenance_Marker_V1_MsgDeleteAccessResponse>

  func withdraw(
    _ request: Provenance_Marker_V1_MsgWithdrawRequest,
    callOptions: CallOptions?
  ) -> UnaryCall<Provenance_Marker_V1_MsgWithdrawRequest, Provenance_Marker_V1_MsgWithdrawResponse>

  func addMarker(
    _ request: Provenance_Marker_V1_MsgAddMarkerRequest,
    callOptions: CallOptions?
  ) -> UnaryCall<Provenance_Marker_V1_MsgAddMarkerRequest, Provenance_Marker_V1_MsgAddMarkerResponse>

  func transfer(
    _ request: Provenance_Marker_V1_MsgTransferRequest,
    callOptions: CallOptions?
  ) -> UnaryCall<Provenance_Marker_V1_MsgTransferRequest, Provenance_Marker_V1_MsgTransferResponse>

  func setDenomMetadata(
    _ request: Provenance_Marker_V1_MsgSetDenomMetadataRequest,
    callOptions: CallOptions?
  ) -> UnaryCall<Provenance_Marker_V1_MsgSetDenomMetadataRequest, Provenance_Marker_V1_MsgSetDenomMetadataResponse>
}

extension Provenance_Marker_V1_MsgClientProtocol {
  internal var serviceName: String {
    return "provenance.marker.v1.Msg"
  }

  /// Finalize
  ///
  /// - Parameters:
  ///   - request: Request to send to Finalize.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func finalize(
    _ request: Provenance_Marker_V1_MsgFinalizeRequest,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Provenance_Marker_V1_MsgFinalizeRequest, Provenance_Marker_V1_MsgFinalizeResponse> {
    return self.makeUnaryCall(
      path: "/provenance.marker.v1.Msg/Finalize",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeFinalizeInterceptors() ?? []
    )
  }

  /// Activate
  ///
  /// - Parameters:
  ///   - request: Request to send to Activate.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func activate(
    _ request: Provenance_Marker_V1_MsgActivateRequest,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Provenance_Marker_V1_MsgActivateRequest, Provenance_Marker_V1_MsgActivateResponse> {
    return self.makeUnaryCall(
      path: "/provenance.marker.v1.Msg/Activate",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeActivateInterceptors() ?? []
    )
  }

  /// Cancel
  ///
  /// - Parameters:
  ///   - request: Request to send to Cancel.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func cancel(
    _ request: Provenance_Marker_V1_MsgCancelRequest,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Provenance_Marker_V1_MsgCancelRequest, Provenance_Marker_V1_MsgCancelResponse> {
    return self.makeUnaryCall(
      path: "/provenance.marker.v1.Msg/Cancel",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeCancelInterceptors() ?? []
    )
  }

  /// Delete
  ///
  /// - Parameters:
  ///   - request: Request to send to Delete.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func delete(
    _ request: Provenance_Marker_V1_MsgDeleteRequest,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Provenance_Marker_V1_MsgDeleteRequest, Provenance_Marker_V1_MsgDeleteResponse> {
    return self.makeUnaryCall(
      path: "/provenance.marker.v1.Msg/Delete",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeDeleteInterceptors() ?? []
    )
  }

  /// Mint
  ///
  /// - Parameters:
  ///   - request: Request to send to Mint.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func mint(
    _ request: Provenance_Marker_V1_MsgMintRequest,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Provenance_Marker_V1_MsgMintRequest, Provenance_Marker_V1_MsgMintResponse> {
    return self.makeUnaryCall(
      path: "/provenance.marker.v1.Msg/Mint",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeMintInterceptors() ?? []
    )
  }

  /// Burn
  ///
  /// - Parameters:
  ///   - request: Request to send to Burn.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func burn(
    _ request: Provenance_Marker_V1_MsgBurnRequest,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Provenance_Marker_V1_MsgBurnRequest, Provenance_Marker_V1_MsgBurnResponse> {
    return self.makeUnaryCall(
      path: "/provenance.marker.v1.Msg/Burn",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeBurnInterceptors() ?? []
    )
  }

  /// AddAccess
  ///
  /// - Parameters:
  ///   - request: Request to send to AddAccess.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func addAccess(
    _ request: Provenance_Marker_V1_MsgAddAccessRequest,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Provenance_Marker_V1_MsgAddAccessRequest, Provenance_Marker_V1_MsgAddAccessResponse> {
    return self.makeUnaryCall(
      path: "/provenance.marker.v1.Msg/AddAccess",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeAddAccessInterceptors() ?? []
    )
  }

  /// DeleteAccess
  ///
  /// - Parameters:
  ///   - request: Request to send to DeleteAccess.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func deleteAccess(
    _ request: Provenance_Marker_V1_MsgDeleteAccessRequest,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Provenance_Marker_V1_MsgDeleteAccessRequest, Provenance_Marker_V1_MsgDeleteAccessResponse> {
    return self.makeUnaryCall(
      path: "/provenance.marker.v1.Msg/DeleteAccess",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeDeleteAccessInterceptors() ?? []
    )
  }

  /// Withdraw
  ///
  /// - Parameters:
  ///   - request: Request to send to Withdraw.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func withdraw(
    _ request: Provenance_Marker_V1_MsgWithdrawRequest,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Provenance_Marker_V1_MsgWithdrawRequest, Provenance_Marker_V1_MsgWithdrawResponse> {
    return self.makeUnaryCall(
      path: "/provenance.marker.v1.Msg/Withdraw",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeWithdrawInterceptors() ?? []
    )
  }

  /// AddMarker
  ///
  /// - Parameters:
  ///   - request: Request to send to AddMarker.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func addMarker(
    _ request: Provenance_Marker_V1_MsgAddMarkerRequest,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Provenance_Marker_V1_MsgAddMarkerRequest, Provenance_Marker_V1_MsgAddMarkerResponse> {
    return self.makeUnaryCall(
      path: "/provenance.marker.v1.Msg/AddMarker",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeAddMarkerInterceptors() ?? []
    )
  }

  /// Transfer marker denominated coin between accounts
  ///
  /// - Parameters:
  ///   - request: Request to send to Transfer.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func transfer(
    _ request: Provenance_Marker_V1_MsgTransferRequest,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Provenance_Marker_V1_MsgTransferRequest, Provenance_Marker_V1_MsgTransferResponse> {
    return self.makeUnaryCall(
      path: "/provenance.marker.v1.Msg/Transfer",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeTransferInterceptors() ?? []
    )
  }

  /// Allows Denom Metadata (see bank module) to be set for the Marker's Denom
  ///
  /// - Parameters:
  ///   - request: Request to send to SetDenomMetadata.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func setDenomMetadata(
    _ request: Provenance_Marker_V1_MsgSetDenomMetadataRequest,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Provenance_Marker_V1_MsgSetDenomMetadataRequest, Provenance_Marker_V1_MsgSetDenomMetadataResponse> {
    return self.makeUnaryCall(
      path: "/provenance.marker.v1.Msg/SetDenomMetadata",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeSetDenomMetadataInterceptors() ?? []
    )
  }
}

internal protocol Provenance_Marker_V1_MsgClientInterceptorFactoryProtocol {

  /// - Returns: Interceptors to use when invoking 'finalize'.
  func makeFinalizeInterceptors() -> [ClientInterceptor<Provenance_Marker_V1_MsgFinalizeRequest, Provenance_Marker_V1_MsgFinalizeResponse>]

  /// - Returns: Interceptors to use when invoking 'activate'.
  func makeActivateInterceptors() -> [ClientInterceptor<Provenance_Marker_V1_MsgActivateRequest, Provenance_Marker_V1_MsgActivateResponse>]

  /// - Returns: Interceptors to use when invoking 'cancel'.
  func makeCancelInterceptors() -> [ClientInterceptor<Provenance_Marker_V1_MsgCancelRequest, Provenance_Marker_V1_MsgCancelResponse>]

  /// - Returns: Interceptors to use when invoking 'delete'.
  func makeDeleteInterceptors() -> [ClientInterceptor<Provenance_Marker_V1_MsgDeleteRequest, Provenance_Marker_V1_MsgDeleteResponse>]

  /// - Returns: Interceptors to use when invoking 'mint'.
  func makeMintInterceptors() -> [ClientInterceptor<Provenance_Marker_V1_MsgMintRequest, Provenance_Marker_V1_MsgMintResponse>]

  /// - Returns: Interceptors to use when invoking 'burn'.
  func makeBurnInterceptors() -> [ClientInterceptor<Provenance_Marker_V1_MsgBurnRequest, Provenance_Marker_V1_MsgBurnResponse>]

  /// - Returns: Interceptors to use when invoking 'addAccess'.
  func makeAddAccessInterceptors() -> [ClientInterceptor<Provenance_Marker_V1_MsgAddAccessRequest, Provenance_Marker_V1_MsgAddAccessResponse>]

  /// - Returns: Interceptors to use when invoking 'deleteAccess'.
  func makeDeleteAccessInterceptors() -> [ClientInterceptor<Provenance_Marker_V1_MsgDeleteAccessRequest, Provenance_Marker_V1_MsgDeleteAccessResponse>]

  /// - Returns: Interceptors to use when invoking 'withdraw'.
  func makeWithdrawInterceptors() -> [ClientInterceptor<Provenance_Marker_V1_MsgWithdrawRequest, Provenance_Marker_V1_MsgWithdrawResponse>]

  /// - Returns: Interceptors to use when invoking 'addMarker'.
  func makeAddMarkerInterceptors() -> [ClientInterceptor<Provenance_Marker_V1_MsgAddMarkerRequest, Provenance_Marker_V1_MsgAddMarkerResponse>]

  /// - Returns: Interceptors to use when invoking 'transfer'.
  func makeTransferInterceptors() -> [ClientInterceptor<Provenance_Marker_V1_MsgTransferRequest, Provenance_Marker_V1_MsgTransferResponse>]

  /// - Returns: Interceptors to use when invoking 'setDenomMetadata'.
  func makeSetDenomMetadataInterceptors() -> [ClientInterceptor<Provenance_Marker_V1_MsgSetDenomMetadataRequest, Provenance_Marker_V1_MsgSetDenomMetadataResponse>]
}

internal final class Provenance_Marker_V1_MsgClient: Provenance_Marker_V1_MsgClientProtocol {
  internal let channel: GRPCChannel
  internal var defaultCallOptions: CallOptions
  internal var interceptors: Provenance_Marker_V1_MsgClientInterceptorFactoryProtocol?

  /// Creates a client for the provenance.marker.v1.Msg service.
  ///
  /// - Parameters:
  ///   - channel: `GRPCChannel` to the service host.
  ///   - defaultCallOptions: Options to use for each service call if the user doesn't provide them.
  ///   - interceptors: A factory providing interceptors for each RPC.
  internal init(
    channel: GRPCChannel,
    defaultCallOptions: CallOptions = CallOptions(),
    interceptors: Provenance_Marker_V1_MsgClientInterceptorFactoryProtocol? = nil
  ) {
    self.channel = channel
    self.defaultCallOptions = defaultCallOptions
    self.interceptors = interceptors
  }
}
