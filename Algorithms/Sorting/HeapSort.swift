//
//  HeapSort.swift
//  Algorithms
//
//  Created by Sam Vanderhyden on 11/21/17.
//  Copyright © 2017 Sam Vanderhyden. All rights reserved.
//

import Foundation


func heapSort<T:Comparable>(items: inout [T], by: SortComparator<T> = { $0 < $1 }) {
    var range = 0..<items.count
    buildHeap(items: &items, range: range, by:by)
    while range.count > 1 {
        items.swapAt(range.lowerBound, range.upperBound-1)
        range = range.lowerBound..<range.upperBound-1
        siftDown(items: &items, range: range, by: by)
    }
}


func buildHeap<T:Comparable>(items: inout [T], range:CountableRange<Int>, by: SortComparator<T>) {
    
    guard let l = leftChild(range: range) else {
        return
    }
    
    buildHeap(items: &items, range: l..<range.upperBound, by: by)

    let r = rightChild(range: range)
    
    if let r = r {
        buildHeap(items: &items, range: r..<range.upperBound, by: by)
    }
    
    var idx: Int
    var value: T

    if let r = r, items[r] > items[l] {
        idx = r
        value = items[r]
    }
    else {
        idx = l
        value = items[l]
    }
    
    if  value > items[range.lowerBound] {
        items.swapAt(idx, range.lowerBound)
        siftDown(items: &items, range: idx..<range.upperBound, by: by)
    }
}

/**
Shift down - given an array represeting a heap with the root element out of place, place the root element correctly in the heap
 - param items: the heap array
 - param range: the range in the array the comprises the heap
 */
func siftDown<T:Comparable>(items: inout [T], range:CountableRange<Int>, by: SortComparator<T>) {
    let cur = items[range.lowerBound]
    
    // check to see if we have a left child, if so, then proceed. If not, because of heap property, we do not have a right child either
    guard let leftIdx = leftChild(range: range), leftIdx < range.upperBound else {
        return
    }
    
    // find the max of the childern, then
    let maxIdx:Int
    let maxValue:T
    if let rightIdx = rightChild(range: range), items[leftIdx] < items[rightIdx] {
        maxIdx = rightIdx
        maxValue = items[rightIdx]
    }
    else{
        maxIdx = leftIdx
        maxValue = items[leftIdx]
    }
    
    if(maxValue > cur){
        items.swapAt(range.lowerBound, maxIdx)
        siftDown(items: &items, range: maxIdx..<range.upperBound, by: by)
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
