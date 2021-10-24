//
// Created by Jason Davidson on 10/23/21.
//

import Foundation

public enum QueryError: Error {
	case invalidFieldSelector(message: String)
}
public enum AuthError: Error {
	case unhandledError(message: String)
}


