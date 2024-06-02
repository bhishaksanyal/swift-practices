//
//  Movie.swift
//  MoviesAppUIKit
//
//  Created by Bhishak Sanyal on 02/06/24.
//

import Foundation

struct MovieResponse: Codable {
    let Search: [Movie]
}

struct Movie: Codable {
    let title: String
    let year: String
    
    private enum CodingKeys: String, CodingKey {
        case title = "Title"
        case year = "Year"
    }
}
