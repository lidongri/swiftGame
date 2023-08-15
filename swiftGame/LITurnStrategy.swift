//
//  LITurnStrategy.swift
//  swiftGame
//
//  Created by 李东日 on 2023/8/10.
//

import UIKit

protocol LITurnStrategy {
    func makeShapeViewForNextTurnGivenPastTurns(pastTurns: [LITurn]) -> (LIShapeView, LIShapeView)
}

class LIBasicTurnStrategy: LITurnStrategy {
    let shapeFactory: LIShapeFactory
    let shapeViewBuilder: LIShapeViewBuilder
    
    init(shapeFactory: LIShapeFactory,shapeViewBuilder: LIShapeViewBuilder) {
        self.shapeFactory = shapeFactory
        self.shapeViewBuilder = shapeViewBuilder
    }
    
    func makeShapeViewForNextTurnGivenPastTurns(pastTurns: [LITurn]) -> (LIShapeView, LIShapeView) {
        return shapeViewBuilder.buildShapeViewsForShapes(shapes: shapeFactory.createShapes())
    }
}

class LIRandomTurnStrategy: LITurnStrategy {
    
    let strategyArray : [LITurnStrategy]
    
    init(strategyArray: [LITurnStrategy]) {
        self.strategyArray = strategyArray
    }
    
    func makeShapeViewForNextTurnGivenPastTurns(pastTurns: [LITurn]) -> (LIShapeView, LIShapeView) {
        var g = SystemRandomNumberGenerator()
        let random = CGFloat.random(in: 0.0...100.0, using: &g)//取0-100的随机数
        let interval = 100.0/CGFloat(self.strategyArray.count)//根据策略数组计算策略的概率
        let index = random/interval//计算策略的下标
        let strategy : LITurnStrategy = self.strategyArray[Int(index)]//获取策略
        return strategy.makeShapeViewForNextTurnGivenPastTurns(pastTurns: pastTurns)
    }
}
//这是在一个协议中定义的一个抽象方法，该方法获取游戏中上一个回合的数组，并返回形状视图来显示下一回合。
//
//
//实现一个使用 LIShapeFactory 和 LIShapeViewBuilder 的基本策略，此策略实现了现有行为，其中形状视图与以前一样来自单个工厂和建造者。请注意你在此处再次使用 依赖注入，这意味着此策略不关心它使用的是哪一个工厂或建造者。
//
//
//随机使用其他两种策略之一来实施随机策略。你在这里使用了组合，因此 LIRandomTurnStrategy 可以表现得像两个可能不同的策略。但是由于它是一个 策略，所以任何使用 LIRandomTurnStrategy 的代码都隐藏了该组合。
//
//
//这是随机策略的核心。它以 50％ 的概率随机选择第一种或第二种策略。
