//
//  BinaryTreeTestCase.swift
//  AlgorithmsTests
//
//  Created by Sam Vanderhyden on 12/11/17.
//  Copyright © 2017 Sam Vanderhyden. All rights reserved.
//

import XCTest
@testable import Algorithms

class BinarySearchTreeTestCase: XCTestCase {

    func testInsertMany() {
        let max: UInt32 = 1000
        let first = randomInt(lower: 0, upper: max)
        var bt = BinarySearchTree(root: BinaryTreeNode(first))
        randomIntList(size: 1000, lower: 0, upper: max)
            .map { BinaryTreeNode($0) }
            .forEach {
                bt.insert(item: $0)
            }
        
        XCTAssert(bt.validate(),"Tree is valid after inserts")
    }
    
    func testInsertLeftRight() {
        let rt = BinaryTreeNode(1)
        var bt = BinarySearchTree(root: rt)
        bt.insert(item: BinaryTreeNode(2))
        bt.insert(item: BinaryTreeNode(0))
        XCTAssert(bt.root.right?.value == 2, "value inserted correctly")
        XCTAssert(bt.root.left?.value == 0, "value inserted correctly")
    }
    
    func testInsertEqual() {
        let rt = BinaryTreeNode(1)
        var bt = BinarySearchTree(root: rt)
        bt.insert(item: BinaryTreeNode(1))
        XCTAssert(bt.root.left?.value == 1, "value inserted correctly")
    }
    
    func testBfs() {
        var maxDepth = 0
        var count = 0
        var bt = BinarySearchTree(root: BinaryTreeNode(0))
        
        var items = randomIntList(size: 999, lower: 0, upper: 19999)
        items.map { BinaryTreeNode($0) }
            .forEach {
                bt.insert(item: $0)
            }
        // add the first item to the list, so we can remove one at a time and validate that they are all there
        items.append(bt.root.value)
        bt.bfs { node in
            count += 1
            XCTAssert(node.depth >= maxDepth, "node is at least as deep as we've seen before")
            maxDepth = max(node.depth,maxDepth)
            if let idx = items.index(of: node.value) {
                items.remove(at: idx)
            }
            else {
                XCTFail("Cannot find node value in remaining items")
            }
        }
        
        XCTAssert(count == 1000, "We saw all nodes")
        XCTAssert(items.count == 0, "All items were found")
    }
    
    func testDfs() {
        var count = 0
        var bt = BinarySearchTree(root: BinaryTreeNode(0))
        
        var items = randomIntList(size: 999, lower: 0, upper: 19999)
        items.map { BinaryTreeNode($0) }
            .forEach {
                bt.insert(item: $0)
        }
        // add the first item to the list, so we can remove one at a time and validate that they are all there
        items.append(bt.root.value)
        bt.dfs { node in
            count += 1
            if let idx = items.index(of: node.value) {
                items.remove(at: idx)
            }
            else {
                XCTFail("Cannot find node value in remaining items")
            }
        }
        
        XCTAssert(count == 1000, "We saw all nodes")
        XCTAssert(items.count == 0, "All items were found")
    }

    
    func testValid() {
        let n1 = BinaryTreeNode(2)
        n1.left = BinaryTreeNode(1)
        let t = BinarySearchTree(root: n1)
        XCTAssert(t.validate(),"Tree is invalid")
    }
    
    func testInvalidDepth1() {
        let n1 = BinaryTreeNode(2)
        n1.right = BinaryTreeNode(1)
        let t = BinarySearchTree(root: n1)
        XCTAssert(!t.validate(),"Tree is invalid")
    }

    func testInvalidDepth2() {
        let n1 = BinaryTreeNode(2)
        n1.right = BinaryTreeNode(3)
        n1.right?.left = BinaryTreeNode(1)
        let t = BinarySearchTree(root: n1)
        XCTAssert(!t.validate(),"Tree is invalid")
    }
    
    func testInOrderTraversal() {
        let max: UInt32 = 1000
        let first = randomInt(lower: 0, upper: max)
        var bt = BinarySearchTree(root: BinaryTreeNode(first))
        randomIntList(size: 1000, lower: 0, upper: max)
            .map { BinaryTreeNode($0) }
            .forEach {
                bt.insert(item: $0)
        }
        
        let items = bt.inOrderTraversal()
        verifySort(items: items)
    }
}
