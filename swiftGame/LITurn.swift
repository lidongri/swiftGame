//
//  LITurn.swift
//  swiftGame
//
//  Created by 李东日 on 2023/8/10.
//

import UIKit

class LITurn {
    let shapes: [LIShape]//存储玩家每一回合看到的形状
    var matched: Bool?//是否点击了较大的形状
    init(shapes: [LIShape]) {
        self.shapes = shapes
    }
    
    func turnCompleteWithTappedShape(tappedShape: LIShape) {
        let maxArea = shapes.reduce(0) {$0 > $1.area ? $0 : $1.area}
        matched = tappedShape.area >= maxArea
    }
}

//存储玩家每一回合看到的形状，以及是否点击了较大的形状。
//在玩家点击形状后记录该回合已经结束。
