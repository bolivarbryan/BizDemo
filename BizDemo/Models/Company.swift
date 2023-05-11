//
//  Company.swift
//  BizDemo
//
//  Created by Bryan A Bolivar M on 9/05/23.
//

import Foundation

struct Company {
    let name: String
    let address: String
    let city: String
    let country: Country
    let nit: String
    let phone: String
    
    var dictionaryRepresentation: [String: String] {
        return [
            "name": name,
            "address": address,
            "city": city,
            "country": country.rawValue,
            "nit": nit,
            "phone": phone
        ]
    }
}

