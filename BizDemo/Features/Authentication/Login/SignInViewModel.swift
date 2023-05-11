//
//  SignInViewModel.swift
//  BizDemo
//
//  Created by Bryan A Bolivar M on 9/05/23.
//

import Foundation
import Combine
import SwiftUI

class SignInViewModel: ObservableObject {
    @Published var companyNit: String = ""
    var createCompanyAction: () -> Void
    var signInResponse: (Error?) -> Void
    
    init(signInResponse: @escaping (Error?) -> Void, createCompanyAction: @escaping () -> Void) {
        self.signInResponse = signInResponse
        self.createCompanyAction = createCompanyAction
    }
    
    var companyNitBinding: Binding<String> {
        Binding(
            get: { self.companyNit },
            set: { self.companyNit = $0 }
        )
    }

    func performSignIn() {
        FirebaseAPI.findCompany(nit: companyNit) { company in
            guard let company = company else {
                self.signInResponse(BaseError.base(message: Language.nitNotFound.localized))
                return
            }
            self.signInResponse(nil)
            LocalPersistance.store(key: PersistanceKey.nit, value: self.companyNit)
        }.execute()
    }
}

