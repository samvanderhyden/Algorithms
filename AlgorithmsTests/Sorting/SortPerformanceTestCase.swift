//
//  SortPerformanceTestCase.swift
//  AlgorithmsTests
//
//  Created by Sam Vanderhyden on 11/24/17.
//  Copyright © 2017 Sam Vanderhyden. All rights reserved.
//

import Foundation

import XCTest
@testable import Algorithms

class SortPerformanceTestCase: XCTestCase {
    
    //Test the sandard library sort function
    // MBP avg = 0.018 seconds
    func testStandardLibrarySort() {
        self.measure {
            var items = randomIntList(size: 10000, lower: 0, upper: 200)
            items.sort(by: { $0 < $1 })
        }
    }

    // Test heap sort performance
    // MBP avg = .108 seconds
    func testHeapSortPerformance() {
        self.measure {
            var items = randomIntList(size: 10000, lower: 0, upper: 200)
            heapSort(items: &items)
        }
    }
    
    // Test bubble sort performance
    // MBP avg = 30.729 seconds
    func testBubbleSortPerformance() {
        self.measure {
            var items = randomIntList(size: 10000, lower: 0, upper: 200)
            bubbleSort(items: &items)
        }
    }

    // Test insertion sort performance
    // MBP avg = 5.041 seconds
    func testInsertionSortPerformance() {
        self.measure {
            let items = randomIntList(size: 10000, lower: 0, upper: 200)
            let _ = insertionSort(items: items)
        }
    }
    
    // Test performance of in place merge sort
    // MBP avg = 1.468 seconds
    func testMergeSortInPlacePerformance() {
        self.measure {
            var items = randomIntList(size: 10000, lower: 0, upper: 200)
            mergeSortInPlace(items: &items)
        }
    }

    // Test performance of quick sort lumato partition
    // MBP avg = 0.070 seconds
    func testQuicksortLumatoPerformance() {
        self.measure {
            var items = randomIntList(size: 10000, lower: 0, upper: 200)
            quickSort(items: &items, partitionType: .lumato)
        }
    }
    
    // Test performance of quicksort hoare partition
    // MBP average = 0.047 seconds
    func testQuicksortHoarePerformance() {
        self.measure {
            var items = randomIntList(size: 10000, lower: 0, upper: 200)
            quickSort(items: &items, partitionType: .hoare)
        }
    }
    
    // Test merge sort performane
    // MBP avg = 0.124 seconds
    func testMergeSortPerformance() {
        self.measure {
            let items = randomIntList(size: 10000, lower: 0, upper: 200)
            let _ = mergeSort(items: items)
        }
    }
    
    // Test selection sort performance
    // MBP avg = 6.28 seconds
    func testSelectionSortPerformance() {
        self.measure {
            var items = randomIntList(size: 10000, lower: 0, upper: 200)
            selectionSort(items: &items)
        }
    }
    
    // Test counting sort performance
    // MBP avg = 0.009 seconds
    func testCountingSortPerformance() {
        self.measure {
            let items = randomIntList(size: 10000, lower: 0, upper: 200)
            let _ = countingSort(items: items, maxValue: 200)
        }
    }
}
