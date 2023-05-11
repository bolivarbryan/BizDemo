//
//  BaseError.swift
//  BizDemo
//
//  Created by Bryan A Bolivar M on 9/05/23.
//

import Foundation

enum BaseError: Error {
    case base(message: String)
    
    var localizedDescription: String {
        switch self {
        case .base(let message):
            return message
        }
    }
}

