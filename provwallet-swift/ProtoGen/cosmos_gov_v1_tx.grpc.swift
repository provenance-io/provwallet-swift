//
// DO NOT EDIT.
//
// Generated by the protocol buffer compiler.
// Source: cosmos/gov/v1/tx.proto
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


/// Msg defines the gov Msg service.
///
/// Usage: instantiate `Cosmos_Gov_V1_MsgClient`, then call methods of this protocol to make API calls.
internal protocol Cosmos_Gov_V1_MsgClientProtocol: GRPCClient {
  var serviceName: String { get }
  var interceptors: Cosmos_Gov_V1_MsgClientInterceptorFactoryProtocol? { get }

  func submitProposal(
    _ request: Cosmos_Gov_V1_MsgSubmitProposal,
    callOptions: CallOptions?
  ) -> UnaryCall<Cosmos_Gov_V1_MsgSubmitProposal, Cosmos_Gov_V1_MsgSubmitProposalResponse>

  func execLegacyContent(
    _ request: Cosmos_Gov_V1_MsgExecLegacyContent,
    callOptions: CallOptions?
  ) -> UnaryCall<Cosmos_Gov_V1_MsgExecLegacyContent, Cosmos_Gov_V1_MsgExecLegacyContentResponse>

  func vote(
    _ request: Cosmos_Gov_V1_MsgVote,
    callOptions: CallOptions?
  ) -> UnaryCall<Cosmos_Gov_V1_MsgVote, Cosmos_Gov_V1_MsgVoteResponse>

  func voteWeighted(
    _ request: Cosmos_Gov_V1_MsgVoteWeighted,
    callOptions: CallOptions?
  ) -> UnaryCall<Cosmos_Gov_V1_MsgVoteWeighted, Cosmos_Gov_V1_MsgVoteWeightedResponse>

  func deposit(
    _ request: Cosmos_Gov_V1_MsgDeposit,
    callOptions: CallOptions?
  ) -> UnaryCall<Cosmos_Gov_V1_MsgDeposit, Cosmos_Gov_V1_MsgDepositResponse>
}

extension Cosmos_Gov_V1_MsgClientProtocol {
  internal var serviceName: String {
    return "cosmos.gov.v1.Msg"
  }

  /// SubmitProposal defines a method to create new proposal given a content.
  ///
  /// - Parameters:
  ///   - request: Request to send to SubmitProposal.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func submitProposal(
    _ request: Cosmos_Gov_V1_MsgSubmitProposal,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Cosmos_Gov_V1_MsgSubmitProposal, Cosmos_Gov_V1_MsgSubmitProposalResponse> {
    return self.makeUnaryCall(
      path: "/cosmos.gov.v1.Msg/SubmitProposal",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeSubmitProposalInterceptors() ?? []
    )
  }

  /// ExecLegacyContent defines a Msg to be in included in a MsgSubmitProposal
  /// to execute a legacy content-based proposal.
  ///
  /// - Parameters:
  ///   - request: Request to send to ExecLegacyContent.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func execLegacyContent(
    _ request: Cosmos_Gov_V1_MsgExecLegacyContent,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Cosmos_Gov_V1_MsgExecLegacyContent, Cosmos_Gov_V1_MsgExecLegacyContentResponse> {
    return self.makeUnaryCall(
      path: "/cosmos.gov.v1.Msg/ExecLegacyContent",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeExecLegacyContentInterceptors() ?? []
    )
  }

  /// Vote defines a method to add a vote on a specific proposal.
  ///
  /// - Parameters:
  ///   - request: Request to send to Vote.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func vote(
    _ request: Cosmos_Gov_V1_MsgVote,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Cosmos_Gov_V1_MsgVote, Cosmos_Gov_V1_MsgVoteResponse> {
    return self.makeUnaryCall(
      path: "/cosmos.gov.v1.Msg/Vote",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeVoteInterceptors() ?? []
    )
  }

  /// VoteWeighted defines a method to add a weighted vote on a specific proposal.
  ///
  /// - Parameters:
  ///   - request: Request to send to VoteWeighted.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func voteWeighted(
    _ request: Cosmos_Gov_V1_MsgVoteWeighted,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Cosmos_Gov_V1_MsgVoteWeighted, Cosmos_Gov_V1_MsgVoteWeightedResponse> {
    return self.makeUnaryCall(
      path: "/cosmos.gov.v1.Msg/VoteWeighted",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeVoteWeightedInterceptors() ?? []
    )
  }

  /// Deposit defines a method to add deposit on a specific proposal.
  ///
  /// - Parameters:
  ///   - request: Request to send to Deposit.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func deposit(
    _ request: Cosmos_Gov_V1_MsgDeposit,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Cosmos_Gov_V1_MsgDeposit, Cosmos_Gov_V1_MsgDepositResponse> {
    return self.makeUnaryCall(
      path: "/cosmos.gov.v1.Msg/Deposit",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeDepositInterceptors() ?? []
    )
  }
}

internal protocol Cosmos_Gov_V1_MsgClientInterceptorFactoryProtocol {

  /// - Returns: Interceptors to use when invoking 'submitProposal'.
  func makeSubmitProposalInterceptors() -> [ClientInterceptor<Cosmos_Gov_V1_MsgSubmitProposal, Cosmos_Gov_V1_MsgSubmitProposalResponse>]

  /// - Returns: Interceptors to use when invoking 'execLegacyContent'.
  func makeExecLegacyContentInterceptors() -> [ClientInterceptor<Cosmos_Gov_V1_MsgExecLegacyContent, Cosmos_Gov_V1_MsgExecLegacyContentResponse>]

  /// - Returns: Interceptors to use when invoking 'vote'.
  func makeVoteInterceptors() -> [ClientInterceptor<Cosmos_Gov_V1_MsgVote, Cosmos_Gov_V1_MsgVoteResponse>]

  /// - Returns: Interceptors to use when invoking 'voteWeighted'.
  func makeVoteWeightedInterceptors() -> [ClientInterceptor<Cosmos_Gov_V1_MsgVoteWeighted, Cosmos_Gov_V1_MsgVoteWeightedResponse>]

  /// - Returns: Interceptors to use when invoking 'deposit'.
  func makeDepositInterceptors() -> [ClientInterceptor<Cosmos_Gov_V1_MsgDeposit, Cosmos_Gov_V1_MsgDepositResponse>]
}

internal final class Cosmos_Gov_V1_MsgClient: Cosmos_Gov_V1_MsgClientProtocol {
  internal let channel: GRPCChannel
  internal var defaultCallOptions: CallOptions
  internal var interceptors: Cosmos_Gov_V1_MsgClientInterceptorFactoryProtocol?

  /// Creates a client for the cosmos.gov.v1.Msg service.
  ///
  /// - Parameters:
  ///   - channel: `GRPCChannel` to the service host.
  ///   - defaultCallOptions: Options to use for each service call if the user doesn't provide them.
  ///   - interceptors: A factory providing interceptors for each RPC.
  internal init(
    channel: GRPCChannel,
    defaultCallOptions: CallOptions = CallOptions(),
    interceptors: Cosmos_Gov_V1_MsgClientInterceptorFactoryProtocol? = nil
  ) {
    self.channel = channel
    self.defaultCallOptions = defaultCallOptions
    self.interceptors = interceptors
  }
}

