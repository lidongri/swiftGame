//
//  GameViewController.swift
//  swiftGame
//
//  Created by 李东日 on 2023/8/10.
//

import UIKit

class LIGameViewController: UIViewController {
    
    private var shapeViewFactory: LIShapeViewFactory!
    private var shapeFactory: LIShapeFactory!
    private var shapeViewBuilder: LIShapeViewBuilder!
    private var turnController: LITurnController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        view.addSubview(gameView)
        //正方形
        let squareShapeViewFactory = LISquareShapeViewFactory(size: gameView.sizeAvailableForShapes())
        let squareShapeFactory = LISquareShapeFactory(minProportion: 0.3, maxProportion: 0.8)
        let squareShapeViewBuilder = shapeViewBuilderForFactory(shapeViewFactory: squareShapeViewFactory)
        let squareTurnStrategy = LIBasicTurnStrategy(shapeFactory: squareShapeFactory, shapeViewBuilder: squareShapeViewBuilder)
        //圆形
        let circleShapeViewFactory = LICircleShapeViewFactory(size: gameView.sizeAvailableForShapes())
        let circleShapeFactory = LICircleShapeFactory(minProportion: 0.3, maxProportion: 0.8)
        let circleShapeViewBuilder = shapeViewBuilderForFactory(shapeViewFactory: circleShapeViewFactory)
        let circleTurnStrategy = LIBasicTurnStrategy(shapeFactory: circleShapeFactory, shapeViewBuilder: circleShapeViewBuilder)
        //正方形和圆形
        let squareCircleShapeViewFactory = LISquareOrCircleShapeViewFactory(size: gameView.sizeAvailableForShapes())
        let squareCircleShapeFactory = LISquareOrCircleShapeFactory(minProportion: 0.3, maxProportion: 0.8)
        let squareCircleShapeViewBuilder = shapeViewBuilderForFactory(shapeViewFactory: squareCircleShapeViewFactory)
        let squareCircleTurnStrategy = LIBasicTurnStrategy(shapeFactory: squareCircleShapeFactory, shapeViewBuilder: squareCircleShapeViewBuilder)
        //三角形
        let triangleShapeViewFactory = LITriangleShapeViewFactory(size: gameView.sizeAvailableForShapes())
        let triangleShapeFactory = LITriangleShapeFactory(minProportion: 0.3, maxProportion: 0.8)
        let triangleShapeViewBuilder = shapeViewBuilderForFactory(shapeViewFactory: triangleShapeViewFactory)
        let triangleTurnStrategy = LIBasicTurnStrategy(shapeFactory: triangleShapeFactory, shapeViewBuilder: triangleShapeViewBuilder)
        
        let randomTurnStrategy = LIRandomTurnStrategy(strategyArray: [squareTurnStrategy,circleTurnStrategy,squareCircleTurnStrategy,triangleTurnStrategy])

        turnController = LITurnController(turnStrategy: randomTurnStrategy)
        beginNextTurn()

    }
    
    private func shapeViewBuilderForFactory(shapeViewFactory: LIShapeViewFactory) -> LIShapeViewBuilder {
        let shapeViewBuilder = LIShapeViewBuilder(shapeViewFactory: shapeViewFactory)
        shapeViewBuilder.fillColor = UIColor.white
        shapeViewBuilder.outLineColor = UIColor.orange
        return shapeViewBuilder
    }
    
    private func beginNextTurn() {
        let shapeViews = turnController.beginNewTurn()
        
        shapeViews.0.tapHandler = { tappedView in
            let addScore = self.turnController.endTurnWithTappedShape(tappedShape: tappedView.shape)
            self.gameView.score += addScore
            self.beginNextTurn()
            LIPlayAudio.play(score: addScore)
        }
        
        shapeViews.1.tapHandler = shapeViews.0.tapHandler
        
        gameView.addShapeViews(newShapeViews: shapeViews)
        
    }
    
//    private var gameView: GameView {
//        return view as? GameView ?? GameView(frame: view.bounds)
//    }
    private lazy var gameView: LIGameView = {
        var gameView = LIGameView(frame: view.bounds)
        return gameView
    }()
}
