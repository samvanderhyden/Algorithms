//
//  HeapSort.swift
//  Algorithms
//
//  Created by Sam Vanderhyden on 11/21/17.
//  Copyright © 2017 Sam Vanderhyden. All rights reserved.
//

import Foundation

/**
 Heap Sort - build a max or min heap, swapping first and last and reducing the size of the heap by 1,
 then shift down the root element into its correct position.
 
 - param items: the items to sort
 - param by: the comparator to use

 Performance analysis:
 Building the heap takes n steps - every element must be sifted down to its correct position (constant time)
 The swap and sift down takes log(n) for each element, and n elements, thus O(n*log(n))
 */

func heapSort<T:Comparable>(items: inout [T], by: SortComparator<T> = { $0 < $1 }) {
    var range = 0..<items.count
    buildHeap(items: &items, range: range, by:by)
    while range.count > 1 {
        items.swapAt(range.lowerBound, range.upperBound-1)
        range = range.lowerBound..<range.upperBound-1
        siftDown(items: &items, range: range, by: by)
    }
}

/**
 Given an array, turn it into a heap
 - param items: the heap array
 - param range: the range in the array the comprises the heap
 - param by: the sort comparator to use
 */
func buildHeap<T:Comparable>(items: inout [T], range:CountableRange<Int>, by: SortComparator<T>) {
    let a = range.upperBound-1
    guard a > 0 else {
        return
    }
    let p = parent(i: a)
    siftDown(items: &items, range: p..<items.count, by: by)
    buildHeap(items: &items, range: range.lowerBound..<range.upperBound-1, by: by)
}

/**
Shift down - given an array represeting a heap with the root element out of place, place the root element correctly in the heap
 - param items: the heap array
 - param range: the range in the array the comprises the heap
 - param by: the sort comparator to use
 */
func siftDown<T:Comparable>(items: inout [T], range:CountableRange<Int>, by: SortComparator<T>) {
    let cur = items[range.lowerBound]
    
    // check to see if we have a left child, if so, then proceed. If not, because of heap property, we do not have a right child either
    guard let leftIdx = leftChild(range: range), leftIdx < range.upperBound else {
        return
    }
    
    // find the max of the childern, then
    let idx:Int
    let value:T
    if let rightIdx = rightChild(range: range), by(items[leftIdx],items[rightIdx]) {
        idx = rightIdx
        value = items[rightIdx]
    }
    else{
        idx = leftIdx
        value = items[leftIdx]
    }
    
    if by(cur,value) {
        items.swapAt(range.lowerBound, idx)
        siftDown(items: &items, range: idx..<range.upperBound, by: by)
    }
}

/**
 Heap function to return the left child node
 - param i: the index of the parent element
 - param range: the bounding range of the heap
 - returns the index of the left child, or nil if it falls outside the range
 */
func leftChild(range:CountableRange<Int>) -> Int? {
    let idx = 2 * range.lowerBound + 1
    return idx < range.upperBound ? idx : nil
}

/**
 Heap function to return the right child node
 - param i: the index of the parent element
 - param range: the bounding range
 - returns the index of the right child, or nil if it falls outside the range
 */
func rightChild(range:CountableRange<Int>) -> Int? {
    let idx =  2 * range.lowerBound + 2
    return idx < range.upperBound ? idx : nil
}

/**
 Heap function to return the parent index
 - param i: the index of the child element
 - returns the index of the parent of i in the heap
 */
func parent(i:Int) -> Int {
    return Int(floor(Double(i-1)/Double(2)))
}
