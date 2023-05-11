//
//  NewProductPresenter.swift
//  BizDemo
//
//  Created by Bryan A Bolivar M on 11/05/23.
//  
//

import Foundation

class NewProductPresenter: ViewToPresenterNewProductProtocol {

    // MARK: Properties
    var view: PresenterToViewNewProductProtocol?
    var interactor: PresenterToInteractorNewProductProtocol?
    var router: PresenterToRouterNewProductProtocol?
    
    func saveProduct(_ product: Product) {
        interactor?.storeProductInCloud(product: product)
    }
}

extension NewProductPresenter: InteractorToPresenterNewProductProtocol {
    func productDidSaveWithError(error: Error?) {
        view?.productDidSaveWithError(error: error)
    }
}
