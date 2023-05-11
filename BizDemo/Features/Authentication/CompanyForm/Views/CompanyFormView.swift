//
//  CompanyFormView.swift
//  BizDemo
//
//  Created by Bryan A Bolivar M on 9/05/23.
//

import SwiftUI

struct CompanyFormView: View {
    
    @ObservedObject var viewModel: CompanyFormViewModel
    @State private var isPhoneValid: Bool = true
    
    var body: some View {
        ScrollView
        {
            VStack {
                Spacer()
                    .frame(height: 50)
                TextField(Language.name.localized, text: viewModel.companyNameBinding)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)
                
                TextField(Language.address.localized, text: viewModel.companyAddressBinding)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)
                
                TextField(Language.city.localized, text: viewModel.companyCityBinding)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)
                
                TextField(Language.nit.localized, text: viewModel.companyNitBinding)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)
                
                HStack {
                    Text(Language.selectCountry.localized)
                        .padding(.leading)
                    Spacer()
                    Picker(Language.selectCountry.localized, selection: viewModel.companyCountryBinding) {
                        ForEach(Country.allCases, id: \.self) { country in
                            Text(country.name).tag(country)
                        }
                    }
                    .pickerStyle(.menu)
                    .padding(.horizontal)
                }
                
                TextField(Language.phone.localized, text: viewModel.companyPhoneBinding, onEditingChanged: { isEditing in
                                if !isEditing {
                                    validatePhone()
                                }
                            })
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding(.horizontal)
                            if !isPhoneValid {
                                Text(Language.phoneValidation.localized)
                                    .foregroundColor(.red)
                            }
                
                Button(action: {
                               save()
                           }) {
                               HStack {
                                   Spacer()
                                   Text(Language.save.localized)
                                       .font(.headline)
                                   Spacer()
                               }
                           }
                           .disabled(!isPhoneValid)
                           .padding()
                           .foregroundColor(.white)
                           .background(Color.blue)
                           .cornerRadius(8)
                           .padding(.horizontal)
            }
        }
    }
    
    private func validatePhone() {
        let phoneRegex = #"^\d{7,14}$"#
        isPhoneValid = NSPredicate(format: "SELF MATCHES %@", phoneRegex).evaluate(with: viewModel.companyPhone)
    }
    
    private func save() {
        viewModel.save()
    }
}
