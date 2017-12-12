//
//  Queue.swift
//  Algorithms
//
//  Created by Sam Vanderhyden on 12/11/17.
//  Copyright © 2017 Sam Vanderhyden. All rights reserved.
//

import Foundation

/**
 First in first out list of items
 */
struct FiFoQueue<T>: Queue, Sequence, IteratorProtocol {
    private var items = [T]()
    typealias Element = T
    typealias Iterator = FiFoQueue<T>
    typealias Item = T
    
    /**
    Push an item onto the queue
     - param item the item to push
    */
    mutating func push(item:T){
        items.append(item)
    }
    
    /**
    Get the next item out of the queue
    - returns the next item or nil
    */
    mutating func pop() -> T? {
        return items.count > 0 ? items.removeFirst() : nil
    }
    
    func makeIterator() -> FiFoQueue<T>.Iterator {
        return self
    }
    
    mutating func next() -> FiFoQueue<T>.Element? {
        return pop()
    }
}
