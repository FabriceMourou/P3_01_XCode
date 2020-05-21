//
//  Player.swift
//  P3_01_XCode
//
//  Created by Fabrice Mourou on 14/04/2020.
//  Copyright © 2020 Fabrice Mourou. All rights reserved.
//
class Player {
    
    // MARK: - Internal
    
    init(id: Int, name: String) {
        self.id = id
        self.name = name
    }
    
    // MARK: Methods - Internal
    
    let id: Int
    var warriors: [Warrior] = []
    var name: String
    
    
    
    // MARK: Properties - Internal
    
    var isInGame: Bool { id > 0 }
    
    var isStillInGame: Bool {
        for warrior in warriors {
            if warrior.isAlive {
                return true
            }
            
        }
        
        return false
        
    }
    
    
    func createWarriors(allPlayers: [Player]) {
        print("🎌 \(name) Make up your team 🎌")
        print(" 🌿 Create 3 warriors 🌿")
        
        for warriorId in 1...3 {
            let allWarriorNames = getAllWarriorNamesFrom(players: allPlayers)
            
            createWarrior(id: warriorId, alreadyUsedWarriorNames: allWarriorNames)
        }
    }
    
    
    
    private func getAllWarriorNamesFrom(players: [Player]) -> [String] {
        var allNames: [String] = []
        for player in players {
            for warrior in player.warriors {
                allNames.append(warrior.name)
            }
        }
        return allNames
    }
    
    
    private func createWarrior(id: Int, alreadyUsedWarriorNames: [String]) {
        
        print(" 🎌 Enter your warrior's name \(id) 🎯")
        let warriorName = nameDefiner.startAskNameLoop(id: id, alreadyUsedNames: alreadyUsedWarriorNames)
        
        let weapon = Naginata()
        let warrior = Warrior(name: warriorName , maxLifePoints: 100, weapon: weapon, baseAttackPoints: 10)
        
        warriors.append(warrior)
        
    }
    
    func playTurn(opponentPlayer: Player, teammatePlayer: Player) {
        describeWarriors()
        let selectedWarrior = selectWarrior(from: self)
        
        //TODO: decide to attack  or heal
        if let playerChoice = readLine() {
            
            if playerChoice == "1"{
        opponentPlayer.describeWarriors()
        let targetWarrior = selectWarrior(from: opponentPlayer)
        selectedWarrior.attack(warrior: targetWarrior)
                targetWarrior.describeHealthPoint(warrior: selectedWarrior)
            }
            else if playerChoice == "2"{
        teammatePlayer.describeWarriors()
        let targetTeammate = selectWarrior(from: teammatePlayer )
        selectedWarrior.heal(warrior: targetTeammate)
                targetTeammate.describeHealthPoint(warrior: selectedWarrior)
            }
            else {
                
            }
        
        }
        
        
        // if attackk => select second warrior from opoonentplayer
        // if heal => select second warrior from self team
        // performaction (heal or attack)
    }
    
    func describeWarriors() {
        for warrior in warriors {
            warrior.describe()
            
        }
    }
    
    func selectWarrior(from player: Player) -> Warrior {
        
        
        //TODO: Get user choice from readline
        let playerChoice = Int(readLine()!)!
        
        let selectedWarrior = player.warriors[playerChoice]
        
        print("You have selected \(selectedWarrior.name) 🌿")
        print ("1: ⚔️ Choose Attack ⚔️")
        print ("2: 💊 Choose Heal 💊")
        
        
        return selectedWarrior
    }
    func removeWarrior (){
            
    
               }
   
    // MARK: - Private
    
    // MARK: Properties - Private
    private let nameDefiner = NameDefiner()
    
    
    // MARK: Methods - Private
}
