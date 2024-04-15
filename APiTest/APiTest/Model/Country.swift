//
//  Country.swift
//  APiTest
//
//  Created by Bhishak Sanyal on 15/04/24.
//

import Foundation

struct CountryResult: Codable {
    let result: Country
}

struct Country: Codable {
    let countryCode: String
    let name: String
}
