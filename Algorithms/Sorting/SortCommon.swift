//
//  SortCommon.swift
//  Algorithms
//
//  Created by Sam Vanderhyden on 11/20/17.
//  Copyright © 2017 Sam Vanderhyden. All rights reserved.
//

import Foundation

/// Type alias for a comparator passed into a sort function
/// Should return true if the first item is less than the second item
typealias SortComparator<T:Comparable> = (T,T) -> Bool
