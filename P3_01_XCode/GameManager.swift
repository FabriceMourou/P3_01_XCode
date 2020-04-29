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
        chooseWarriors()
        
    }
    
    
    
    // MARK: - Private
    
    // MARK: Properties - Private
    
    private var players: [Player]
    private var turnNumbers: Int
    private let numberOfPlayer: Int
    
    private var playerNames: [String] {
        var names: [String] = []
        for player in players {
            if let playerName = player.name {
                names.append(playerName)
            }
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
            let player = Player(id: playerId)
            player.askToDefineName()
            players.append(player)
        }
    }
    
    private func startTeamCreationPhase() {
        for player in players {
            player.createWarriors(allPlayers: players)
        }
    }
    
    
    private func printStartFightPhaseBeginInstructions() {
        print("ლ(•́•́ლ) ", separator: "", terminator: "")
        for name in playerNames {
            print(name, separator: "", terminator: " ")
        }
        print("Choose your warriors !! ლ(•́•́ლ)")
    }
    
    private var isGameOver: Bool {
        //TODO: adjust value to reflect when the game is over (only one player alive)
        for player in players {
            if player.isInGame {
                return false
            }
        }
        
        return true
    }
    
    private func startFightPhase() {
        
        printStartFightPhaseBeginInstructions()
        
        while !isGameOver {
            for player in players {
                // opponent should be handled differently if there multiple player (more than 2)
                // Test
                let opponent = getOpponentFrom(player: player)
                player.playTurn(opponentPlayer: opponent)
                
                if isGameOver {
                    break
                }
            }
        }
        
        
        
//        if let userChoice = readLine() {
//            switch userChoice {
//            case "1":
//                print(playerNames[0], " ʕ •`ᴥ•´ʔ choose your warrior ")
//            //         startFightPhase(against: getOpponentFrom)
//            case "2":
//                print(playerNames[1], " ʕʘ̅͜ʘ̅ʔ choose your warrior ")
//            //         playturn(against: getOpponentFrom)
//            default:
//                print("I do not understand")
//
//            }
//        }
        
        
    }
    
    private func handleEndGame(){
        
    }
    
    private func getOpponentFrom(player: Player) -> Player {
        for playerInList in players {
            if player.id != playerInList.id {
                return playerInList
            }
        }
        
        
        
        //TODO: Adjust get opponent (id is different)
//
//        let opponentChoice = readLine()
//        if opponentChoice == nil {
//            print("I did not understand your choice")}
//        else {
//            print(" ᕦ(ò_óˇ)ᕤ the battle will begin ᕦ(ò_óˇ)ᕤ ")
//            for name in playerNames {
//                print("\(name) FIGHT !!")
//            }
//
//        }
        return players[1]
    }
    
    
    func chooseWarriors (){
        for warrior in players {
            warrior.describeWarriors ()
        }
        
        
        
    }
    
    
    
    
}
