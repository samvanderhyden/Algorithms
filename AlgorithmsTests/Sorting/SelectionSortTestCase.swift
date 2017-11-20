//
//  SelectionSortTestCase.swift
//  AlgorithmsTests
//
//  Created by Sam Vanderhyden on 11/17/17.
//  Copyright © 2017 Sam Vanderhyden. All rights reserved.
//

import XCTest
@testable import Algorithms

class SelectionSortTestCase: XCTestCase {
    
    // Test the selection sort algorithm
    func testSelectionSort() {
        var items = randomIntList(size: 100, lower: 0, upper: 200)
        selectionSort(items: &items)
        verifySort(items: items)
    }
    
    // Test with descending comparator
    func testDescendingSelectionSort() {
        var items = randomIntList(size: 100, lower: 0, upper: 200)
        selectionSort(items: &items, by: { $1 < $0 })
        verifySort(items: items, by: { $1 < $0 })
    }
    
    // Test with a array of identical items
    func testSelectionSortAllSame() {
        var items = Array(0..<100).map { _ in 0 }
        selectionSort(items: &items)
        verifySort(items: items)
    }
    
    // Test selection sort performance
    // MBP avg = 6.28 seconds
    func testSelectionSortPerformance() {
        self.measure {
            var items = randomIntList(size: 10000, lower: 0, upper: 200)
            selectionSort(items: &items)
        }
    }
    
}
