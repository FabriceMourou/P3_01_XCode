//
//  Namiko.swift
//  P3_01_XCode
//
//  Created by Fabrice Mourou on 18/04/2020.
//  Copyright © 2020 Fabrice Mourou. All rights reserved.
//

import Foundation


class Namiko : Warrior {
    init() {
        super.init(name: "Namiko", maxLifePoints: 100, weapon: Tachi.init(), baseAttackPoints: 10)
    }
}
