//
//  InputManager.swift
//  P3_01_XCode
//
//  Created by Fabrice Mourou on 16/05/2020.
//  Copyright © 2020 Fabrice Mourou. All rights reserved.
//

import Foundation





class InputManager {
    
    
    // MARK: - Internal
    
    // MARK: Methods - Internal
    
    
    
    func startWarriorSelectionLoop(warriors: [Warrior]) -> Warrior {
        var warrior: Warrior?
        
        while warrior == nil {
            do {
                warrior = try askToSelectWarriorFrom(warriors: warriors)
            } catch {
                handle(error: error)
            }
        }
        
        return warrior!
    }
    
    
    func startAskActionToPeformLoop() -> Warrior.Action {
        var action: Warrior.Action?
        
        while action == nil {
            do {
                action = try askActionToPerform()
            } catch {
                handle(error: error)
            }
        }
        
        return action!
    }
    
    
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
    
    
    
    // MARK: - Private
    
    
    
    // MARK: Methods - Private
    
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
    
    private func askActionToPerform() throws -> Warrior.Action {
        
        guard let playerChoice = readLine() else {
            throw InputError.terminalError
        }
        
        guard let indexChoice = Int(playerChoice) else {
            throw InputError.cannotConvertToInteger
        }
        
        guard 1...Warrior.Action.allCases.count ~= indexChoice else {
            throw InputError.indexOutOfBounds
            
        }
        
        return Warrior.Action.allCases[indexChoice - 1]
    }
    
    private func askToSelectWarriorFrom(warriors: [Warrior]) throws -> Warrior {
        
        guard let playerChoice = readLine() else {
            throw InputError.terminalError
        }
        
        guard let indexChoice = Int(playerChoice) else {
            throw InputError.cannotConvertToInteger
        }
        
        
        guard 1...warriors.count ~= indexChoice else {
            throw InputError.indexOutOfBounds
            
        }
        
        let selectedWarrior = warriors[indexChoice - 1]
        
        guard selectedWarrior.isAlive else {
            throw InputError.cannotSelectDeadWarrior
        }
        
        return selectedWarrior
    }
    
    
    
    private func handle(error: Error) {
        if let inputError = error as? InputError {
            print(inputError.errorMessage)
        } else {
            print("Unknown error occured \(error.localizedDescription)")
        }
    }
    
    
}
