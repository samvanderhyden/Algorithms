//
//  Mergesort.swift
//  Algorithms
//
//  Created by Sam Vanderhyden on 9/5/17.
//  Copyright © 2017 Sam Vanderhyden. All rights reserved.
//

import Foundation

/**
 Sort items using merge sort
 - param items, the list of items to sort
 - return an array of sorted items, in ascending order
 */
func mergeSort<T:Comparable>(items:[T]) -> [T] {
    let mid = items.count / 2
    var first = Array(items[0..<mid])
    var second = Array(items[mid...])
    
    if(first.count > 1){
        first = mergeSort(items: first)
    }
    
    if(second.count > 1){
        second = mergeSort(items: second)
    }
    
    return merge(first: first, second: second)
}

/**
 Merge two lists, resulting list will be sorted if the input lists are sorted
 
 - param first, the first list
 - param second, the second list
 - return, the result of combining the two lists so that if the input lists are sorted, the result list is still sorted
 */
func merge<T:Comparable>(first:[T],second:[T]) -> [T] {
    var l = [T]()
    var f = 0
    var s = 0
    
    while f < first.count || s < second.count {
        
        while f < first.count && first[f] <= second[s] {
            l.append(first[f])
            f += 1
        }
        
        if(f == first.count){
            l += second[s...]
            break
        }
        
        while s < second.count && second[s] <= first[f] {
            l.append(second[s])
            s += 1
        }
        
        if(s == second.count){
            l += first[f...]
            break
        }
    }
    
    return l
}

