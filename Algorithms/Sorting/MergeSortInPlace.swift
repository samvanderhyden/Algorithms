//
//  MergeSortInPlace.swift
//  Algorithms
//
//  Created by Sam Vanderhyden on 11/20/17.
//  Copyright © 2017 Sam Vanderhyden. All rights reserved.
//

import Foundation

/**
 In place version of the merge sort algorithm
 - param items: an array of items
 - param by: a sort comparator
 
 This is running a lot slower than the traditional merge sort
 //TODO try to explain why, not sure at the moment
 */
func mergeSortInPlace<T:Comparable>(items: inout [T], by: SortComparator<T> = {$0 < $1} ) {
    mergeSortInPlaceCore(items: &items, range: 0..<items.count, by: by)
}

/**
Recursive core for in place merge sort
 - param items: an array of items
 - param range: a range in the items array to operate on
 - param by: comparator
 */
func mergeSortInPlaceCore<T:Comparable>(items: inout [T], range:CountableRange<Int>, by: SortComparator<T> ) {
    
    // base recursive case if the range is 1, just return
    guard range.count > 1 else {
        return
    }
    
    // calculate the mid point
    let mid = (range.upperBound - range.lowerBound)/2
    let firstRange = range.lowerBound..<range.lowerBound + mid
    let secondRange = range.lowerBound + mid..<range.upperBound
    
    // first, sort the sub ranges
    mergeSortInPlaceCore(items: &items, range: firstRange, by: by)
    mergeSortInPlaceCore(items: &items, range: secondRange, by: by)
    
    // then merge the sub ranges
    mergeInPlace(items: &items, firstRange: firstRange, secondRange: secondRange, by: by)
}


/**
 Merge two array ranges in a list, keeping sorted order while merging
 - param items: an array of items
 - param firstRange: the first range to merge
 - param second range: the second range to merge
 
 firstRange and secondRange must be contiguous ranges for this to work
 */
func mergeInPlace<T:Comparable>(items: inout [T], firstRange:CountableRange<Int>, secondRange:CountableRange<Int>, by: SortComparator<T> ) {
    
    var firstRange = firstRange
    var secondRange = secondRange
    
    var f = firstRange.lowerBound
    var s = secondRange.lowerBound
    
    while f < firstRange.upperBound && s < secondRange.upperBound {
        if(by(items[f], items[s]) || items[f] == items[s]){
            // if items[f] < items[s], simple increase the f index
            f += 1
        }
        else {
            // if items[s] < items[f], put items[s] at position f, move everything from f..<s up one
            let value = items[s]
            let toShift = items[f..<s]
            items.replaceSubrange(f+1...s, with: toShift)
            items[f] = value
            f += 1
            s += 1
            firstRange = f..<firstRange.upperBound+1
            secondRange = s..<secondRange.upperBound
        }
    }
}
