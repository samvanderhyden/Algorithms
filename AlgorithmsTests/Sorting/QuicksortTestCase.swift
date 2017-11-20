//
//  QuicksortTestCase.swift
//  Algorithms
//
//  Created by Sam Vanderhyden on 9/4/17.
//  Copyright © 2017 Sam Vanderhyden. All rights reserved.
//

import XCTest
@testable import Algorithms

class QuicksortTestCase: XCTestCase {
    
    // Test with random list
    func testQuicksortLumato(){
        var items = randomIntList(size: 100, lower: 0, upper: 200)
        quickSort(items: &items, partitionType: .lumato)
        verifySort(items: items)
    }
    
    // Test all same items
    func testQuicksortLumatoAllSame(){
        var items = Array(0..<100).map { _ in 0 }
        quickSort(items: &items, partitionType: .lumato)
        verifySort(items: items)
    }

    
    // Test performance of lumato partition
    // MBP avg = 0.070 seconds
    func testQuicksortLumatoPerf() {
        self.measure {
            var items = randomIntList(size: 10000, lower: 0, upper: 200)
            quickSort(items: &items, partitionType: .lumato)
        }
    }
    
    // Test Hoare parition
    func testQuicksortHoare(){
        var items = randomIntList(size: 100, lower: 0, upper: 200)
        quickSort(items: &items, partitionType: .hoare)
        verifySort(items: items)
    }
    
    // Test with all the same value
    func testQuicksortHoareAllSame(){
        var items = Array(0..<100).map { _ in 0 }
        quickSort(items: &items, partitionType: .hoare)
        verifySort(items: items)
    }
    
    // Test performance of hoare partition
    // MBP average = 0.035 seconds
    func testQuicksortHoarePerf() {
        // This is an example of a performance test case.
        self.measure {
            var items = randomIntList(size: 10000, lower: 0, upper: 200)
            quickSort(items: &items, partitionType: .hoare)
        }
    }
}
