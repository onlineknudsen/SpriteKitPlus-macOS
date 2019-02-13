//
//  CGVector+Math.swift
//  SpriteKitPlus
//
//  Created by Lin Knudsen on 2/11/19.
//  Copyright © 2019 Lin Knudsen. All rights reserved.
//

import CoreGraphics

extension CGVector {
    public var magnitude: CGFloat {
        return sqrt(dx * dx + dy * dy)
    }
    
    //MARK: - Operations
    
    public var normalized: CGVector {
        let mag = magnitude
        return CGVector(dx: dx / mag, dy: dy / mag)
    }
    
    public mutating func normalize() {
        let mag = magnitude
        dx /= mag
        dy /= mag
    }
    
    public static func distance(from v1: CGVector, to v2: CGVector) -> CGFloat {
        return (v1 - v2).magnitude
    }
    
    public static func dot(_ v1: CGVector, _ v2: CGVector) -> CGFloat {
        return v1.dx * v2.dx + v1.dy * v2.dy
    }
    
    public static func + (lhs: CGVector, rhs: CGVector) -> CGVector {
        return CGVector(dx: lhs.dx + rhs.dx, dy: lhs.dy + rhs.dy)
    }
    
    public static func - (lhs: CGVector, rhs: CGVector) -> CGVector {
        return CGVector(dx: lhs.dx - rhs.dx, dy: lhs.dy - rhs.dy)
    }
    
    public static func += (lhs: inout CGVector, rhs: CGVector) {
        lhs.dx += rhs.dx
        lhs.dy += rhs.dy
    }
    
    public static func -= (lhs: inout CGVector, rhs: CGVector) {
        lhs.dx -= rhs.dx
        lhs.dy -= rhs.dy
    }
    
    public static func * (lhs: CGVector, rhs: CGFloat) -> CGVector {
        return CGVector(dx: lhs.dx * rhs, dy: lhs.dy * rhs)
    }

    public static func * (lhs: CGVector, rhs: Double) -> CGVector {
        return lhs * CGFloat(rhs)
    }
    
    public static func * (lhs: CGVector, rhs: Int) -> CGVector {
        return lhs * CGFloat(rhs)
    }
    
    public static func * (lhs: CGVector, rhs: Float) -> CGVector {
        return lhs * CGFloat(rhs)
    }
    
    public static func * (lhs: CGFloat, rhs: CGVector) -> CGVector {
        return CGVector(dx: rhs.dx * lhs, dy: rhs.dy * lhs)
    }
    
    public static func * (lhs: Double, rhs: CGVector) -> CGVector {
        return CGFloat(lhs) * rhs
    }
    
    public static func * (lhs: Int, rhs: CGVector) -> CGVector {
        return CGFloat(lhs) * rhs
    }
    
    public static func * (lhs: Float, rhs: CGVector) -> CGVector {
        return CGFloat(lhs) * rhs
    }
    
    public static func *= (lhs: inout CGVector, rhs: CGFloat) {
        lhs.dx *= rhs
        lhs.dy *= rhs
    }
    
    public static func *= (lhs: inout CGVector, rhs: Double) {
        lhs.dx *= CGFloat(rhs)
        lhs.dy *= CGFloat(rhs)
    }
    
    public static func *= (lhs: inout CGVector, rhs: Int) {
        lhs.dx *= CGFloat(rhs)
        lhs.dy *= CGFloat(rhs)
    }
    
    public static func *= (lhs: inout CGVector, rhs: Float) {
        lhs.dx *= CGFloat(rhs)
        lhs.dy *= CGFloat(rhs)
    }
}
