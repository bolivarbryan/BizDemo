//
//  NewProductFormView.swift
//  BizDemo
//
//  Created by Bryan A Bolivar M on 11/05/23.
//

import SwiftUI

struct NewProductFormView: View {
    @State private var name: String = ""
    @State private var about: String = ""
    @State private var price: Double?
    
    var saveProductAction: (Product) -> Void
    
    var body: some View {
        ScrollView
        {
            VStack {
                Spacer()
                    .frame(height: 50)
                TextField(Language.name.localized, text: $name)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)
                TextField(Language.about.localized, text: $about)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)
                TextField(Language.price.localized, value: $price, formatter: NumberFormatter())
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)
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
                .padding()
                .foregroundColor(.white)
                .background(Color.blue)
                .cornerRadius(8)
                .padding(.horizontal)
            }   
        }
    }
    
    func save() {
        guard let nit = LocalPersistance.fetch(key: .nit) else {
            return
        }
        
        FirebaseAPI.findCompany(nit: nit) { company in
            guard let company = company else {
                return
            }
            
            let newProduct = Product(name: name, about: about, price: price ?? 0, company: company)
            saveProductAction(newProduct)
            
        }
        .execute()
    }
}

