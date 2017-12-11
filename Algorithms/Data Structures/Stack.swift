//
//  Stack.swift
//  Algorithms
//
//  Created by Sam Vanderhyden on 12/11/17.
//  Copyright © 2017 Sam Vanderhyden. All rights reserved.
//

import Foundation

/**
 Last in first out list of items
 */
struct Stack<T> {
    private var items = [T]()
    typealias Element = T
    typealias Iterator = Stack<T>
    
    /**
     Push an item onto the stack
     - param item the item to push
    */
    mutating func push(item:T){
        items.insert(item, at: 0)
    }
    
    /**
    Pop an item off the stack
    - returns item, the next item on the stack
    */
    mutating func pop() -> T? {
        return items.count > 0 ? items.removeFirst() : nil
    }
    
    func makeIterator() -> Stack<T>.Iterator {
        return self
    }
    
    mutating func next() -> Stack<T>.Element? {
        return pop()
    }
}
