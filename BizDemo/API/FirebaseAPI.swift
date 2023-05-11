//
//  FirebaseAPI.swift
//  BizDemo
//
//  Created by Bryan A Bolivar M on 9/05/23.
//

import Foundation
import FirebaseCore
import FirebaseFirestore

enum FirebaseAPI {
    case saveCompany(company: Company)
    case findCompany(nit: String, ((Company?) -> ()))
    case findProduct(name: String)
    case listProducts(products: ([Product]) -> ())
    case saveProduct(product: Product)
    
    private var endpoint: String {
        switch self {
        case .findCompany:
            return "companies"
        case .findProduct, .listProducts, .saveProduct:
            return "products"
        case .saveCompany:
            return "companies"
        }
    }
    
    private var query: CollectionReference {
        let db = Firestore.firestore()
        return db.collection(endpoint)
    }
    
    private var data: [String: Any] {
        switch self {
        case .findCompany(let nit, _):
            return ["nit": nit]
        case .saveCompany(company: let company):
            return company.dictionaryRepresentation
        case .findProduct(name: let name):
            return ["name": name]
        case .listProducts:
            return [:]
        case .saveProduct(product: let product):
            return product.dictionaryRepresentation
        }
    }
    
    func execute() {
        switch self {
        case .saveCompany:
            var ref: DocumentReference? = nil
            ref = query.addDocument(data: data) { err in
                if let err = err {
                    print("Error adding document: \(err)")
                } else {
                    print("Document added with ID: \(ref!.documentID)")
                }
            }
        case .findCompany(nit: let nit, let response):
            query.getDocuments() { (querySnapshot, err) in
                if let err = err {
                    print("Error getting documents: \(err)")
                } else {
                    let data = querySnapshot!.documents
                        .map { document in
                            document.data()
                        }.compactMap { document -> Company? in
                            guard let name = document["name"] as? String,
                            let address = document["address"] as? String,
                            let city = document["city"] as? String,
                            let country = document["country"] as? String,
                            let nit = document["nit"] as? String,
                            let phone = document["phone"] as? String
                            else {
                                return nil
                            }
                            
                            return Company(name: name,
                                           address: address,
                                           city: city,
                                           country: Country(rawValue: country) ?? Country.colombia,
                                           nit: nit,
                                           phone: phone)
                        }
                        .first { $0.nit == nit }
                    
                    response(data)
                }
            }
        case .findProduct:
            break
        case .listProducts(let response):
            query.getDocuments() { (querySnapshot, err) in
                if let err = err {
                    print("Error getting documents: \(err)")
                    response([])
                } else {
                    let data = querySnapshot!.documents
                        .map { document in
                            document.data()
                        }
                        .compactMap { document -> Product? in
                            return Product.generate(from: document)
                        }
                    print(data)
                    
                 response(data)
                }
            }
        case .saveProduct:
            var ref: DocumentReference? = nil
            ref = query.addDocument(data: data) { err in
                if let err = err {
                    print("Error adding document: \(err)")
                } else {
                    print("Document added with ID: \(ref!.documentID)")
                }
            }
        }
    }
}
