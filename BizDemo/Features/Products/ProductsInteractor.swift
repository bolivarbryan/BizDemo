//
//  ProductsInteractor.swift
//  BizDemo
//
//  Created by Bryan A Bolivar M on 9/05/23.
//  
//

import Foundation

class ProductsInteractor: PresenterToInteractorProductsProtocol {

    // MARK: Properties
    var presenter: InteractorToPresenterProductsProtocol?
    
    func loadProductsFromRemote() {
        FirebaseAPI.listProducts { products in
            self.presenter?.didLoadProducts(products: products)
        }
        .execute()
    }
}
