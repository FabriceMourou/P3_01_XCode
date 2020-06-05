//
//  Weapon.swift
//  P3_01_XCode
//
//  Created by Fabrice Mourou on 14/04/2020.
//  Copyright © 2020 Fabrice Mourou. All rights reserved.
//

class Weapon {
    
    // MARK: - Internal
    
    init(name: String, attackPoints: Int) {
        self.name = name
        self.attackPoints = attackPoints
    }
    
    // MARK: Properties - Internal
    
    var name: String
    var attackPoints: Int
    
    // MARK: Methods - Internal
    
    static var weaponList: [Weapon] = [
        Weapon(name: "Naginata", attackPoints: 20),
        Weapon(name: "Kunaï", attackPoints: 5),
        Weapon(name: "Tachi", attackPoints: 15),
        Weapon(name: "Uchigatana", attackPoints: 10)
    ]
}

