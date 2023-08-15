//
//  LIShapeViewBuilder.swift
//  swiftGame
//
//  Created by 李东日 on 2023/8/10.
//

import UIKit
//图形view的建造者
class LIShapeViewBuilder {
    var showFill: Bool = true
    var fillColor: UIColor = UIColor.orange
    private var shapeViewFactory: LIShapeViewFactory!
    
    var showOutLine = true
    var outLineColor = UIColor.gray
    
    init(shapeViewFactory: LIShapeViewFactory) {
        self.shapeViewFactory = shapeViewFactory
    }
    
    func buildShapeViewsForShapes(shapes:(LIShape, LIShape)) -> (LIShapeView, LIShapeView) {
        let shapeViews = shapeViewFactory.makeShapeViewForShapes(shapes: shapes)
        configureShapeView(shapeView: shapeViews.0)
        configureShapeView(shapeView: shapeViews.1)
        return shapeViews
    }
    
    private func configureShapeView(shapeView: LIShapeView) {
        shapeView.showFill = showFill
        shapeView.fillColor = fillColor
        shapeView.showOutLine = showOutLine
        shapeView.outLineColor = outLineColor
    }
    
}
