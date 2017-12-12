//
//  Node.swift
//  Algorithms
//
//  Created by Sam Vanderhyden on 12/11/17.
//  Copyright © 2017 Sam Vanderhyden. All rights reserved.
//

import Foundation

protocol NodeProtocol {
    associatedtype Element
    /// value that the node holds
    var value: Element { get }
    
    /// reference to all children in the node
    var children: [Self] { get }
}


