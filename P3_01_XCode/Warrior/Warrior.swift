//
//  Warrior.swift
//  P3_01_XCode
//
//  Created by Fabrice Mourou on 14/04/2020.
//  Copyright © 2020 Fabrice Mourou. All rights reserved.
//

class Warrior {
    
    // MARK: - Internal
    
    init(name: String, maxLifePoints: Int, weapon: Weapon, baseAttackPoints: Int) {
        self.name = name
        self.maxLifePoints = maxLifePoints
        self.weapon = weapon
        self.baseAttackPoints = baseAttackPoints
        
        currentLifePoints = maxLifePoints
    }
    
    // MARK: Properties - Internal
    
    var isAlive: Bool { currentLifePoints > 0 }
    
    // MARK: Methods - Internal
    
    /// Function used
    func attack(warrior: Warrior) {
        print()
        print(" 🎌 \(name) attack ⚔️ \(warrior.name) with \(weapon.name) 🗡")
        warrior.takeDamage(amount: attackPoints)
    }
    
    func heal(warrior: Warrior) {
        print()
        print("🎌 \(name) heals 🌡 \(warrior.name)")
        warrior.takeHeal(amount: attackPoints)
        
    }
    /// Function used to reduce hp according to damage amount
    func takeDamage(amount: Int) {
        currentLifePoints -= amount
    }
    
    func takeHeal(amount: Int) {
        currentLifePoints += amount
    }
    
    func describe() {
        print(" 🌿  ٩(๏_๏)۶ warrior \(name) -> \(currentLifePoints)/\(maxLifePoints) ٩(๏_๏)۶")
        
    }
    
    func describeHealthPoint(warrior: Warrior) {
        
        guard isAlive == true else{
            print()
            print("☠️ \(name) is dead ☠️ !")
            print("🚫 You can no longer fight with \(name) 🚫")
            print()
            
         
            return
        }
        print("🩸\(name) has now \(currentLifePoints) HP 🩸 ")
        print()
        
    }
    
    
    
    
    // MARK: - Private
    
    // MARK: Properties - Private
    
    var name = ""
    private var currentLifePoints: Int {
        didSet {
            if !isAlive {
                currentLifePoints = 0
            }
            
            if isOverHealed {
                currentLifePoints = maxLifePoints
            }
        }
    }
    
    private let maxLifePoints: Int
    private var weapon: Weapon
    private var baseAttackPoints: Int
    private var attackPoints: Int {
        return baseAttackPoints + weapon.attackPoints
    }
    
    private var isOverHealed: Bool { currentLifePoints > maxLifePoints }
    
    // MARK: Methods - Private
    
    
    
    
    
}



