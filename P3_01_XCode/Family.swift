//
//  Family.swift
//  P3_01_XCode
//
//  Created by Fabrice Mourou on 23/04/2020.
//  Copyright © 2020 Fabrice Mourou. All rights reserved.
//

import Foundation


class Family{
    let name: String
    let life: Int
    let dammage: Int
    let id: Int
    
    init(name: String, life: Int, dammage: Int, id: Int) {
        self.name = name
        self.life = life
        self.dammage = dammage
        self.id = id
    }
    let families: [Family] = [
        Family(name: "☆Bushi☆", life: 140, dammage:50, id: 1),
        Family(name: "✤Nomin✤", life: 180, dammage:40, id: 2),
        Family(name: "❁Kogyo❁", life: 150, dammage:20, id: 3),
        Family(name: "※Shonin※", life: 80, dammage:30, id: 4)]
    
    func printFamilies (){
           
           print(" Vous avez choisi la famille n°\(id) !",
               "La famille\(name) qui possède \(life) points de vie et \(dammage) points d'attaque")
           
       }
    
}

// Bushi: guerrier classe dominante +++
// Nomin: paysans qui créent la vie ++
// Kogyo: artisans qui transforment la vie +
// Shonin: commerçant qui ne créent rien -
