//
//  NewProductViewController.swift
//  BizDemo
//
//  Created by Bryan A Bolivar M on 11/05/23.
//  
//

import UIKit

class NewProductViewController: UIViewController {
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let form = NewProductFormView { product in
            self.presenter?.saveProduct(product)
        }
        setBaseView(form)
        self.title = Language.newProduct.localized
    }

    // MARK: - Properties
    var presenter: ViewToPresenterNewProductProtocol?
    
}

extension NewProductViewController: PresenterToViewNewProductProtocol{
    func productDidSaveWithError(error: Error?) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
