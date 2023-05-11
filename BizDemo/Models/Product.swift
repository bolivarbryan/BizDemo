//
//  Product.swift
//  BizDemo
//
//  Created by Bryan A Bolivar M on 9/05/23.
//

import Foundation

struct Product: Identifiable {
    var id = UUID()
    let name: String
    let about: String
    let price: Double
    let company: Company
    let currency: Currency = .usd
    
    init(name: String, about: String, price: Double, company: Company) {
        self.name = name
        self.about = about
        self.price = price
        self.company = company
    }
    
    static func generate(from dictionary: [String: Any]) -> Product? {
        guard
            let name = dictionary["name"] as? String,
            let about = dictionary["about"] as? String,
            let companyObject = dictionary["company"] as? [String: Any],
            let company = Company.generate(from: companyObject),
            let price = dictionary["price"] as? Double
        else {
            return nil
        }
        return Product(name: name, about: about, price: price, company: company)
    }
    
    var dictionaryRepresentation: [String: Any] {
        return ["name": name,
                "about": about,
                "company": company.dictionaryRepresentation,
                "price": price
        ]
    }
}
