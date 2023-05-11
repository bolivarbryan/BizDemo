//
//  CompanyFormViewController.swift
//  BizDemo
//
//  Created by Bryan A Bolivar M on 9/05/23.
//

import Foundation
import SwiftUI

class CompanyFormViewController: UIViewController {
    
    var viewModel: CompanyFormViewModel?
    
    init() {
        super.init(nibName: nil, bundle: nil)
        self.title = "Company Form"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel = CompanyFormViewModel(createCompanyAction: { company in
            FirebaseAPI.saveCompany(company: company).execute()
            self.navigationController?.popViewController(animated: true)
        })
        
        let companyFormView = CompanyFormView(viewModel: viewModel!)
        setBaseView(companyFormView)
    }
    
}
