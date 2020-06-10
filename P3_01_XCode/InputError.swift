//
//  InputError.swift
//  P3_01_XCode
//
//  Created by Fabrice Mourou on 16/05/2020.
//  Copyright © 2020 Fabrice Mourou. All rights reserved.
//

import Foundation


enum InputError: Error {
    case terminalError
    case askNameErrorNameAlreadyUsed
    case askNameErrorNameIsEmptyOrWhiteSpaces
    case indexOutOfBounds
    case cannotConvertToInteger
    case cannotSelectDeadWarrior
    
    // MARK: - Internal
    
    // MARK: Properties - Internal
    
    var errorMessage: String {
        switch self {
        case .askNameErrorNameIsEmptyOrWhiteSpaces: return "🔎 Name is invalid "
        case .askNameErrorNameAlreadyUsed: return "Name Already Used 🗄"
        case .terminalError: return "Terminal error 💻"
        case .cannotConvertToInteger: return "Cannot convert to integer 🔢"
        case .indexOutOfBounds: return "Index out of bounds 🛠"
        case .cannotSelectDeadWarrior: return "⛔️ Cannot select dead warrior 💀"
        }
    }
    
}
