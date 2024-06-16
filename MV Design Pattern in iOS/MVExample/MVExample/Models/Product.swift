//
//  Product.swift
//  MVExample
//
//  Created by Bhishak Sanyal on 16/06/24.
//

import Foundation

struct Rating {
    let rate: Double
    let count: Int
}

struct Product {
    let id: Int
    let title: String
    let price: String
    let description: String
    let image: String
    let rating: Rating
}
