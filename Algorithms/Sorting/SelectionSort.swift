//
//  SelectionSort.swift
//  Algorithms
//
//  Created by Sam Vanderhyden on 11/17/17.
//  Copyright © 2017 Sam Vanderhyden. All rights reserved.
//

import Foundation

/**
 Selection sort - Sort items by itertating though all continuously and finding the min element, putting it at the begining.
 
 - param items, the array to sort
 - param by the comparator to use
 */
func selectionSort<T:Comparable>(items: inout [T], by:SortComparator<T> = { $0 < $1 }){
    var idx = 0
    while idx < items.count {
        let minIdx = minIndex(items: items, startingAt:idx, by:by)
        items.swapAt(idx, minIdx)
        idx += 1
    }
}

/**
Find the index of the minimum value in an array, starting at a particular index
 
 - param items the array to search
 - param startingAt the index to start at
 - param by the comparator to use
 - returns the index of the minimum value
 */
func minIndex<T:Comparable>(items: [T], startingAt:Int, by:SortComparator<T>) -> Int {
    var minIndex = startingAt
    var min = items[minIndex]
    for i in startingAt+1..<items.count {
        if(by(items[i], min)){
            min = items[i]
            minIndex = i
        }
    }
    return minIndex
}
