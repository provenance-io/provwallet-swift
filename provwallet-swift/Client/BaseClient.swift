//
// Created by Jason Davidson on 10/23/21.
//

import Foundation
import GRPC
import NIO
import SwiftProtobuf

protocol BaseQuery {
	func buildPromise<RequestType, ResponseType, ReturnType>(call: UnaryCall<RequestType, ResponseType>,
	                                                         promiseOf: ReturnType.Type,
	                                                         unpacker: @escaping (ResponseType) throws -> ReturnType) throws -> EventLoopPromise<ReturnType>
}

extension BaseQuery {
	public func buildPromise<RequestType, ResponseType, ReturnType>(call: UnaryCall<RequestType, ResponseType>,
	                                                                promiseOf: ReturnType.Type = ReturnType.self,
	                                                                unpacker: @escaping (ResponseType) throws -> ReturnType) throws -> EventLoopPromise<ReturnType> {
		let promise = call.eventLoop.makePromise(of: ReturnType.self)

		call.response.whenSuccess { response in
			do {
				promise.succeed(try unpacker(response))
			} catch {
				promise.fail(error)
			}
		}
		call.response.whenFailure { error in
			promise.fail(error)
		}

		call.response.whenComplete { result in
			promise.completeWith(result.map { response -> ReturnType in
				do {
					return try unpacker(response)
				} catch {
					return SwiftProtobuf.Google_Protobuf_Any.init() as! ReturnType
				}
			})
		}

		return promise
	}

}