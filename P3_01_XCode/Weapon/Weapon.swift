//
//  Weapon.swift
//  P3_01_XCode
//
//  Created by Fabrice Mourou on 14/04/2020.
//  Copyright © 2020 Fabrice Mourou. All rights reserved.
//

class Weapon {
    
    // MARK: - Internal
    
    init(name: String, attackPoints: Int, magicPoints: Int) {
        self.name = name
        self.attackPoints = attackPoints
        self.magicPoints = magicPoints
    }
    
    // MARK: Properties - Internal
    
    var name: String
    var attackPoints: Int
    var magicPoints: Int
    
    // MARK: Methods - Internal
    
    static var weaponList: [Weapon] = [
        Weapon(name: "Naginata", attackPoints: 20, magicPoints: 10),
        Weapon(name: "Kunaï", attackPoints: 5, magicPoints: 20),
        Weapon(name: "Tachi", attackPoints: 15, magicPoints: 5),
        Weapon(name: "Uchigatana", attackPoints: 10, magicPoints: 10)
    ]
}

