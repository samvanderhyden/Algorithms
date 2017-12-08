//
//  CountingSort.swift
//  Algorithms
//
//  Created by Sam Vanderhyden on 11/26/17.
//  Copyright © 2017 Sam Vanderhyden. All rights reserved.
//

import Foundation

/**
 Counting sort - works by counting occurances of input items, then summing up the count with all previous counts to find the first index of a given item. Then iterate through the input, placing each item at its correct position
 
 Counting sort can only be used on integers, and the range of values must be known ahead of time
 
- param items, the input array
- param maxValue, the maximum value in the input array, all items in input must be in 0..<maxValue
 
 Performance: Twice through the input array and once through the count array = O(n + maxValue)
 
 */
func countingSort(items: [Int], maxValue:Int) -> [Int] {
    var countArray = Array(repeating: 0, count: maxValue+1)
    
    // count the number of occurances of each item in input, store in count array
    items.forEach { i in
        countArray[i] += 1
    }
    
    // add the current count to the previous count, store in current
    var total = 0
    for i in 0..<maxValue+1 {
        let oldCount = countArray[i]
        countArray[i] = total
        total += oldCount
    }
    
    // create a results array
    var resultsArray = Array(repeating: 0, count: items.count)
    
    // loop through the input, placing each value at the position indicated by the count array
    // then increment the position in the count array
    items.forEach { i in
        let idx = countArray[i]
        resultsArray[idx] = i
        countArray[i] += 1
    }
    
    return resultsArray
}

