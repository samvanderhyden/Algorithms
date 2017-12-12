//
//  Queue.swift
//  Algorithms
//
//  Created by Sam Vanderhyden on 12/11/17.
//  Copyright © 2017 Sam Vanderhyden. All rights reserved.
//

import Foundation

/**
 Abstraction for a queue / stack data structure
 */
protocol Queue {
    associatedtype Item
    
    mutating func push(item: Item)
    mutating func pop() -> Item?
}

/**
 An abstract base class that conforms to Queue. Must be overridden.
 */
private class AnyQueueBase<Content>: Queue {
    typealias Item = Content
    
    func push(item: Item) {
        fatalError()
    }
    
    func pop() -> Item? {
        fatalError()
    }
}

/**
 A generic class that inherits from the abstract base queue class and boxes a queue, forwarding all queue methods to the boxed instance
 */
private class AnyQueueBox<ConcreteQueue: Queue>: AnyQueueBase<ConcreteQueue.Item> {
    var concreteQueue: ConcreteQueue
    
    init(_ concrete: ConcreteQueue){
        self.concreteQueue = concrete
    }
    
    override func push(item: ConcreteQueue.Item) {
        concreteQueue.push(item: item)
    }
    
    override func pop() -> ConcreteQueue.Item? {
        return concreteQueue.pop()
    }
}

/**
  A type erased queue
 */
struct AnyQueue<Content>: Queue {
    private var box: AnyQueueBase<Content>

    init<Concrete: Queue>(_ queue: Concrete) where Concrete.Item == Content {
        box = AnyQueueBox(queue)
    }
    
    func push(item: Content) {
        box.push(item: item)
    }
    
    func pop() -> Content? {
        return box.pop()
    }
}
