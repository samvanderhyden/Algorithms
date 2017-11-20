//
//  UtilsTestCase.swift
//  Algorithms
//
//  Created by Sam Vanderhyden on 9/4/17.
//  Copyright © 2017 Sam Vanderhyden. All rights reserved.
//

import XCTest
@testable import Algorithms

class UtilsTestCase: XCTestCase {
    
    func testRandomInt(){
        let x = randomInt(lower:0,upper:100)
        XCTAssert(x >= 0, "generetated number is at least the min")
        XCTAssert(x <= 100, "generated number is at most max")
    }
    
    func testRandomIntList(){
        let list = randomIntList(size: 10, lower: 0, upper: 100)
        XCTAssert(list.count == 10, "list is the size specified")
        for i in list {
            XCTAssert(i <= 100, "item is at most max specified")
            XCTAssert(i >= 0, "item is at least min specified")
        }
    }
}
