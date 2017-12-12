//
//  Stack.swift
//  Algorithms
//
//  Created by Sam Vanderhyden on 12/11/17.
//  Copyright © 2017 Sam Vanderhyden. All rights reserved.
//

import Foundation

/**
 Last in first out (stack) list of items
 */
struct LiFoQueue<T>: Queue, Sequence, IteratorProtocol {
    private var items = [T]()
    typealias Element = T
    typealias Iterator = LiFoQueue<T>
    
    /**
     Push an item onto the stack
     - param item the item to push
    */
    mutating func push(item: T){
        items.insert(item, at: 0)
    }
    
    /**
    Pop an item off the stack
    - returns item, the next item on the stack
    */
    mutating func pop() -> T? {
        return items.count > 0 ? items.removeFirst() : nil
    }
    
    func makeIterator() -> LiFoQueue<T>.Iterator {
        return self
    }
    
    mutating func next() -> LiFoQueue<T>.Element? {
        return pop()
    }
}
