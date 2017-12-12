//
//  BinaryTree.swift
//  Algorithms
//
//  Created by Sam Vanderhyden on 12/11/17.
//  Copyright © 2017 Sam Vanderhyden. All rights reserved.
//

import Foundation

/**
 A node for a binary tree
 */
final class BinaryTreeNode<T>: NodeProtocol {
    typealias Element = T
    var value: T
    
    /// Depth of this node - used for demonstration purposes only
    var depth: Int = 0
    
    init(_ value: T) {
        self.value = value
    }

    var children: [BinaryTreeNode<T>] {
        return [left, right].flatMap { $0 }
    }
    
    /// The left child node
    var left: BinaryTreeNode<T>?
    
    /// The right child node
    var right: BinaryTreeNode<T>?
}

/**
 Protocol for binary trees
 */
protocol BinaryTreeProtocol {
    associatedtype Item
    var root: BinaryTreeNode<Item> { get }
    mutating func insert(item: BinaryTreeNode<Item>, element: BinaryTreeNode<Item>?)
}

/**
 Traversal algorithms for binary trees
 */
extension BinaryTreeProtocol {
    
    /**
     Depth First Search traversal, uses a stack
     */
    func dfs(_ by: (BinaryTreeNode<Item>) -> Void) {
        let queue = AnyQueue(LiFoQueue<BinaryTreeNode<Item>>())
        traverse(queue: queue, by: by)
    }
    
    /**
     Breadth First Search traversal, uses a queue
     */
    func bfs(_ by: (BinaryTreeNode<Item>) -> Void) {
        let queue = AnyQueue(FiFoQueue<BinaryTreeNode<Item>>())
        traverse(queue: queue, by: by)
    }
    
    /**
     Traverse the binary tree, visiting all nodes
     */
    private func traverse(queue:AnyQueue<BinaryTreeNode<Item>>, by: (BinaryTreeNode<Item>) -> Void ) {
        queue.push(item: root)
        while let item = queue.pop() {
            if let left = item.left {
                queue.push(item: left)
            }
            if let right = item.right {
                queue.push(item: right)
            }
            by(item)
        }
    }
    
    /**
     Produce a list of items in order from left to right
    */
    func inOrderTraversal(node: BinaryTreeNode<Item>? = nil) -> [Item] {
        let node = node ?? root
        
        var values = [Item]()
        if let l = node.left {
            values += inOrderTraversal(node: l)
        }
        values.append(node.value)
        if let r = node.right {
            values += inOrderTraversal(node: r)
        }
        
        return values
    }
    
}

/**
 A binary search tree data structure
 */
struct BinarySearchTree<T: Comparable>: BinaryTreeProtocol {
    
    typealias Item = T
    
    /// The root element of the tree
    var root: BinaryTreeNode<T>

    /// Insert an item into a binary tree
    mutating func insert(item: BinaryTreeNode<T>, element: BinaryTreeNode<T>? = nil) {
        let node = element ?? root
        
        // keep increasing the depth of the item
        item.depth += 1
        
        if(item.value <= node.value) {
            if let left = node.left {
                insert(item: item, element: left)
            }
            else {
                node.left = item
            }
        }
        else {
            if let right = node.right {
                insert(item: item, element: right)
            } else {
                node.right = item
            }
        }
    }
    
    /**
     Validate that this tree obeys binary search tree properties
    */
    struct NodeAndBounds<T> {
        let node: BinaryTreeNode<T>
        let lowerBound: T?
        let upperBound: T?
    }
    
    func validate() -> Bool {
        var queue = FiFoQueue<NodeAndBounds<T>>()
        queue.push(item: NodeAndBounds(node: root, lowerBound: nil, upperBound: nil))
        while let nodeAndBounds = queue.pop() {
            if let lb = nodeAndBounds.lowerBound, nodeAndBounds.node.value > lb {
                return false
            }
            
            if let rb = nodeAndBounds.upperBound, nodeAndBounds.node.value <= rb {
                return false
            }
            
            if let l = nodeAndBounds.node.left {
                queue.push(item: NodeAndBounds(node: l, lowerBound: nodeAndBounds.node.value, upperBound: nodeAndBounds.upperBound))
            }
            
            if let r = nodeAndBounds.node.right {
                queue.push(item: NodeAndBounds(node: r, lowerBound: nodeAndBounds.lowerBound, upperBound: nodeAndBounds.node.value))
            }
        }
        return true
    }
}
