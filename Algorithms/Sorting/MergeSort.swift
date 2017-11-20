//
//  Mergesort.swift
//  Algorithms
//
//  Created by Sam Vanderhyden on 9/5/17.
//  Copyright © 2017 Sam Vanderhyden. All rights reserved.
//

import Foundation

/**
 Merge Sort - break array down into sub arrays until their size is 1 (an array on size 1 is always sorted), then merge them together by iterating through each array and appending the min element, thus preserving the sort order.
 
 Performance:
    1) Merging two arrays is O(n)
    2) The recursive algorithm divides the array in half every time, which equates to log(n) levels in the tree, thus
    3) The algorithm takes n * log(n)
 */

/**
 Sort items using merge sort
 - param items: the list of items to sort
 - param by: the comparator to use, defaults to <
 - return an array of sorted items, in ascending order
 */
func mergeSort<T:Comparable>(items:[T], by:SortComparator<T> = { $0 < $1 }) -> [T] {
    // recursive base case, an array of one item is already sorted
    guard items.count > 1 else {
        return items
    }
    
    // divide the array
    let mid = items.count / 2
    let first = Array(items[0..<mid])
    let second = Array(items[mid...])
    
    // merge the results of sorting the first and second arrays
    return merge(first: mergeSort(items: first, by:by), second: mergeSort(items: second, by:by), by:by)
}

/**
 Merge two lists, resulting list will be sorted if the input lists are sorted
 
 - param first: the first list
 - param second: the second list
 - param by: the comparator to use
 - return, the result of combining the two lists so that if the input lists are sorted, the result list is still sorted
 */
func merge<T:Comparable>(first:[T],second:[T], by: SortComparator<T>) -> [T] {
    var l = [T]()
    var f = 0
    var s = 0
    
    while f < first.count || s < second.count {
        
        while f < first.count && (by(first[f], second[s]) || first[f] == second[s]) {
            l.append(first[f])
            f += 1
        }
        
        // if we are at the end of the first array, just append all remaining elements in the second
        if(f == first.count){
            l += second[s...]
            break
        }
        
        while s < second.count && by(second[s], first[f]) {
            l.append(second[s])
            s += 1
        }
        
        // if we are at the end of the second array, just append all remaining elements in the first array
        if(s == second.count){
            l += first[f...]
            break
        }
    }
    
    return l
}


