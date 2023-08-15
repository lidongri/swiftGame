//
//  ShapeViewFactory.swift
//  swiftGame
//
//  Created by 李东日 on 2023/8/10.
//

import UIKit
//图形view工厂
protocol LIShapeViewFactory {
    var size: CGSize { get set }
    func makeShapeViewForShapes(shapes: (LIShape, LIShape)) -> (LIShapeView, LIShapeView)
}

class LISquareShapeViewFactory: LIShapeViewFactory {
    var size: CGSize
    init(size: CGSize)
    {
        self.size = size
    }
    func makeShapeViewForShapes(shapes: (LIShape, LIShape)) -> (LIShapeView, LIShapeView) {
        let squareShape1 = shapes.0 as! LISquareShape
        let shapeView1 = LISquareShapeView(frame: CGRect(x: 0, y: 0, width: squareShape1.sideLength*size.width, height: squareShape1.sideLength*size.height))
        shapeView1.shape = squareShape1
        
        let squareShape2 = shapes.1 as! LISquareShape
        let shapeView2 = LISquareShapeView(frame: CGRect(x: 0, y: 0, width: squareShape2.sideLength*size.width, height: squareShape2.sideLength*size.height))
        shapeView2.shape = squareShape2
        
        return (shapeView1, shapeView2)
    }
}

class LICircleShapeViewFactory: LIShapeViewFactory {
    var size: CGSize
    init(size: CGSize){
        self.size = size
    }
    
    func makeShapeViewForShapes(shapes: (LIShape, LIShape)) -> (LIShapeView, LIShapeView) {
        let circleShape1 = shapes.0 as! LICircleShape
        let shapeView1 = LICircleShapeView(frame: CGRect(x: 0, y: 0, width: circleShape1.diameter*size.width, height: circleShape1.diameter*size.height))
        shapeView1.shape = circleShape1
        let circleShape2 = shapes.1 as! LICircleShape
        let shapeView2 = LICircleShapeView(frame: CGRect(x: 0, y: 0, width: circleShape2.diameter*size.width, height: circleShape2.diameter*size.height))
        shapeView2.shape = circleShape2
        return (shapeView1, shapeView2)
    }
}
//正方形和原型混合
class LISquareOrCircleShapeViewFactory: LIShapeViewFactory {
    var size: CGSize
    init(size: CGSize){
        self.size = size
    }
    
    func makeShapeViewForShapes(shapes: (LIShape, LIShape)) -> (LIShapeView, LIShapeView) {
        if shapes.0 is LICircleShape {
            //第一个是圆形，第二个是方形
            let circleShape1 = shapes.0 as! LICircleShape
            let shapeView1 = LICircleShapeView(frame: CGRect(x: 0, y: 0, width: circleShape1.diameter*size.width, height: circleShape1.diameter*size.height))
            shapeView1.shape = circleShape1
            let circleShape2 = shapes.1 as! LISquareShape
            let shapeView2 = LISquareShapeView(frame: CGRect(x: 0, y: 0, width: circleShape2.sideLength*size.width, height: circleShape2.sideLength*size.height))
            shapeView2.shape = circleShape2
            return (shapeView1, shapeView2)
        } else {
            //第一个是方形，第二个是圆形
            let circleShape1 = shapes.1 as! LICircleShape
            let shapeView1 = LICircleShapeView(frame: CGRect(x: 0, y: 0, width: circleShape1.diameter*size.width, height: circleShape1.diameter*size.height))
            shapeView1.shape = circleShape1
            let circleShape2 = shapes.0 as! LISquareShape
            let shapeView2 = LISquareShapeView(frame: CGRect(x: 0, y: 0, width: circleShape2.sideLength*size.width, height: circleShape2.sideLength*size.height))
            shapeView2.shape = circleShape2
            return (shapeView2, shapeView1)
        }
    }
}

class LITriangleShapeViewFactory: LIShapeViewFactory {
    var size: CGSize
    init(size: CGSize){
        self.size = size
    }
    
    func makeShapeViewForShapes(shapes: (LIShape, LIShape)) -> (LIShapeView, LIShapeView) {
        let triangleShape1 = shapes.0 as! LITriangleShape
        let shapeView1 = LITriangleShapeView(frame: CGRect(x: 0, y: 0, width: triangleShape1.sideLength*size.width, height: triangleShape1.sideLength*size.height))
        shapeView1.shape = triangleShape1
        let triangleShape2 = shapes.1 as! LITriangleShape
        let shapeView2 = LITriangleShapeView(frame: CGRect(x: 0, y: 0, width: triangleShape2.sideLength*size.width, height: triangleShape2.sideLength*size.height))
        shapeView2.shape = triangleShape2
        return (shapeView1, shapeView2)
    }
}
