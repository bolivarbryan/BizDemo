//
//  NewProductRouter.swift
//  BizDemo
//
//  Created by Bryan A Bolivar M on 11/05/23.
//  
//

import Foundation
import UIKit

class NewProductRouter: PresenterToRouterNewProductProtocol {
    
    // MARK: Static methods
    static func createModule() -> UIViewController {
        
        let viewController = NewProductViewController()
        
        let presenter: ViewToPresenterNewProductProtocol & InteractorToPresenterNewProductProtocol = NewProductPresenter()
        
        viewController.presenter = presenter
        viewController.presenter?.router = NewProductRouter()
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = NewProductInteractor()
        viewController.presenter?.interactor?.presenter = presenter
        
        return viewController
    }
    
    
    
}
