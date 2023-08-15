//
//  Shape.swift
//  swiftGame
//
//  Created by 李东日 on 2023/8/10.
//

import UIKit
//图形类
class LIShape {
    var area: CGFloat { return 0}
}

class LISquareShape: LIShape {
    var sideLength : CGFloat!
    override var area: CGFloat {
        return sideLength * sideLength
    }
}

class LICircleShape: LIShape {
    var diameter: CGFloat!
    override var area: CGFloat {
        return CGFloat.pi * diameter * diameter / 4.0
    }
}

class LITriangleShape: LIShape {
    var sideLength : CGFloat!
    override var area: CGFloat {
        return sideLength * sideLength / 2.0
    }
}
