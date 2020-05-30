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
        
        let weapon = Weapon(name: "Naginata", attackPoints: 20)
        let warrior = Warrior(name: warriorName , maxLifePoints: 100, weapon: weapon, baseAttackPoints: 10)
        
        warriors.append(warrior)
        
    }
    
 
    
    func playTurn(opponentPlayer: Player) {
        describeWarriors()
        
        let actionMakerWarrior = selectWarrior(from: self)
       

        print("Make your choice !:")
        print ("1: ⚔️ Attack ⚔️")
        print ("2: 💊  Heal  💊")
        
        let actionToPerform = nameDefiner.startAskActionToPeformLoop()
        
        switch actionToPerform {
        case .attack: performAction(actionMakerWarrior: actionMakerWarrior, targetPlayer: opponentPlayer, action: .attack)
        case .heal: performAction(actionMakerWarrior: actionMakerWarrior, targetPlayer: self, action: .heal)
        }
    }
    
    private func performAction(actionMakerWarrior: Warrior, targetPlayer: Player, action: Warrior.Action) {
        targetPlayer.describeWarriors()
        let targetWarrior = selectWarrior(from: targetPlayer)
        
        switch action {
        case .attack: actionMakerWarrior.attack(warrior: targetWarrior)
        case .heal:  actionMakerWarrior.heal(warrior: targetWarrior)
        }
        
        targetWarrior.describeHealthPoint(warrior: actionMakerWarrior)
    }
    
    
    
    
    
    
    
    
    func describeWarriors() {
        for (index, warrior) in warriors.enumerated() {
            print(index + 1, terminator: " ")
            warrior.describe()
        }
    }
    
    func selectWarrior(from player: Player) -> Warrior {
        print()
        print("🌿 Please select warrior 1->3 ⚔️ ლ(•́•́ლ):")
        
        
        let selectedWarrior = nameDefiner.startWarriorSelectionLoop(warriors: player.warriors)
        
        print("🌿 You have selected \(selectedWarrior.name) ⚔️ ᕦ(ò_óˇ)ᕤ")
        print()
        
        
        return selectedWarrior
    }
    
    func removeWarrior (){
        
        
    }
    
    // MARK: - Private
    
    // MARK: Properties - Private
    private let nameDefiner = InputManager()
    
    
    // MARK: Methods - Private
}
