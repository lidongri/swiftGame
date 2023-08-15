//
//  LIScorer.swift
//  swiftGame
//
//  Created by 李东日 on 2023/8/10.
//

import UIKit

protocol LIScorer {
    var nextScorer: LIScorer? { get set }
    func computeScoreIncrement<S>(_ pastTurnsReversed: S) -> Int where S : Sequence, LITurn == S.Iterator.Element
}

class LIMatchScorer: LIScorer {
    var nextScorer: LIScorer? = nil
    func computeScoreIncrement<S>(_ pastTurnsReversed: S) -> Int where S : Sequence, S.Element == LITurn {
        var scoreIncrement: Int?
        for turn in pastTurnsReversed {
            if scoreIncrement == nil {
                scoreIncrement = turn.matched! ? 1 : -1
                break
            }
        }
        return (scoreIncrement ?? 0) + (nextScorer?.computeScoreIncrement(pastTurnsReversed) ?? 0)
    }
}

class LIStreakScorer: LIScorer {
    var nextScorer: LIScorer? = nil

    func computeScoreIncrement<S>(_ pastTurnsReversed: S) -> Int where S : Sequence, S.Element == LITurn {
        // 1
        var streakLength = 0
        for turn in pastTurnsReversed {
            if turn.matched! {
                // 2
                streakLength += 1
            } else {
                // 3
                break
            }
        }

        // 4
        let streakBonus = streakLength >= 5 ? 10 : 0
        return streakBonus + (nextScorer?.computeScoreIncrement(pastTurnsReversed) ?? 0)
    }
}
//连续获胜的次数。
//
//如果该回合获胜，则连续次数加一。
//
//如果该回合输了，则连续获胜次数清零。
//
//计算连胜奖励，连胜 5 场或更多场奖励 10 分！
