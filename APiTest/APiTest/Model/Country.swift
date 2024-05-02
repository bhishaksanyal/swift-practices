//
//  Country.swift
//  APiTest
//
//  Created by Bhishak Sanyal on 15/04/24.
//

import Foundation

struct CountryResult: Codable {
    let result: [String: Country]
}

struct Country: Codable {
    let countryCode: String
    let name: String
    let services: [String: StreamingService]
}

struct StreamingService: Codable {
    let id: String
    let name: String
    let homePage: String
    let themeColorCode: String
    let images: Images
    let supportedStreamingTypes: SupportedStreamingTypes
    var addons: [String :Addon]
}

struct Images: Codable {
    let lightThemeImage: String
    let darkThemeImage: String
    let whiteImage: String
}

struct SupportedStreamingTypes: Codable {
    let addon: Bool
    let buy: Bool
    let free: Bool
    let rent: Bool
    let subscription: Bool
}

struct Addon: Codable {
    let id: String
    let displayName: String
    let homePage: String
    let themeColorCode: String
    let image: String
    let images: Images
}
