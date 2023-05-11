//
//  SignInFormView.swift
//  BizDemo
//
//  Created by Bryan A Bolivar M on 9/05/23.
//

import SwiftUI

struct SignInFormView: View {
    let viewModel: SignInViewModel!
    
    var body: some View {
        ScrollView
        {
            VStack {
                Spacer()
                    .frame(height: 50)
                TextField(Language.nit.localized, text: viewModel.companyNitBinding)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)
                
                Button(action: {
                    viewModel.performSignIn()
                }) {
                    HStack {
                        Spacer()
                        Text(Language.signIn.localized)
                            .font(.headline)
                        Spacer()
                    }
                }
                //.disabled(viewModel.companyNit.isEmpty)
                .padding()
                .foregroundColor(.white)
                //.background(viewModel.companyNit.isEmpty ? Color.gray : Color.blue)
                .background(Color.blue)
                .cornerRadius(8)
                .padding(.horizontal)
                
                Button {
                    viewModel?.createCompanyAction()
                } label: {
                    Text(Language.createACompany.localized)
                        .font(.subheadline)
                        .padding(.top)
                }
                
            }
        }
    }
}
