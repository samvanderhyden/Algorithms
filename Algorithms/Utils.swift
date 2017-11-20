//
//  Utils.swift
//  Algorithms
//
//  Created by Sam Vanderhyden on 9/4/17.
//  Copyright © 2017 Sam Vanderhyden. All rights reserved.
//

import Foundation

/**
 Return a random int in range [start,end]
 */
func randomInt(lower:UInt32,upper:UInt32) -> Int {
    return Int(arc4random_uniform(upper - lower + 1)) + Int(lower)
}

/**
 Random integer list of size
 - param size, the size of the list
 - param lower, the lower bound
 - param upper, the upper bound
 - return a list of size populated with random ints in range [lower,upper]
 */
func randomIntList(size:Int,lower:UInt32,upper:UInt32) -> [Int]{
    var list = [Int]()
    for _ in 0..<size {
        list.append(randomInt(lower: lower, upper: upper))
    }
    return list
}



