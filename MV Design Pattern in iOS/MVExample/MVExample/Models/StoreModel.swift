//
//  StoreModel.swift
//  MVExample
//
//  Created by Bhishak Sanyal on 16/06/24.
//

import Foundation

@MainActor
class StoreModel: ObservableObject {
    
    @Published var products: [Product] = []
    
    let webservice: Webservice
    
    init(webservice: Webservice) {
        self.webservice = webservice
    }
    
    func populateProducts() async throws {
        products = try await Webservice().getAllProducts()
    }
    
}
