//
//  DouglasPeucker.swift
//  Algorithms
//
//  Created by Sam Vanderhyden on 12/1/17.
//  Copyright © 2017 Sam Vanderhyden. All rights reserved.
//

import Foundation

/**
 Douglas Peucker Path simplication algorithm
 */
protocol Point {
    var x: Float { get }
    var y: Float { get }
}

/**
 Struct to hold line equation information
 */
struct LineEquation: Equatable {
    let slope:Float
    let intercept: Float
    
    static func == (eq1: LineEquation, eq2: LineEquation) -> Bool {
        return (eq1.slope == eq2.slope && eq1.intercept == eq2.intercept)
    }
}

/**
 Sample point struct for testing
 */
struct DpPoint: Point {
    let x: Float
    let y: Float
}

/**
 Douglas Peucker path simplification
 */
func douglasPeucker(items: [Point], tolerance: Float) -> [Point] {
    let idxToKeep = douglasPeuckerCore(items: items, tolerance: tolerance, range: 0..<items.count)
    return items.enumerated().filter { i, v in idxToKeep.contains(i) }.map { i,v in v }
}

/**
 Douglas Peucker Core
 Return an array of indicies to keep for a set of items
 */
func douglasPeuckerCore(items: [Point], tolerance: Float, range: CountableRange<Int>) -> [Int] {
    if range.count <= 2 {
        return Array([range.first,range.last].flatMap{$0})
    }
    else if let f = range.first, let l = range.last {
        let first = items[f]
        let last = items[l]
        var maxDist = -Float.greatestFiniteMagnitude
        var maxIdx = 0
        for idx in f+1..<l+1 {
            let pt = items[idx]
            let d = distance(fromLine: (first,last), toPoint: pt)
            if d > maxDist {
                maxDist = d
                maxIdx = idx
            }
        }
        if(maxDist > tolerance) {
            return douglasPeuckerCore(items: items, tolerance: tolerance, range: f..<maxIdx+1) +
                douglasPeuckerCore(items: items, tolerance: tolerance, range: maxIdx..<l+1)
        }
        else {
            return [f,l]
        }
    }
    else {
        return []
    }
}

/**
 Computes the of the line that intescts the supplied line perpendicularly to the supplied point
 */
func distance(fromLine line: (Point,Point), toPoint point: Point) -> Float {
    let eq1 = lineEquation(from: line.0, to: line.1)
    let slope2 = -1/eq1.slope
    let intercept2 = point.y - slope2 * point.x
    let eq2 = LineEquation(slope: slope2, intercept: intercept2)
    
    let xInt = (eq1.intercept - eq2.intercept) / (eq2.slope - eq1.slope)
    let yInt = eq1.slope * xInt + eq1.intercept
    let intersection = DpPoint(x: xInt, y: yInt)
    
    return distance(from: intersection, to: point)
}

/**
 Return the slope and intercept for line connecting two points
 */
func lineEquation(from: Point, to: Point) -> LineEquation {
    let xDiff = from.x - to.x
    let yDiff = from.y - to.y
    let slope = yDiff / xDiff
    let yIntercept = from.y - (slope * from.x)
    return LineEquation(slope: slope, intercept: yIntercept)
}

/**
 Return the distance from one point to another on a straight line
 */
func distance(from: Point, to: Point) -> Float {
    let xDiff = to.x - from.x
    let yDiff = to.y - from.y
    return sqrt(pow(xDiff, 2) + pow(yDiff, 2))
}
