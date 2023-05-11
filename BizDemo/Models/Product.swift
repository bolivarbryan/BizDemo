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
    //let about: String
    //let price: Double
    //let company: Company
    //let currency: Currency = .usd
    
    init(name: String) {
        self.name = name
    }
    
    static func generate(from dictionary: [String: Any]) -> Product? {
        guard
            let name = dictionary["name"] as? String
        else {
            return nil
        }
        return Product(name: name)
    }
}
