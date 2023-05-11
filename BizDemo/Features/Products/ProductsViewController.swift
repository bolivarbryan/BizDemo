//
//  ProductsViewController.swift
//  BizDemo
//
//  Created by Bryan A Bolivar M on 9/05/23.
//  
//

import UIKit
import Combine
import SwiftUI

class ProductsViewController: UIViewController {
    
    @Published var products: [Product] = []
    
    var productsBinding: Binding<[Product]> {
        Binding(
            get: { self.products },
            set: { self.products = $0 }
        )
    }
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.loadProducts()
        let productsView = ProductsListView(products: products)
        setBaseView(productsView)
    }

    // MARK: - Properties
    var presenter: ViewToPresenterProductsProtocol?
    
}

extension ProductsViewController: PresenterToViewProductsProtocol{
    func didLoadProducts(products: [Product]) {
        print(products)
        self.products = products
    }
}
