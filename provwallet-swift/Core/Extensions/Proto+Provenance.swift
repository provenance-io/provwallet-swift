//
// Created by Jason Davidson on 10/24/21.
//

import Foundation
import SwiftProtobuf

extension SwiftProtobuf.Google_Protobuf_Any {

	public static func from(message: Message) throws -> Google_Protobuf_Any {
		try Google_Protobuf_Any.init(message: message, partial: false, typePrefix: "")
	}

}