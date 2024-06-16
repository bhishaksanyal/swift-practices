//
//  Product.swift
//  MVExample
//
//  Created by Bhishak Sanyal on 16/06/24.
//

import Foundation

struct Rating: Codable {
    let rate: Double
    let count: Int
}

struct Product: Identifiable, Codable {
    let id: Int
    let title: String
    let price: Double
    let description: String
    let image: String
    let rating: Rating
}
