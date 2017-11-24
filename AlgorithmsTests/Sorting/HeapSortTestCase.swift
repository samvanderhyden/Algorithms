//
//  HeapSortTestCase.swift
//  AlgorithmsTests
//
//  Created by Sam Vanderhyden on 11/22/17.
//  Copyright © 2017 Sam Vanderhyden. All rights reserved.
//

import XCTest
@testable import Algorithms

class HeapSortTestCase: XCTestCase {

    func testHeapSort() {
        var items = randomIntList(size: 100, lower: 0, upper: 200)
        heapSort(items: &items)
        verifySort(items: items)
    }
    
    // Test bubble sort performance
    // MBP avg = .096 seconds
    func testHeapSortPerformance() {
        self.measure {
            var items = randomIntList(size: 10000, lower: 0, upper: 200)
            heapSort(items: &items)
        }
    }
    
    func testBuildHeap(){
        var items = [1,2,3,4] //randomIntList(size: 100, lower: 0, upper: 200)
        buildHeap(items: &items, range: 0..<items.count)
        print("Heap: \(items)")
        for idx in 0..<items.count {
            let val = items[idx]
            if let lIdx = leftChild(range: idx..<items.count) {
                let lVal = items[lIdx]
                XCTAssert(val >= lVal, "parent \(val) at \(idx) greater than left child \(lVal) at \(lIdx) ")
            }
            
            if let rIdx = rightChild(range: idx..<items.count){
                let rVal = items[rIdx]
                XCTAssert(val >= rVal, "parent \(val) at \(idx) greater than right child \(rVal) at \(rIdx) ")
            }
        }
    }
    
    
}
