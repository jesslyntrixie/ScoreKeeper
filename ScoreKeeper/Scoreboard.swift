import Foundation

struct Scoreboard {
    var players: [Player] = []
    
    var winners: [Player] {
        guard state == .gameOver else { return [] }
        
        var winningScore = 0
        if doesHighestScoreWin {
            winningScore = Int.min
            for player in players {
                winningScore = max(player.score, winningScore)
            }
        } else {
            winningScore = Int.max
            for player in players {
                winningScore = min(player.score, winningScore)
            }
        }
        return players.filter {
            player in player.score == winningScore
        }
        
    }
    
    var state = GameState.setup
    
    var doesHighestScoreWin = true
    
    mutating func resetScores(to newValue: Int){
        for index in 0..<players.count {
            players[index].score = newValue
        }
    }
}



// kyknya kalau cuma ambil buat display or g ngubah, pakai foreach, tpi kalau udh mau ngubah value lebih baik pakai manual indexing.
