//
//  Country.swift
//  BizDemo
//
//  Created by Bryan A Bolivar M on 9/05/23.
//

import Foundation

enum Country: String, Hashable, CaseIterable {
    case usa
    case colombia
    case unitedKingdom
    case germany
    
    var phoneCode: String {
        switch self {
        case .usa:
            return "+1"
        case .colombia:
            return "+57"
        case .unitedKingdom:
            return "+44"
        case .germany:
            return "+49"
        }
    }
    
    var name: String {
        switch self {
        case .usa:
            return "United States"
        case .colombia:
            return "Colombia"
        case .unitedKingdom:
            return "United Kingdom"
        case .germany:
            return "Germany"
        }
    }
    
    var currency: Currency {
        switch self {
        case .usa:
            return .usd
        case .colombia:
            return .cop
        case .germany:
            return .eur
        case .unitedKingdom:
            return .gbp
        }
    }
}
