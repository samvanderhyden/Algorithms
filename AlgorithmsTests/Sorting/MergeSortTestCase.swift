//
//  MergesortTestCase.swift
//  Algorithms
//
//  Created by Sam Vanderhyden on 9/5/17.
//  Copyright © 2017 Sam Vanderhyden. All rights reserved.
//

import XCTest
@testable import Algorithms

class MergeSortTestCase: XCTestCase {
    
    // Test the merge sort function
    func testMergeSort() {
        let items = randomIntList(size: 100, lower: 0, upper: 200)
        let sorted = mergeSort(items: items)
        verifySort(items: sorted)
        XCTAssert(items.count == sorted.count , "Result has size of input arrays")
    }
    
    // Test the sort with an odd size input
    func testMergeSortOddSize() {
        let items = randomIntList(size: 103, lower: 0, upper: 200)
        let sorted = mergeSort(items: items)
        verifySort(items: sorted)
        XCTAssert(items.count == sorted.count , "Result has size of input arrays")
    }
    
    // Test running sort on all the same items
    func testMergeSortSame() {
        let items = Array(0..<100).map { _ in 0 }
        let sorted = mergeSort(items: items)
        verifySort(items: items)
        XCTAssert(items.count == sorted.count , "Result has size of input arrays")
    }
    
    // Test performane on 10,000 item list
    // MBP avg = 0.124 seconds
    func testMergeSortPerf() {
        self.measure {
            let items = randomIntList(size: 10000, lower: 0, upper: 200)
            let _ = mergeSort(items: items)
        }
    }
   
    // Test the merge function
    func testMergeLists(){
        let l1 = randomIntList(size: 10, lower: 0, upper: 20)
        let l2 = randomIntList(size: 10, lower: 0, upper: 20)
        let l3 = merge(first: l1,second: l2, by: { $0 < $1 })
        XCTAssert(l3.count == (l2.count + l1.count), "Result has size of input arrays")
    }
    
    // Test two different size arrays
    func testMergeDifferentSizes(){
        let l1 = randomIntList(size: 11, lower: 0, upper: 20)
        let l2 = randomIntList(size: 5, lower: 0, upper: 20)
        let l3 = merge(first: l1,second: l2, by: { $0 < $1 })
        XCTAssert(l3.count == (l2.count + l1.count), "Result has size of other two arrays")
    }
    
    // Test two zero size arrays
    func testMergeTwoZeroSizeArrays() {
        let l1 = [Int]()
        let l2 = [Int]()
        let l3 = merge(first: l1,second: l2, by: { $0 < $1 })
        XCTAssert(l3.count == 0, "Result has size zero")
    }
    
    // Test one empty array
    func testMergeOneZeroSizeArray(){
        let l1 = [Int]()
        let l2 = [1]
        let l3 = merge(first: l1,second: l2, by: { $0 < $1 })
        XCTAssert(l3.count == 1, "Result has size 1")
        XCTAssert(l3[0] == 1)
    }
    
    // Test that the result is always sorted
    func testSortedArrays() {
        let l1 = [1,2,3]
        let l2 = [3,4,5]
        let l3 = merge(first: l1,second: l2, by: { $0 < $1 })
        verifySort(items: l3)
        XCTAssert(l3.count == 6, "Result has correct size")
    }
}
