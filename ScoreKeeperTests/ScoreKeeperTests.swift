//
//  ScoreKeeperTests.swift
//  ScoreKeeperTests
//
//  Created by Jesslyn Trixie Edvilie on 12/04/26.
//

import Testing
@testable import ScoreKeeper

struct ScoreKeeperTests {
    @Test("Reset player scores", arguments: [0, 10, 20])
    func resetScores(to newValue: Int) async throws {
        var scoreboard = Scoreboard(players: [
            Player(name: "Elisha", score: 0),
            Player(name: "Andre", score: 5),
        ])
        
        await scoreboard.resetScores(to: newValue)
        
        for player in await scoreboard.players {
            #expect(player.score == newValue)
        }
        
    }
    
    @Test("Highest score wins")
    func highestScoreWins(){
        let scoreboard = Scoreboard(
            players: [Player(name: "Elisha", score: 0),
                      Player(name: "Andre", score: 4)],
            state: .gameOver,
            doesHighestScoreWin: true
        )
        let winners = scoreboard.winners
        #expect(winners == [Player(name: "Andre", score: 4)])
    }
    
    @Test("Lowest score wins")
    func lowestScoreWins(){
        let scoreboard = Scoreboard(
            players: [Player(name: "Elisha", score: 0),
                      Player(name: "Andre", score: 4)],
            state: .gameOver,
            doesHighestScoreWin: false
        )
        let winners = scoreboard.winners
        #expect(winners == [Player(name: "Jesslyn", score: 0)])
    }
    
    @Test("Multiple winners")
    func multipleWinners() {
        let scoreboard = Scoreboard(
            players: [Player(name: "Elisha", score: 4),
                      Player(name: "Andre", score: 4),
                      Player(name: "Jesslyn", score: 1)],
            state: .gameOver,
            doesHighestScoreWin: true
        )
        let winners = scoreboard.winners
        #expect(winners.contains([Player(name: "Elisha", score: 4), Player(name: "Andre", score: 4)]))
    }

}
