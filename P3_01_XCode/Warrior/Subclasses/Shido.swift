//
//  Shido.swift
//  P3_01_XCode
//
//  Created by Fabrice Mourou on 18/04/2020.
//  Copyright © 2020 Fabrice Mourou. All rights reserved.
//

import Foundation


class Shido : Warrior {
    init() {
        super.init(name: "Shido", maxLifePoints: 100, weapon: Kunai.init(), baseAttackPoints: 10)
    }
}
