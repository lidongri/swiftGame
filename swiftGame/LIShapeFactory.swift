//
//  ShapeFactory.swift
//  swiftGame
//
//  Created by 李东日 on 2023/8/10.
//

import UIKit
//图形类工厂
protocol LIShapeFactory {
    func createShapes() -> (LIShape, LIShape)
}

class LISquareShapeFactory: LIShapeFactory {
    var minProportion: CGFloat
    var maxProportion:CGFloat
    init(minProportion: CGFloat, maxProportion: CGFloat) {
        self.minProportion = minProportion
        self.maxProportion = maxProportion
    }
    func createShapes() -> (LIShape, LIShape) {
        var g = SystemRandomNumberGenerator()
        let shape1 = LISquareShape()
        shape1.sideLength = CGFloat.random(in: self.minProportion...self.maxProportion, using: &g)
        let shape2 = LISquareShape()
        shape2.sideLength = CGFloat.random(in: self.minProportion...self.maxProportion, using: &g)
        return (shape1, shape2)
    }
}

class LICircleShapeFactory: LIShapeFactory {
    var minProportion: CGFloat
    var maxProportion:CGFloat
    init(minProportion: CGFloat, maxProportion: CGFloat) {
        self.minProportion = minProportion
        self.maxProportion = maxProportion
    }
    func createShapes() -> (LIShape, LIShape) {
        var g = SystemRandomNumberGenerator()
        let shape1 = LICircleShape()
        shape1.diameter = CGFloat.random(in: self.minProportion...self.maxProportion, using: &g)
        let shape2 = LICircleShape()
        shape2.diameter = CGFloat.random(in: self.minProportion...self.maxProportion, using: &g)
        return (shape1, shape2)
    }
}

class LISquareOrCircleShapeFactory: LIShapeFactory {
    var minProportion: CGFloat
    var maxProportion:CGFloat
    init(minProportion: CGFloat, maxProportion: CGFloat) {
        self.minProportion = minProportion
        self.maxProportion = maxProportion
    }
    func createShapes() -> (LIShape, LIShape) {
        var g = SystemRandomNumberGenerator()
        let shape1 = LICircleShape()
        shape1.diameter = CGFloat.random(in: self.minProportion...self.maxProportion, using: &g)
        let shape2 = LISquareShape()
        shape2.sideLength = CGFloat.random(in: self.minProportion...self.maxProportion, using: &g)
        if CGFloat.random(in: 0.0...100.0, using: &g) < 50.0 {
            return (shape1, shape2)
        } else {
            return (shape2, shape1)
        }
    }
}

//三角形
class LITriangleShapeFactory: LIShapeFactory {
    var minProportion: CGFloat
    var maxProportion:CGFloat
    init(minProportion: CGFloat, maxProportion: CGFloat) {
        self.minProportion = minProportion
        self.maxProportion = maxProportion
    }
    func createShapes() -> (LIShape, LIShape) {
        var g = SystemRandomNumberGenerator()
        let shape1 = LITriangleShape()
        shape1.sideLength = CGFloat.random(in: self.minProportion...self.maxProportion, using: &g)
        let shape2 = LITriangleShape()
        shape2.sideLength = CGFloat.random(in: self.minProportion...self.maxProportion, using: &g)
        return (shape1, shape2)
    }
}
