//
//  InsertionSortTestCase.swift
//  AlgorithmsTests
//
//  Created by Sam Vanderhyden on 11/20/17.
//  Copyright © 2017 Sam Vanderhyden. All rights reserved.
//

import XCTest
@testable import Algorithms

class InsertionSortTestCase: XCTestCase {
    
    // Test the insertion sort algorithm
    func testInsertionSort() {
        let items = randomIntList(size: 100, lower: 0, upper: 200)
        let sorted = insertionSort(items: items)
        verifySort(items: sorted)
    }
    
    // Test with descending comparator
    func testDescendingInsertionSort() {
        let items = randomIntList(size: 100, lower: 0, upper: 200)
        let sorted = insertionSort(items: items, by: { $1 < $0 })
        verifySort(items: sorted, by: { $1 < $0 })
    }

    // Test with a array of identical items
    func testInsertionSortAllSame() {
        let items = Array(0..<100).map { _ in 0 }
        let sorted = insertionSort(items: items)
        verifySort(items: sorted)
    }
    
    // Test insertion sort performance
    // MBP avg = 5.041 seconds
    func testInsertionSortPerformance() {
        self.measure {
            let items = randomIntList(size: 10000, lower: 0, upper: 200)
            let _ = insertionSort(items: items)
        }
    }
}


