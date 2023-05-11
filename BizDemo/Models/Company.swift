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
    
    static func generate(from dictionary: [String: Any]) -> Company? {
        guard
            let name = dictionary["name"] as? String,
            let address = dictionary["address"] as? String,
            let city = dictionary["city"] as? String,
            let countryRaw = dictionary["country"] as? String,
            let country = Country(rawValue: countryRaw),
            let nit = dictionary["nit"] as? String,
            let phone = dictionary["phone"] as? String
        else {
            return nil
        }
        return Company(name: name,
                       address: address,
                       city: city,
                       country: country,
                       nit: nit,
                       phone: phone)
    }
}

