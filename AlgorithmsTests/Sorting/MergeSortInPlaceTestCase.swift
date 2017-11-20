//
//  MergeSortInPlaceTestCase.swift
//  AlgorithmsTests
//
//  Created by Sam Vanderhyden on 11/20/17.
//  Copyright © 2017 Sam Vanderhyden. All rights reserved.
//

import XCTest
@testable import Algorithms

class MergeSortInPlaceTestCase: XCTestCase {

    func testMergeSortInPlace() {
        var items = randomIntList(size: 100, lower: 0, upper: 200)
        mergeSortInPlace(items: &items)
        verifySort(items: items)
    }
    
    // Test performance of in place merge sort
    // MBP avg = 1.468 seconds
    // I am not sure why this is so slow
    func testMergeSortInPlacePerf() {
        self.measure {
            var items = randomIntList(size: 10000, lower: 0, upper: 200)
            mergeSortInPlace(items: &items)
        }
    }
    
    // Test merging ranges that are already in the correct order
    func testMergeAlreadySorted() {
        var items = [1,2,3,4,5]
        mergeInPlace(items:&items, firstRange:0..<2, secondRange:2..<5, by: {$0 < $1})
        XCTAssert(items == [1,2,3,4,5],"Items is unchanged")
    }
    
    // Test merging two items
    func testMergeInPlaceTwoItems(){
        var items = [2,1]
        mergeInPlace(items:&items, firstRange:0..<1, secondRange:1..<2, by: {$0 < $1})
        XCTAssert(items == [1,2], "Items is sorted correctly")
    }
    
    // Test merging 5 items
    func testMergeInPlaceFiveItems(){
        var items = [1,3,5,2,4]
        mergeInPlace(items:&items, firstRange:0..<3, secondRange:3..<5, by: {$0 < $1})
        XCTAssert(items == [1,2,3,4,5],"Items is sorted correctly")
    }
    
    // Test merging 6 items
    func testMergeInPlaceSixItems(){
        var items = [1,3,5,2,4,6]
        mergeInPlace(items:&items, firstRange:0..<3, secondRange:3..<6, by: {$0 < $1})
        XCTAssert(items == [1,2,3,4,5,6],"Items is sorted correctly")
    }
    
    // Test merging only part of an array
    func testMergeInPlacePartialRange() {
        var items = [1,5,7,3,9,9,4,5,6]
        mergeInPlace(items:&items, firstRange:0..<3, secondRange:3..<6, by: {$0 < $1})
        XCTAssert(items == [1,3,5,7,9,9,4,5,6], "Items is  sorted from 0..<6")
    }
}
