//
//  ShapeView.swift
//  swiftGame
//
//  Created by 李东日 on 2023/8/10.
//

import UIKit
//图形view
class LIShapeView: UIView {
    var shape : LIShape!
    
    var showFill: Bool = true {
        didSet {
            setNeedsDisplay()
        }
    }
    
    var fillColor: UIColor = UIColor.orange {
        didSet {
            setNeedsDisplay()
        }
    }
    
    var showOutLine: Bool = true {
        didSet {
            setNeedsDisplay()
        }
    }
    
    var outLineColor: UIColor = UIColor.gray {
        didSet {
            setNeedsDisplay()
        }
    }
    
    var tapHandler: ((LIShapeView) -> ())?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        addGestureRecognizer(tapRecognizer)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func handleTap() {
        tapHandler?(self)
    }
    
    let halfLineWidth: CGFloat = 3.0
    
}

class LISquareShapeView: LIShapeView {
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        if showFill {
            fillColor.setFill()
            let fillPath = UIBezierPath(rect: bounds)
            fillPath.fill()
        }
        
        if showOutLine {
            outLineColor.setStroke()
            let outLinePath = UIBezierPath(rect: CGRect(x: halfLineWidth, y: halfLineWidth, width: bounds.size.width-2*halfLineWidth, height: bounds.size.height-2*halfLineWidth))
            outLinePath.lineWidth = 2.0*halfLineWidth
            outLinePath.stroke()
        }
    }
}

class LICircleShapeView: LIShapeView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.isOpaque = false
        self.contentMode = UIView.ContentMode.redraw
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        if showFill {
            fillColor.setFill()
            let fillPath = UIBezierPath(ovalIn: self.bounds)
            fillPath.fill()
        }
        if showOutLine {
            outLineColor.setStroke()
            let outLinePath = UIBezierPath(ovalIn: CGRect(x: halfLineWidth, y: halfLineWidth, width: bounds.width-2*halfLineWidth, height: bounds.height-2*halfLineWidth))
            outLinePath.lineWidth = 2.0*halfLineWidth
            outLinePath.stroke()
        }
    }
}

class LITriangleShapeView: LIShapeView {
    
    var trianglePath : UIBezierPath {
        let triangleBezierPath = UIBezierPath()
        triangleBezierPath.move(to: CGPoint(x: self.bounds.width/2.0, y: 0))
        triangleBezierPath.addLine(to: CGPoint(x: 0, y: self.bounds.height))
        triangleBezierPath.addLine(to: CGPoint(x: self.bounds.width, y: self.bounds.height))
        triangleBezierPath.close()
        return triangleBezierPath
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.isOpaque = false
        self.contentMode = UIView.ContentMode.redraw
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        if showFill {
            fillColor.setFill()
            let fillPath = trianglePath
            fillPath.fill()
        }
        
        if showOutLine {
            outLineColor.setStroke()
            let outLinePath = trianglePath
            outLinePath.lineWidth = 2.0*halfLineWidth
            outLinePath.stroke()
        }
    }
}

