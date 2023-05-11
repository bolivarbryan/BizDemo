//
//  ProductsContract.swift
//  BizDemo
//
//  Created by Bryan A Bolivar M on 9/05/23.
//  
//

import Foundation


// MARK: View Output (Presenter -> View)
protocol PresenterToViewProductsProtocol {
    func didLoadProducts(products: [Product])
}


// MARK: View Input (View -> Presenter)
protocol ViewToPresenterProductsProtocol {
    
    var view: PresenterToViewProductsProtocol? { get set }
    var interactor: PresenterToInteractorProductsProtocol? { get set }
    var router: PresenterToRouterProductsProtocol? { get set }
    
    func loadProducts()
}


// MARK: Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorProductsProtocol {
    
    var presenter: InteractorToPresenterProductsProtocol? { get set }
    
    func loadProductsFromRemote()
}


// MARK: Interactor Output (Interactor -> Presenter)
protocol InteractorToPresenterProductsProtocol {
    func didLoadProducts(products: [Product])
}


// MARK: Router Input (Presenter -> Router)
protocol PresenterToRouterProductsProtocol {
    
}
