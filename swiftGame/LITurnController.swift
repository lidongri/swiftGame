//
//  LITurnController.swift
//  swiftGame
//
//  Created by 李东日 on 2023/8/10.
//

import UIKit

class LITurnController {
    var currentTurn: LITurn?
    var pastTurns: [LITurn] = [LITurn]()
    private let turnStrategy: LITurnStrategy
    private var scorer: LIScorer
    
    init(turnStrategy: LITurnStrategy){
        self.turnStrategy = turnStrategy
        self.scorer = LIMatchScorer()
        self.scorer.nextScorer = LIStreakScorer()
    }
    
    func beginNewTurn() -> (LIShapeView, LIShapeView) {
        let shapeViews = turnStrategy.makeShapeViewForNextTurnGivenPastTurns(pastTurns: pastTurns)
        currentTurn = LITurn(shapes: [shapeViews.0.shape,shapeViews.1.shape])
        return shapeViews
    }
    
    func endTurnWithTappedShape(tappedShape:LIShape) -> Int {
        currentTurn!.turnCompleteWithTappedShape(tappedShape: tappedShape)
        pastTurns.append(currentTurn!)
        let scoreInCrement = scorer.computeScoreIncrement(pastTurns.reversed())
        return scoreInCrement
    }
    
}
//存储当前和过去的回合。
//
//接收一个 LIShapeFactory 和一个 LIShapeViewBuilder。
//
//使用此工厂和建造者为每个新的回合创建形状和视图，并记录当前回合。
//
//在玩家点击形状后记录回合结束，并根据该回合玩家点击的形状计算得分。
//接收传递的策略并将其存储在 LITurnController 实例中。
//
//使用策略生成 LIShapeView 对象，以便玩家可以开始新的回合。
