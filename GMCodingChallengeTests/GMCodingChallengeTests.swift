//
//  GMCodingChallengeTests.swift
//  GMCodingChallengeTests
//
//  Created by Hin Wong on 6/7/21.
//

import XCTest
@testable import GMCodingChallenge

class GMCodingChallengeTests: XCTestCase {
    
    var sut: MusicResponse?
    
    func test_DecodingResponse() {
        guard let sut = sut else {return}
        let musicArray = sut.results
        XCTAssertEqual(musicArray.count, 1, "Should return at least 1 result")
    }

}
