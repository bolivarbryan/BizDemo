//
//  ProductsPresenter.swift
//  BizDemo
//
//  Created by Bryan A Bolivar M on 9/05/23.
//  
//

import Foundation

class ProductsPresenter: ViewToPresenterProductsProtocol, ObservableObject {

    // MARK: Properties
    var view: PresenterToViewProductsProtocol?
    var interactor: PresenterToInteractorProductsProtocol?
    var router: PresenterToRouterProductsProtocol?
    
    func loadProducts() {
        interactor?.loadProductsFromRemote()
    }
    
}

extension ProductsPresenter: InteractorToPresenterProductsProtocol {
    func didLoadProducts(products: [Product]) {
        view?.didLoadProducts(products: products)
    }
}
