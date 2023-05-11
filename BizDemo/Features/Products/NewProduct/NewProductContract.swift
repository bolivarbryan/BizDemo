//
//  NewProductContract.swift
//  BizDemo
//
//  Created by Bryan A Bolivar M on 11/05/23.
//  
//

import Foundation


// MARK: View Output (Presenter -> View)
protocol PresenterToViewNewProductProtocol {
    func productDidSaveWithError(error: Error?)
}

// MARK: View Input (View -> Presenter)
protocol ViewToPresenterNewProductProtocol {
    
    var view: PresenterToViewNewProductProtocol? { get set }
    var interactor: PresenterToInteractorNewProductProtocol? { get set }
    var router: PresenterToRouterNewProductProtocol? { get set }
    
    func saveProduct(_ product: Product)
}


// MARK: Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorNewProductProtocol {
    
    var presenter: InteractorToPresenterNewProductProtocol? { get set }
    
    func storeProductInCloud(product: Product)
}


// MARK: Interactor Output (Interactor -> Presenter)
protocol InteractorToPresenterNewProductProtocol {
    func productDidSaveWithError(error: Error?)
}


// MARK: Router Input (Presenter -> Router)
protocol PresenterToRouterNewProductProtocol {
    
}
