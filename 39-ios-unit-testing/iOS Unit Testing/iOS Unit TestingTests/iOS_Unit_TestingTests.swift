//
//  iOS_Unit_TestingTests.swift
//  iOS Unit TestingTests
//
//  Created by Brian Sipple on 3/13/19.
//  Copyright © 2019 Brian Sipple. All rights reserved.
//

import XCTest
@testable import iOS_Unit_Testing

class iOS_Unit_TestingTests: XCTestCase {
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testAllWordsLoaded() {
        let playData = PlayData()
        let actual = playData.allWords.count
        let expected = 18440
        
        XCTAssertEqual(actual, expected, "`allWords` count was not \(expected)")
    }
    
    func testCorrectWordCounts() {
        let wordCounts = [
            "amendment": 2,
            "hath": 732,
            "great": 339
        ]
        
        let playdata = PlayData()
        
        for (word, count) in wordCounts {
            let actual = playdata.wordCounts.count(for: word)
            let expected = count
            
            XCTAssertEqual(actual, expected, "\"\(word)\" did not have a count of \(count)")
        }
    }
    
    func testFilteredWords() {
        let playData = PlayData()
        
        playData.applyCustomFilter({ $0.count >= 10 })
        
        var expected = 2047
        var actual = playData.filteredWords.count
        
        XCTAssertEqual(actual, expected, "`filteredWords` did not have expeted count of \(expected)")
        
        playData.applyCustomFilter { $0.lowercased().contains("swift") }
        
        expected = 7
        actual = playData.filteredWords.count
        XCTAssertEqual(actual, expected, "`filteredWords` did not have expeted count of \(expected)")
    }
}


// MARK: - Performance Tests

extension iOS_Unit_TestingTests {
    func testWordLoadingPerformance() {
        measure {
            _ = PlayData()
        }
    }
}
