//
//  Hanabi.swift
//  P3_01_XCode
//
//  Created by Fabrice Mourou on 18/04/2020.
//  Copyright © 2020 Fabrice Mourou. All rights reserved.
//

import Foundation


class Hanabi : Warrior {
    init() {
        super.init(name: "Hanabi", maxLifePoints: 100, weapon: Wakizushi.init(), baseAttackPoints: 10)
    }
}
