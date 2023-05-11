//
//  ProductsRouter.swift
//  BizDemo
//
//  Created by Bryan A Bolivar M on 9/05/23.
//  
//

import Foundation
import UIKit

class ProductsRouter: PresenterToRouterProductsProtocol {
    
    // MARK: Static methods
    static func createModule() -> UIViewController {
        
        let viewController = ProductsViewController()
        
        let presenter: ViewToPresenterProductsProtocol & InteractorToPresenterProductsProtocol = ProductsPresenter()
        
        viewController.presenter = presenter
        viewController.presenter?.router = ProductsRouter()
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = ProductsInteractor()
        viewController.presenter?.interactor?.presenter = presenter
        
        let navigationController = UINavigationController(rootViewController: viewController)
        viewController.title = Language.products.localized
        return navigationController
    }
}
