//
//  Kabuto.swift
//  P3_01_XCode
//
//  Created by Fabrice Mourou on 18/04/2020.
//  Copyright © 2020 Fabrice Mourou. All rights reserved.
//

import Foundation


class Kabuto : Warrior {
    init() {
        super.init(name: "Kabuto", maxLifePoints: 100, weapon: Uchigatana.init(), baseAttackPoints: 10)
    }
}
