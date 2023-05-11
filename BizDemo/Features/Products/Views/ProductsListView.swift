//
//  ProductsListView.swift
//  BizDemo
//
//  Created by Bryan A Bolivar M on 10/05/23.
//

import SwiftUI

struct ProductsListView: View {
    
    var products: [Product]
    
    var body: some View {
        List(products) { product in
            Text(product.name)
         }
    }
}
