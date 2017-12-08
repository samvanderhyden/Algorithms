//
//  DouglasPeuckerTestCase.swift
//  AlgorithmsTests
//
//  Created by Sam Vanderhyden on 12/8/17.
//  Copyright © 2017 Sam Vanderhyden. All rights reserved.
//

import XCTest
@testable import Algorithms

class DouglasPeuckerTestCase: XCTestCase {
    
    // test a straight line where all points are on it
    func testDpStraightNoVariance() {
        let pts = [DpPoint(x: -1, y:-1),
                   DpPoint(x: 0, y: 0),
                   DpPoint(x: 1, y: 1),
                   DpPoint(x: 2, y: 2)]
        
        let simplified = douglasPeucker(items: pts, tolerance: 1)
        XCTAssert(simplified.count == 2, "All points were removed except endpoints")
    }
    
    // test a line with no tolerance
    func testDpNoTolerance() {
        let pts = [DpPoint(x: -1, y:-1),
                   DpPoint(x: 0, y: 0),
                   DpPoint(x: 1, y: 1),
                   DpPoint(x: 2, y: 2)]
        
        let simplified = douglasPeucker(items: pts, tolerance: -1)
        XCTAssert(simplified.count == pts.count, "All points are still there")
    }
    
    // test the DP algorithm on a simple path
    func testDp() {
        let pts = [DpPoint(x: -1, y:-1),
                   DpPoint(x: 0, y: 0),
                   DpPoint(x: 1, y: 0),
                   DpPoint(x: 1, y: 1),
                   DpPoint(x: 2, y: 2)]
        
        let simplified = douglasPeucker(items: pts, tolerance: 0.5)
        XCTAssert(simplified.count == 3, "All points were removed except endpoints")
    }

    // test distance from line to point calculation
    func testDistanceFromLineToPoint() {
        let pt1 = DpPoint(x: 1, y: 1)
        let pt2 = DpPoint(x: 0, y: 0)
        let pt3 = DpPoint(x: 1, y: 0)
        let d = distance(fromLine: (pt1, pt2), toPoint: pt3)
        XCTAssert(d == sqrt(2)/2, "Distance is sqrt(2)/2")
    }
    
    // test the line equation calculation with two simple points
    func testLineEquation0to1() {
        let pt1 = DpPoint(x: 1, y: 1)
        let pt2 = DpPoint(x: 0, y: 0)
        let eq = lineEquation(from: pt1, to: pt2)
        XCTAssert(eq.slope == 1, "Slope is 1")
        XCTAssert(eq.intercept == 0, "Intercept is 0")
        let eq2 = lineEquation(from: pt2, to: pt1)
        XCTAssert(eq == eq2, "Equations are equal for same points")
    }
    
    // test line equation with a negative sloped line
    func testLineEquationNegative() {
        let pt1 = DpPoint(x: 1, y: 1)
        let pt2 = DpPoint(x: 2, y: 0)
        let eq = lineEquation(from: pt1, to: pt2)
        XCTAssert(eq.slope == -1, "Slope is -1")
        XCTAssert(eq.intercept == 2, "Intercept is 2")
    }
    
    // test distance from point to point on x axis
    func testDistanceXAxis() {
        let pt1 = DpPoint(x: 1, y: 0)
        let pt2 = DpPoint(x: 0, y: 0)
        let d = distance(from: pt1, to: pt2)
        XCTAssert(d == 1, "Distance is 1")
    }
    
    // test distance from point to point on y axis
    func testDistanceYAxis() {
        let pt1 = DpPoint(x: 0, y: 1)
        let pt2 = DpPoint(x: 0, y: 0)
        let d = distance(from: pt1, to: pt2)
        XCTAssert(d == 1, "Distance is 1")
    }
    
    // test distance from point to point with arbitrary points
    func testDistance() {
        let pt1 = DpPoint(x: 1, y: 2)
        let pt2 = DpPoint(x: 0, y: 0)
        let d = distance(from: pt1, to: pt2)
        XCTAssert(d == sqrt(5), "Distance is sqrt(5)")
    }
}

