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
    
    var isInGame: Bool {
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
    
    
    func playTurn(opponentPlayer: Player) {
        describeWarriors()
        
        let actionMakerWarrior = selectWarrior(from: self)
        actionMakerWarrior.handleChestDiscovery()
        
        
        print("Make your choice !:")
        print ("1: ⚔️ Attack ⚔️")
        print ("2: 💊  Heal  💊")
        
        let actionToPerform = inputManager.startAskActionToPeformLoop()
        
        switch actionToPerform {
        case .attack: performAction(actionMakerWarrior: actionMakerWarrior, targetPlayer: opponentPlayer, action: .attack)
        case .heal: performAction(actionMakerWarrior: actionMakerWarrior, targetPlayer: self, action: .heal)
        }
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
        
        
        let selectedWarrior = inputManager.startWarriorSelectionLoop(warriors: player.warriors)
        
        print("🌿 You have selected \(selectedWarrior.name) ⚔️ ᕦ(ò_óˇ)ᕤ")
        print()
        
        
        return selectedWarrior
    }
    
    
    
    // MARK: - Private
    
    // MARK: Properties - Private
    private let inputManager = InputManager()
    
    
    
    
    // MARK: Methods - Private
    
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
        let warriorName = inputManager.startAskNameLoop(id: id, alreadyUsedNames: alreadyUsedWarriorNames)
        
        
        let weapon = Weapon(name: "Tanto", attackPoints: 50)
        let warrior = Warrior(name: warriorName , maxLifePoints: 1, weapon: weapon, baseAttackPoints: 0)
        
        warriors.append(warrior)
        
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
    
    
    
    
}
