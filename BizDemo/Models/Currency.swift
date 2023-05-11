//
//  Currency.swift
//  BizDemo
//
//  Created by Bryan A Bolivar M on 9/05/23.
//

import Foundation

enum Currency: String {
    case usd = "USD"
    case cop = "COP"
    case eur = "EUR"
    case gbp = "GBP"
    
    func getSymbol() -> String {
        switch self {
        case .usd, .cop:
            return "$"
        case .eur:
            return "€"
        case .gbp:
            return "£"
        }
    }
    
    func getCurrencyName() -> String {
        switch self {
        case .usd:
            return "Dolar"
        case .cop:
            return "Peso Colombiano"
        case .eur:
            return "Euro"
        case .gbp:
            return "Libra"
        }
    }
    
    func conversionrate() -> Double {
        switch self {
        case .usd:
            return 1
        case .cop:
            return 0.00027
        case .eur:
            return 1.21
        case .gbp:
            return 1.41
        }
    }
}
