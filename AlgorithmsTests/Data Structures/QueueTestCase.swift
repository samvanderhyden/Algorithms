//
//  QueueTestCase.swift
//  AlgorithmsTests
//
//  Created by Sam Vanderhyden on 12/11/17.
//  Copyright © 2017 Sam Vanderhyden. All rights reserved.
//

import Foundation

import XCTest
@testable import Algorithms

class QueueTestCase: XCTestCase {
    
    func testPopEmpty() {
        var q = Queue<Int>()
        XCTAssert(q.pop() == nil, "Pop on empty returns nil")
    }
    
    func testPushOne() {
        var q = Queue<Int>()
        q.push(item: 1)
        XCTAssert(q.pop() == 1, "pop returns item pushed")
    }
    
    func testPushTwo() {
        var q = Queue<Int>()
        q.push(item: 1)
        q.push(item: 2)
        XCTAssert(q.pop() == 1, "pop returns item pushed")
        XCTAssert(q.pop() == 2, "pop returns item pushed")
        XCTAssert(q.pop() == nil, "pop returns item pushed")
    }

}
