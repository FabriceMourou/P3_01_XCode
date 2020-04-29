//
//  Player.swift
//  P3_01_XCode
//
//  Created by Fabrice Mourou on 14/04/2020.
//  Copyright © 2020 Fabrice Mourou. All rights reserved.
//
class Player {
    
    // MARK: - Internal
    
    init(id: Int) {
        self.id = id
    }
    
    // MARK: Methods - Internal
    
    let id: Int
    var warriors: [Warrior] = []
    var name: String?
    
    
    
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
        guard let name = name else { return }
        
        print("\(name) Make up your team")
        print("Create 3 warriors")
        //        print("Each of your warriors should have a name and a family")
        
        for _ in 1...3 {
            createWarrior()
        }
    }
    
    func askToDefineName() {
        
        var name: String?
        
        repeat {
            print("player \(id) please input your name:")
            
            if let nameInput = readLine() {
                name = nameInput
            } else {
                print("An error occured while trying to get your name")
                print()
            }
        } while name == nil
        
        self.name = name
    }
    
    func askWarriorName() -> String {
        
        
        var warriorName: String?
        
        repeat {
            print("Enter your warrior's name \(warriors.count + 1)")
            if let warriorNameInput = readLine() {
                warriorName = warriorNameInput
            }
        } while warriorName == nil
        
        
        return warriorName!
        
        
        
    }
    func createWarrior() {
        
        //chooseFamily()
        let warriorName = askWarriorName()
        
        let weapon = Weapon(name: "sword", attackPoints: 30)
        let warrior = Warrior(name: warriorName , maxLifePoints: 100, weapon: weapon, baseAttackPoints: 10)
        
        warriors.append(warrior)
        
        
        
        
        
    }
    
    func playTurn(opponentPlayer: Player) {
        describeWarriorsTest()
        let selectedWarrior = selectWarrior(from: self)
        
        
        //TODO: decide to attack  or heal
        
        opponentPlayer.describeWarriorsTest()
        let targetWarrior = selectWarrior(from: opponentPlayer)
        
        
        
        selectedWarrior.attack(warrior: targetWarrior)
        
        targetWarrior.describeHealthPoint()
        
        
        // if attackk => select second warrior from opoonentplayer
        // if jheal => select second warrior from self team
        // performaction (heal or attack)
    }
    
    func describeWarriorsTest() {
        for warrior in warriors {
            warrior.describe()
        }
    }
    
    func selectWarrior(from player: Player) -> Warrior {
        //TODO: Get user choice from readline
        let playerChoice = Int(readLine()!)!
        
        let selectedWarrior = player.warriors[playerChoice]
        print("You have selected \(selectedWarrior.name)")
        return selectedWarrior
    }
    
    func describeWarriors(){
        print(" ٩(๏_๏)۶ \(name!) see your warriors ! ٩(๏_๏)۶")
        _ = createWarriors
        for _ in warriors{
            print("\(warriors.count) ready to fight ლ(｀ー´ლ) !!")
        }
        
        
        
    }
    
    
    // MARK: - Private
    
    // MARK: Properties - Private
    
    
    
    // MARK: Methods - Private
}
