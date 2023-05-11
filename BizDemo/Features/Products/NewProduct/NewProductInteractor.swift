//
//  NewProductInteractor.swift
//  BizDemo
//
//  Created by Bryan A Bolivar M on 11/05/23.
//  
//

import Foundation

class NewProductInteractor: PresenterToInteractorNewProductProtocol {

    // MARK: Properties
    var presenter: InteractorToPresenterNewProductProtocol?
    
    func storeProductInCloud(product: Product) {
        FirebaseAPI.saveProduct(product: product).execute()
        presenter?.productDidSaveWithError(error: nil)
    }
    
}
