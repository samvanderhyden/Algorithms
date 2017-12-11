//
//  BinarySearch.swift
//  Algorithms
//
//  Created by Sam Vanderhyden on 12/9/17.
//  Copyright © 2017 Sam Vanderhyden. All rights reserved.
//

import Foundation

/**
 Binary search - find an element in a sorted array in log(n) time
 - param items - sorted array of items
 - param target: the target item to find
 - returns the position of target in the array or nil if it is not present
 */
func binarySearch<T:Comparable>(items: [T], target:T, range:CountableRange<Int>? = nil) -> Int? {
    
    let range = range ?? 0..<items.count
    if let f = range.first, let l = range.last {
        let mid = f + (l - f)/2
        if(items[mid] == target){
            return mid
        }
        else if range.count == 1 {
            return nil
        }
        else {
            let searchRange = target < items[mid] ? f..<mid : mid+1..<l+1
            return binarySearch(items: items, target: target, range: searchRange)
        }
    }
    else {
        return nil
    }
}
