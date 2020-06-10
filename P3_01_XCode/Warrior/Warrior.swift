//
//  Warrior.swift
//  P3_01_XCode
//
//  Created by Fabrice Mourou on 14/04/2020.
//  Copyright © 2020 Fabrice Mourou. All rights reserved.
//



class Warrior {
    
    // MARK: - Internal
    
    init(name: String, maxLifePoints: Int, weapon: Weapon, baseAttackPoints: Int, baseMagicPoints: Int) {
        self.name = name
        self.maxLifePoints = maxLifePoints
        self.weapon = weapon
        self.baseAttackPoints = baseAttackPoints
        self.baseMagicPoints = baseMagicPoints
        
        currentLifePoints = maxLifePoints
    }
    
    // MARK: Properties - Internal
    
    var isAlive: Bool { currentLifePoints > 0 }
    
    
    
    // MARK: Methods - Internal
    
    enum Action: CaseIterable {
        case attack, heal
    }
    
    
    func attack(warrior: Warrior) {
        print()
        print(" 🎌 \(name) attack ⚔️ \(warrior.name) with \(weapon.name) 🗡")
        warrior.takeDamage(amount: attackPoints)
    }
    
    func heal(warrior: Warrior) {
        print()
        print("🎌 \(name) heals 🌡 \(warrior.name)")
        warrior.takeHeal(amount: magicPoints)
    }
    
    func takeDamage(amount: Int) {
        currentLifePoints -= amount
    }
    
    func takeHeal(amount: Int) {
        currentLifePoints += amount
    }
    
    func describe() {
        print(" 🌿  ٩(๏_๏)۶ \(name) -> \(currentLifePoints)/\(maxLifePoints) Life Points // 🥊 AP: \(attackPoints) 🥊 // ⚔️ Weapon Name: \(weapon.name) ⚔️ // MP: \(magicPoints) ٩(๏_๏)۶ 🌿")
        
    }
    
    func handleChestDiscovery() {
        let randomNumber = Int.random(in: 1...2)
        let isChestFound = randomNumber == 1
        
        if isChestFound {
            print("⚡︎⚡︎ \(name) found a chest 🎁 ⚡︎⚡︎")
            print("Current 🗡 weapon has \(weapon.attackPoints) attack point")
            guard let newWeapon = Weapon.weaponList.randomElement() else { return }
            weapon = newWeapon
            print(" ★★ New weapon ⚔️ has \(weapon.attackPoints) attack point ★★")
            print()
            
        }
    }
    
    func describeHealthPoint(warrior: Warrior) {
        
        guard isAlive else {
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
    var currentLifePoints: Int {
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
    private var baseMagicPoints: Int
    
    private var attackPoints: Int {
        return baseAttackPoints + weapon.attackPoints
    }
    private var magicPoints: Int {
          return baseMagicPoints + weapon.attackPoints
      }
    
    private var isOverHealed: Bool { currentLifePoints > maxLifePoints }
    
    
    
}



