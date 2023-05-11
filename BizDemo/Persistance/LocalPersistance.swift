//
//  LocalPersistance.swift
//  BizDemo
//
//  Created by Bryan A Bolivar M on 11/05/23.
//

import Foundation

protocol PersistanceProvider {
    static func fetch(key: PersistanceKey) -> String?
    static func store(key: PersistanceKey, value: String)
}

struct LocalPersistance: PersistanceProvider {
    static func fetch(key: PersistanceKey) -> String? {
        UserDefaults.standard.string(forKey: key.rawValue)
    }
    
    static func store(key: PersistanceKey, value: String) {
        UserDefaults.standard.setValue(value, forKey: key.rawValue)
    }
}

enum PersistanceKey: String {
    case nit = "NIT"
}
