//
//  CountingSortTestCase.swift
//  AlgorithmsTests
//
//  Created by Sam Vanderhyden on 11/26/17.
//  Copyright © 2017 Sam Vanderhyden. All rights reserved.
//

import XCTest
@testable import Algorithms

class CountingSortTestCase: XCTestCase {

    // Test the counting sort algorithm
    func testCountingSort() {
        let items = randomIntList(size: 100, lower: 0, upper: 200)
        let sorted = countingSort(items: items, maxValue:200)
        XCTAssert(items.count == sorted.count, "Input and output have same count")
        verifySort(items: sorted)
    }
    

    func testCountingSortMultipleZeros(){
        let items = [0,1,3,0,3,2]
        let sorted = countingSort(items: items, maxValue: 3)
        XCTAssert(sorted == [0,0,1,2,3,3],
                  "Array sorted correctly")
    }
    
    
}
