//
//  BubbleSortTestCase.swift
//  AlgorithmsTests
//
//  Created by Sam Vanderhyden on 11/21/17.
//  Copyright © 2017 Sam Vanderhyden. All rights reserved.
//

import XCTest
@testable import Algorithms

class BubbleSortTestCase: XCTestCase {
    
    // Test the bubble sort algorithm
    func testBubbleSort() {
        var items = randomIntList(size: 100, lower: 0, upper: 200)
        bubbleSort(items: &items)
        verifySort(items: items)
    }
    
    // Test descending order sort
    func testDescendingOrderBubbleSort() {
        var items = randomIntList(size: 100, lower: 0, upper: 200)
        bubbleSort(items: &items, by: {$1 < $0})
        verifySort(items: items, by: {$1 < $0})
    }
    
    
    
    // Test sort with zero items
    func testSortZeroItems(){
        var items = [Int]()
        bubbleSort(items: &items)
    }
    
    // Test optimized version of the bubble sort algorithm
    func testOptimizedBubbleSort() {
        var items = randomIntList(size: 100, lower: 0, upper: 200)
        optimizedBubbleSort(items: &items)
        verifySort(items: items)
    }
    
    // Test descending order sort
    func testDescendingOrderOptimizedBubbleSort() {
        var items = randomIntList(size: 100, lower: 0, upper: 200)
        optimizedBubbleSort(items: &items, by: {$1 < $0})
        verifySort(items: items, by: {$1 < $0})
    }
    
    // Test optimized bubble sort performance
    // MBP avg = 7.92 seconds
    func testOptimizedBubbleSortPerf(){
        self.measure {
            var items = randomIntList(size: 10000, lower: 0, upper: 200)
            optimizedBubbleSort(items: &items)
        }
    }
}
