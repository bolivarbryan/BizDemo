//
//  ProductCard.swift
//  BizDemo
//
//  Created by Bryan A Bolivar M on 11/05/23.
//

import SwiftUI

struct ProductCardView: View {
    let product: Product
    
    var body: some View {
        HStack(spacing: 16) {
            Image(systemName: "photo")
                .resizable()
                .scaledToFit()
                .frame(width: 40, height: 40)
            
            VStack(alignment: .leading, spacing: 8) {
                Text(product.name)
                    .font(.headline)
                    .foregroundColor(.primary)
                
                Text("by " + product.company.name)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                
                Text(product.about)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                
                Text("$\(product.price, specifier: "%.2f")")
                    .font(.subheadline)
                    .foregroundColor(.green)
            }
            
            Spacer()
        }
        .padding(12)
        .background(Color(.secondarySystemBackground))
        .cornerRadius(10)
        .padding(.horizontal, 16)
    }
}

