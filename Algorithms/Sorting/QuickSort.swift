//
//  Quicksort.swift
//  Algorithms
//
//  Created by Sam Vanderhyden on 9/4/17.
//  Copyright © 2017 Sam Vanderhyden. All rights reserved.
//

import Foundation
/**
 Quicksort - simple method of sorting, by partitioning an array where
 1. selecting a pivot value
 2. swapping elements until all values < partion are on one side and all values >= partition are on the other
 
 Performance: 
    - worst case O(n^2) - where one partition gets all the elements sum(i=0..n)(n-i) = O(n^2)
    - average case - O(n * log(n))
    - best case - O(n * log(n))
 */

/**
 Two common partitioning schemes
 */
enum QuickSortPartition {
    case lumato
    case hoare
}

/**
 Sort an array using the quicksort algorithm, in place
 - param items: the items to sort. Ttems will be sorted in place, so the same array will contain the sorted items
 - param partitionType: the partioning scheme to use for quicksort
 - param by: a comparator to use in the sort, defaults to  $0 < $1, ascending sort
 */
func quickSort<T:Comparable>(items:inout [T], partitionType:QuickSortPartition, by:SortComparator<T> = { $0 < $1 }){
    quickSortCore(items: &items, low: 0, high: items.count-1, partitionType: partitionType, by:by)
}

/**
 Recursive core to the quicksort algorithm
 - param items: the items to sort
 - param low: the low index
 - param high: the high index
 - param partitionType: the type of partition to use
 - param by: a comparator to use
 */
func quickSortCore<T:Comparable>(items:inout [T], low:Int, high:Int, partitionType:QuickSortPartition, by:SortComparator<T>){
    guard low < high else {
        return
    }
    
    let endFirst:Int
    let startSecond:Int
    switch partitionType {
    case .lumato:
        // in the lumato partition, the idx returned is in its final position, so subract 1 here so we don't
        // re-partition the index returned
        endFirst = partitionLumato(items: &items, low: low, high: high, by: by) - 1
        startSecond = endFirst + 2
    default:
        // in the hoare partition, the idx returned is not necessairly in its final position, so don't subtract 1
        // we just know that the value at idx is less than all values in greater indicies
        // but we still need to include it in sort of [low,idx] because it might be less than previous values
        endFirst = partitionHoare(items: &items, low: low, high: high, by: by)
        startSecond = endFirst + 1
    }
    
    //recursive calls to sort each side of the array
    quickSortCore(items: &items, low: low, high: endFirst, partitionType: partitionType, by: by)
    quickSortCore(items: &items, low: startSecond, high: high, partitionType: partitionType, by:by)
}


/**
 Lumato partition - loop through the list maintaining an index where the latest element < the pivot resides,
 swapping items as needed
 - param items: the items to partition
 - param low: the low index
 - param high: the high index
 - param by: the comparator to use
 - returns the final position of the pivot element
 */
func partitionLumato<T:Comparable>(items:inout [T], low:Int, high:Int, by: SortComparator<T>) -> Int {
    let pivot = items[high]
    var i = low - 1
    
    // j is always at least 1 ahead of i
    for j in low...high-1 {
        if by(items[j], pivot) {
            i += 1
            items.swapAt(i, j)
        }
    }
    
    // if we end at a situation where the pivot element
    // is less than the i+1 element, swap them
    if by(items[high], items[i+1]) {
        items.swapAt(i+1, high)
    }
    
    return i + 1
}

/**
 Hoare partition - start at either end and compare to pivot, swapping values as needed, until the
 indexes are the same
 - param items: the items to partition
 - param low: the low index
 - param high: the high index
 - param by: the comparator to use
 - returns the partition boundry, but it is not the final position of the pivot
 */
func partitionHoare<T:Comparable>(items:inout [T], low:Int, high:Int, by: SortComparator<T>) -> Int {
    let pivot = items[low] // could be other values
    var i = low-1
    var j = high+1
    while true {
        repeat {
            i += 1
        } while by(items[i],pivot)
        
        repeat {
            j -= 1
        } while by(pivot,items[j])
        
        if i >= j {
            break
        }
        
        items.swapAt(i, j)
    }
    return j
}



