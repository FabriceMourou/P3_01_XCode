//
//  Asako.swift
//  P3_01_XCode
//
//  Created by Fabrice Mourou on 18/04/2020.
//  Copyright © 2020 Fabrice Mourou. All rights reserved.
//

import Foundation

class Asako : Warrior {
    init() {
        super.init(name: "Asako", maxLifePoints: 100, weapon: Naginata.init(), baseAttackPoints: 10)
    }
}
