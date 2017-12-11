//
//  BinarySearchTestCase.swift
//  AlgorithmsTests
//
//  Created by Sam Vanderhyden on 12/9/17.
//  Copyright © 2017 Sam Vanderhyden. All rights reserved.
//

import XCTest
@testable import Algorithms

class BinarySearchTestCase: XCTestCase {
    
    func testBinarySearchOneItemExists() {
        let idx = binarySearch(items: [1], target: 1)
        XCTAssert(idx == 0, "Found the item at index 0")
    }
    
    func testBinarySearchOneItemNotExists() {
        let idx = binarySearch(items: [2], target: 1)
        XCTAssert(idx == nil, "Did not find item")
    }
    
    func testBinarySearchNoItems(){
        let idx = binarySearch(items: [], target: 1)
        XCTAssert(idx == nil, "Did not find item")
    }
    
    func testBinarySearchTwoItemsExistsUpper() {
        let idx = binarySearch(items: [1,2], target: 2)
        XCTAssert(idx == 1, "Item found at 1")
    }
    
    func testBinarySearchTwoItemsExistsLower() {
        let idx = binarySearch(items: [1,2], target: 1)
        XCTAssert(idx == 0, "Item found at 0")
    }
    
    func testBinarySearchMoreItems() {
        let idx = binarySearch(items: [1,2,5,6,8,9,11,15,34], target: 8)
        XCTAssert(idx == 4, "Item found at 4")
    }
    
    // todo - this might not always work if there are repeated values
    func testBinarySearchRandomIntArray() {
        let items = randomIntList(size: 1000, lower: 0, upper: 500).sorted()
        let idx = 322
        let found = binarySearch(items: items, target: items[idx])
        XCTAssert(found == idx, "Found item at idx")
    }
}
