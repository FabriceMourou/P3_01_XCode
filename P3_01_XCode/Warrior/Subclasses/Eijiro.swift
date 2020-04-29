//
//  Eijiro.swift
//  P3_01_XCode
//
//  Created by Fabrice Mourou on 18/04/2020.
//  Copyright © 2020 Fabrice Mourou. All rights reserved.
//

import Foundation

class Eijiro : Warrior {
    init() {
        super.init(name: "Eijiro", maxLifePoints: 100, weapon: Tanto.init(), baseAttackPoints: 10)
    }
}
