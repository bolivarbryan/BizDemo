//
//  Language.swift
//  BizDemo
//
//  Created by Bryan A Bolivar M on 9/05/23.
//

import UIKit
import Foundation
import SwiftUI

enum Language: String {
    case name = "Name"
    case address = "Address"
    case city = "City"
    case selectCountry = "Select a country:"
    case phone = "Phone"
    case phoneValidation = "Please enter a valid phone number"
    case save = "Save"
    case saved = "Saved!"
    case signIn = "Sign in"
    case createACompany = "Want to create a company?"
    case nit = "Nit"
    case nitNotFound = "Nit not found, please check if you typed it correctly"
    case error = "Error"
    case welcome = "Welcome"
}

extension Language {
    var localized: String {
        return self.rawValue
    }
}
