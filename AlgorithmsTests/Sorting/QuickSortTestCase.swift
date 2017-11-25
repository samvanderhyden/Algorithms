//
//  QuicksortTestCase.swift
//  Algorithms
//
//  Created by Sam Vanderhyden on 9/4/17.
//  Copyright © 2017 Sam Vanderhyden. All rights reserved.
//

import XCTest
@testable import Algorithms

class QuickSortTestCase: XCTestCase {
    
    // Test with random list
    func testQuicksortLumato(){
        var items = randomIntList(size: 100, lower: 0, upper: 200)
        quickSort(items: &items, partitionType: .lumato)
        verifySort(items: items)
    }
    
    // Test all same items
    func testQuicksortLumatoAllSame() {
        var items = Array(0..<100).map { _ in 0 }
        quickSort(items: &items, partitionType: .lumato)
        verifySort(items: items)
    }
    
    // Test with descending comparator
    func testQuickSortLumatoDescending() {
        var items = randomIntList(size: 100, lower: 0, upper: 200)
        quickSort(items: &items, partitionType: .lumato, by: { $1 < $0 })
        verifySort(items: items, by: { $1 < $0 })
    }
    
    // Test Hoare parition
    func testQuicksortHoare(){
        var items = randomIntList(size: 100, lower: 0, upper: 200)
        quickSort(items: &items, partitionType: .hoare)
        print("\(items)")
        verifySort(items: items)
    }
    
    // Test with all the same value
    func testQuicksortHoareAllSame(){
        var items = Array(0..<100).map { _ in 0 }
        quickSort(items: &items, partitionType: .hoare)
        verifySort(items: items)
    }
    
    // Test with descending comparator
    func testQuickSortHoareDescending() {
        var items = randomIntList(size: 100, lower: 0, upper: 200)
        quickSort(items: &items, partitionType: .hoare, by: { $1 < $0 })
        verifySort(items: items, by: { $1 < $0 })
    }
    
}
