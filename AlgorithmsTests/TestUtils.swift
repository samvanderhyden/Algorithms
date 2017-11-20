//
//  TestUtils.swift
//  Algorithms
//
//  Created by Sam Vanderhyden on 9/4/17.
//  Copyright © 2017 Sam Vanderhyden. All rights reserved.
//

import Foundation
import XCTest
@testable import Algorithms

/**
 Verifies that an array is in ascending order
 
 - param items an array of comparable items
 - param by a SortComparator to use in verifying
 */
func verifySort<T:Comparable>(items:[T], by:SortComparator<T> = { $0 < $1 }) {
    for idx in 1..<items.count {
        let prev = items[idx-1]
        let value = items[idx]
        XCTAssert(by(prev,value) || value == prev, "Index=\(idx), value=\(value) passes comparator with previous=\(prev)")
    }
}
