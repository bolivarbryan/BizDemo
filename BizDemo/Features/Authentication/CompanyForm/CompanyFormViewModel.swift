//
//  CompanyFormViewModel.swift
//  BizDemo
//
//  Created by Bryan A Bolivar M on 9/05/23.
//

import SwiftUI
import Combine

class CompanyFormViewModel: ObservableObject {
    @Published var companyName: String = "code"
    @Published var companyAddress: String = "Calle 123 # 54-67"
    @Published var companyPhone: String = "3002771564"
    @Published var companyCity: String = "Barranquilla"
    @Published var companyNit: String = "123456"
    @Published private var selectedCountry: Country = .colombia
    var createCompanyAction: (Company) -> Void
    
    init(createCompanyAction: @escaping (Company) -> Void) {
        self.createCompanyAction = createCompanyAction
    }

    var companyNameBinding: Binding<String> {
        Binding(
            get: { self.companyName },
            set: { self.companyName = $0 }
        )
    }

    var companyAddressBinding: Binding<String> {
        Binding(
            get: { self.companyAddress },
            set: { self.companyAddress = $0 }
        )
    }

    var companyPhoneBinding: Binding<String> {
        Binding(
            get: { self.companyPhone },
            set: { self.companyPhone = $0 }
        )
    }

    var companyCityBinding: Binding<String> {
        Binding(
            get: { self.companyCity },
            set: { self.companyCity = $0 }
        )
    }

    var companyNitBinding: Binding<String> {
        Binding(
            get: { self.companyNit },
            set: { self.companyNit = $0 }
        )
    }
    
    var companyCountryBinding: Binding<Country> {
        Binding(
            get: { self.selectedCountry },
            set: { self.selectedCountry = $0 }
        )
    }
    
    func save() {
        let company = Company(name: companyName,
                              address: companyAddress,
                              city: companyCity,
                              country: selectedCountry,
                              nit: companyNit,
                              phone: companyPhone)
        self.createCompanyAction(company)
    }
}
