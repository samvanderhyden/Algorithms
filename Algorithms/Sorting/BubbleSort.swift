//
//  BubbleSort.swift
//  Algorithms
//
//  Created by Sam Vanderhyden on 11/21/17.
//  Copyright © 2017 Sam Vanderhyden. All rights reserved.
//

import Foundation

/**
 Bubble sort - loop through array, swapping elements until the array is sorted
 
 - param items: the items to sort
 - param by: the comparator, defaults to ascending order

 Performance:
 
One iteration through the array for every item => n * n-1 iterations => O(n^2)
 
After x passes, the last x elements are in their correct places
 
*/
func bubbleSort<T:Comparable>(items: inout [T], by:SortComparator<T> = { $0 < $1 }) {
    // no need to sort zero or 1 items
    guard items.count > 1 else {
        return
    }
    
    var didSwap = true
    while didSwap {
        // reset didSwap at the begining of every iteration
        didSwap = false
        for i in 0..<items.count-1 {
            if by(items[i+1],items[i]){
                items.swapAt(i, i+1)
                didSwap = true
            }
        }
    }
    
}

/**
 Optimized version of bubble sort that recognizes that after the ith iteration, the last i items are sorted,
 so we can skip those comparisons. This reduced the average sorting time by a factor of 4 on my Macbook pro
 */
func optimizedBubbleSort<T:Comparable>(items: inout [T], by:SortComparator<T> = { $0 < $1 }) {
    // no need to sort zero or 1 items
    guard items.count > 1 else {
        return
    }
    
    var didSwap = true
    var iterationCount = 0
    while didSwap {
        didSwap = false
        for i in 0..<items.count-1 {
            
            if(i > iterationCount){
                break
            }
            
            if by(items[i+1],items[i]){
                items.swapAt(i, i+1)
                didSwap = true
            }
        }
        iterationCount += 1
    }
}
