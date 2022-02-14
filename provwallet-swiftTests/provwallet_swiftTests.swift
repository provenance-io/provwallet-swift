//
//  provwallet_swiftTests.swift
//  provwallet-swiftTests
//
//  Created by Jason Davidson on 2/1/21.
//
//

import XCTest
@testable import provwallet_swift

class provwallet_swiftTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let url = URL(string: "sparklyunicorn://wc:b7fa57f5-df95-47d4-9d9c-285b20c7dca2@1/?bridge=wss%3A%2F%2Ftest.figure.tech%2Fservice-wallet-connect-bridge%2Fws%2Fexternal&key=a20e748a251f9f3e91dea0e2a813a1dc155ae66c04fc5a05719f682ffb0cfba8")!
        print(url.scheme)
        print(url.path)
        print(url.relativeString)
        print(url.description)
        print(url.user)
        print(url.password)
        print(url.host)
        print(url.query)

        let wc = "\(url.user.unsafelyUnwrapped):\(url.password.unsafelyUnwrapped)@\(url.host.unsafelyUnwrapped)/?\(url.query.unsafelyUnwrapped)"
        print(wc)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
