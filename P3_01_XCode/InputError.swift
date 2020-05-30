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
    case inputIsTooShort
    case inputIsTooLong
    case askNameErrorNameAlreadyUsed
    case indexOutOfBounds
    case cannotConvertToInteger
    
    
    var errorMessage: String {
        switch self {
        case .askNameErrorNameAlreadyUsed: return "Name Already Used"
        case .inputIsTooLong: return "Name is too long"
        case .inputIsTooShort: return "Name is too short"
        case .terminalError: return "Terminal error"
        case .cannotConvertToInteger: return "Cannot convert to integer"
        case .indexOutOfBounds: return "Index out of bounds"
        }
    }
    
}
