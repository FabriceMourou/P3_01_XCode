//
//  main.swift
//  P3_01_XCode
//
//  Created by Fabrice Mourou on 14/04/2020.
//  Copyright © 2020 Fabrice Mourou. All rights reserved.
//
class GameManager {
    
    // MARK: - Internal
    
    // MARK: Methods - Internal
    
    init(numberOfPlayer: Int) {
        self.numberOfPlayer = numberOfPlayer
        players = []
        turnNumbers = 0
    }
    
    func startNewGame() {
        printWelcomeInstructions()
        createPlayers()
        startTeamCreationPhase()
        startFightPhase()
        handleEndGame()
    }
    
    
    
    // MARK: - Private
    
    
    
    // MARK: Properties - Private
    
    private let nameDefiner = InputManager()
    private var numberOfTurns = 0
    private var players: [Player]
    private var turnNumbers: Int
    private let numberOfPlayer: Int
    
    private var playerNames: [String] {
        var names: [String] = []
        for player in players {
            names.append(player.name)
        }
        return names
    }
    
    
    // MARK: Methods - Private
    
    
    
    private func printWelcomeInstructions() {
        print("🟠       Welcome in this wonderful game         🟠")
        print("🟠   (ง’̀-‘́)ง 🔴-🔶-🔴-🔶-🔴-🔶-🔴-🔶 (ง’̀-‘́)ง   🟠")
    }
    
    
    
    private func createPlayers() {
        for playerId in 1...numberOfPlayer {
            print(" 🔆 player \(playerId) please input your name: 🔆")
            let playerName = nameDefiner.startAskNameLoop(id: playerId, alreadyUsedNames: playerNames)
            let player = Player(id: playerId, name: playerName)
            
            players.append(player)
        }
    }
    
    
    private func startTeamCreationPhase() {
        for player in players {
            player.createWarriors(allPlayers: players)
        }
    }
    
    
    private func printStartFightPhaseBeginInstructions() {
        print()
        print("⚔️ ლ(•́•́ლ) ", separator: "", terminator: "")
        for name in playerNames {
            print(name, separator: "", terminator: " ! ")
        }
        print("Choose your warriors !! ლ(•́•́ლ) ⚔️")
       
        print("⚔️ ᕦ(ò_óˇ)ᕤ the battle will begin ᕦ(ò_óˇ)ᕤ ⚔️")
        print()
        
    }
    
    private var isGameOver: Bool {
        for player in players {
            if !player.isInGame {
                return true
            }
        }
        
        return false
    }
    
    private func startFightPhase() {
        
        printStartFightPhaseBeginInstructions()
        
        while !isGameOver {
            
            for player in players {
               numberOfTurns += 1
                let opponent = getOpponentFrom(player: player)
               
                player.playTurn(opponentPlayer: opponent)
                if isGameOver {
                    break
                   
                }
                
            }
        }
    }
    
    private func handleEndGame(){
        print("🏁❌ End Of Game ❌🏁")
        describeAllPlayerWarriors()
        print("Number of turns: \(numberOfTurns)")
        
        if let winner = getWinnerFrom(players: players) {
            print("The winner is \(winner.name)")
        }
        
    }
    
    private func getWinnerFrom(players: [Player]) -> Player? {
        for player in players where player.isInGame {
            return player
        }
        
        return nil
    }
    
    private func getOpponentFrom(player: Player) -> Player {
        for playerInList in players {
            if player.id != playerInList.id {
                return playerInList
            }
        }
        
        return players[1]
    }
    
    
    private func describeAllPlayerWarriors() {
        for player in players {
            print("\(player.name)'s Team")
            player.describeWarriors()
            print()
        }
    }
    
}
