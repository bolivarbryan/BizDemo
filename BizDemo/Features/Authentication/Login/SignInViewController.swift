//
//  SignInViewController.swift
//  BizDemo
//
//  Created by Bryan A Bolivar M on 9/05/23.
//

import UIKit

class SignInViewController: UIViewController {

    var viewModel: SignInViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = SignInViewModel(signInResponse: { response in
            if response != nil {
                self.presentErrorAlert()
            } else {
                self.navigateToHome()
            }
        }, createCompanyAction: {
            self.navigationController?.pushViewController(CompanyFormViewController(), animated: true)
        })
        let companyFormView = SignInFormView(viewModel: viewModel)
        setBaseView(companyFormView)
    }
    
    func presentErrorAlert() {
        let alert = UIAlertController(title: Language.error.localized,
                                      message: Language.nitNotFound.localized,
                                      preferredStyle: .alert
        )
        let action = UIAlertAction(title: "Ok", style: .default)
        alert.addAction(action)
        present(alert, animated: true)
    }
    
    func navigateToHome() {
        let router = ProductsRouter.createModule()
        router.modalPresentationStyle = .fullScreen
        self.present(router, animated: true, completion: nil)
    }
}
