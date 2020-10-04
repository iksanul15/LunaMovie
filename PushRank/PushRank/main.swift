//
//  main.swift
//  PushRank
//
//  Created by Muhammad Iksanul on 04/10/20.
//

import Foundation

var gameScores = [200, 150, 150, 90]
var newScores = [70, 90, 210, 90, 110, 220]

func getLatesScore(ranked: [Int], players: [Int]) {
    var ranking = Set(ranked)
    for player in players {
        ranking.insert(player)
        print(ranking.sorted {
            $0 > $1
        }.firstIndex(of: player)! + 1)
    }
}

getLatesScore(ranked: gameScores, players: newScores)

