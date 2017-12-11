//
//  Node.swift
//  Algorithms
//
//  Created by Sam Vanderhyden on 12/11/17.
//  Copyright © 2017 Sam Vanderhyden. All rights reserved.
//

import Foundation

struct Node<T> {
    let data:T
    let children:[Node<T>]
}
