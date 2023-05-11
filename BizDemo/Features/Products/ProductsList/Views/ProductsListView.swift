//
//  ProductsListView.swift
//  BizDemo
//
//  Created by Bryan A Bolivar M on 10/05/23.
//

import SwiftUI

struct ProductsListView: View {
    
    var products: [Product]
    
    var newProductAction: () -> Void
    
    var body: some View {
        ZStack {
            List {
                ForEach(products) { product in
                    ProductCardView(product: product)
                        .padding()
                        .listRowInsets(EdgeInsets())
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    
                }
                .listRowSeparator(.hidden)
            }
            .listStyle(.plain)
            
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Button {
                        self.newProductAction()
                    } label: {
                        Circle()
                            .foregroundColor(.blue)
                            .frame(width: 40, height: 40)
                            .overlay(
                                Image(systemName: "plus")
                                    .foregroundColor(.white)
                            )
                    }
                }
            }
            .padding()
        }
        
        
    }
}
