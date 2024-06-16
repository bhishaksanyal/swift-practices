//
//  Webservice.swift
//  MVExample
//
//  Created by Bhishak Sanyal on 16/06/24.
//

import Foundation

enum NetworkErrors: Error {
    case badUrl
    case networkError
}

class Webservice {
    
    func getAllProducts() async throws -> [Product] {
        
        guard let baseURL = URL(string: "https://fakestoreapi.com/products") else {
            throw NetworkErrors.badUrl
        }
        
        let (data, response) = try await URLSession.shared.data(from: baseURL)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw NetworkErrors.networkError
        }
        
        let products = try JSONDecoder().decode([Product].self, from: data)
        return products
    }
    
}
