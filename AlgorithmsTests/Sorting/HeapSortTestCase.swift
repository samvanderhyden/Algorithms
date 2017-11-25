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

    // Test heap sort
    func testHeapSort() {
        var items = randomIntList(size: 100, lower: 0, upper: 200)
        heapSort(items: &items)
        verifySort(items: items)
    }
    
    // Test heap sort descending
    func testHeapSortDescending() {
        var items = randomIntList(size: 100, lower: 0, upper: 200)
        heapSort(items: &items, by: { $1 < $0 })
        verifySort(items: items, by: { $1 < $0 })
    }
    
    // Test the build heap function
    func testBuildHeap(){
        var items = [1,2,3,4,5] //randomIntList(size: 100, lower: 0, upper: 200)
        buildHeap(items: &items, range: 0..<items.count, by: { $0 < $1 })
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
