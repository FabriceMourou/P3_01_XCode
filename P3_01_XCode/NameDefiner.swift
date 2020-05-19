//
//  InputManager.swift
//  P3_01_XCode
//
//  Created by Fabrice Mourou on 16/05/2020.
//  Copyright © 2020 Fabrice Mourou. All rights reserved.
//

import Foundation

class NameDefiner {
    
    
    func startAskNameLoop(id: Int, alreadyUsedNames: [String]) -> String {
        
        var name: String?
        
        while name == nil {
            do {

                name = try askToDefineName(allNames: alreadyUsedNames)
            } catch {
                handle(error: error)
            }
        }
        
        return name!
    }

    private func askToDefineName(allNames: [String]) throws -> String {
        
        
        guard let name = readLine() else {
            throw InputError.terminalError
        }
        
        
        for nameInUse in allNames {
            if name.lowercased() == nameInUse.lowercased() {
                throw InputError.askNameErrorNameAlreadyUsed
            }
        }

        
        return name
        
    }
    
  

    private func handle(error: Error) {
         if let inputError = error as? InputError {
             print(inputError.errorMessage)
         } else {
             print("Unknown error occured \(error.localizedDescription)")
         }
     }
    
    
}
