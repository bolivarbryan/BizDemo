//
//  ProductsTableView.swift
//  BizDemo
//
//  Created by Bryan A Bolivar M on 10/05/23.
//

import UIKit

class ProductsTableView: UIView, UITableViewDataSource {
    
    let tableView = UITableView(frame: .zero)
    var products: [Product] = []
    
    init(products: [Product]) {
        super.init(frame: .zero)
        self.products = products
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure() {
        addSubview(tableView)
        tableView.dataSource = self
    }
}

extension ProductsTableView {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProductsTableViewCell")
        cell?.textLabel?.text = products[indexPath.row].name
        return cell ?? UITableViewCell(frame: .zero)
    }
}
