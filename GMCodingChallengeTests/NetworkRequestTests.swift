//
//  NetworkRequestTests.swift
//  GMCodingChallengeTests
//
//  Created by Hin Wong on 6/7/21.
//

import XCTest
@testable import GMCodingChallenge

class NetworkRequestTests: XCTestCase {
    
    var sut: NetworkManager?
    
//    func test_DataTaskCompletesWithStatusCode200() {
//        let promise = expectation(description: "Completion handler invoked")
//        var statusCode: Int?
//        var responseError: Error?
//        let dataTask = URLSession.shared.dataTask(with: sut) { data, response, error in
//            statusCode = (response as? HTTPURLResponse)?.statusCode
//            responseError = error
//            promise.fulfill()
//        }
//        dataTask.resume()
//        wait(for: [promise], timeout: 5)
//
//        XCTAssertNil(responseError)
//        XCTAssertEqual(statusCode, 200)
//    }
}
