//
//  InsertionSort.swift
//  Algorithms
//
//  Created by Sam Vanderhyden on 11/20/17.
//  Copyright © 2017 Sam Vanderhyden. All rights reserved.
//

import Foundation

/**
 Insertion sort: a non optimal sorting algorithm where the output is iterated over with each item from the input in order to determine that item's insertion position
 
 - param items: the list of items to sort
 - param by: the comparator to use, defaults to <
 - return an array of sorted items, in ascending order
 
 Performance: This algorithm runs in O(n^2) time as for each item in the input, the output must be looped through

 */
func insertionSort<T:Comparable>(items: [T], by: SortComparator<T> = { $0 < $1 }) -> [T] {
    var output = [T]()
    for val in items {
        var insertionIdx = 0
        while insertionIdx < output.count && by(output[insertionIdx], val) {
            insertionIdx += 1
        }
        output.insert(val, at: insertionIdx)
    }
    return output
}
