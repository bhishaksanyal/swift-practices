//
//  NetworkManager.swift
//  APiTest
//
//  Created by Bhishak Sanyal on 13/04/24.
//

import Foundation
import UIKit
import OSLog

let BASE_URL = "https://streaming-availability.p.rapidapi.com/"

struct APIError: Error, Codable {
    var statusCode: Int?
    let message: String?
}

enum URLType {
    case getCountries
    case noURLType
}

class NetworkManager {
    static let shared = NetworkManager()
    
    func fetchData(urlType: URLType) async throws -> ( Data?, APIError? ) {
        
        var urlString = ""
        var httpMethod: String? = nil
        
        switch urlType {
            case .getCountries:
                urlString = BASE_URL + "countries"
                httpMethod = "GET"
            case .noURLType:
                urlString = ""
        }
        
        log(urlString)
        
        guard let url = URL(string: urlString) else {
            return (nil , APIError(statusCode: -1, message: "Invalid URL"))
        }
        
        var urlRequest = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 30)
        urlRequest.httpMethod = httpMethod
        urlRequest.setValue("#key", forHTTPHeaderField: "X-RapidAPI-Key")
        urlRequest.setValue("streaming-availability.p.rapidapi.com", forHTTPHeaderField: "X-RapidAPI-Host")
        
        do {
            let ( data, response ) = try await URLSession.shared.data(for: urlRequest)
            
            log(data)
            
            if let httpResponse = response as? HTTPURLResponse {
                if (httpResponse.statusCode != 200) {
                    var error = try JSONDecoder().decode(APIError.self, from: data)
                    error.statusCode = httpResponse.statusCode
                    return (nil, error)
                } else {
                    // Success
                    return (data, nil)
                }
            }
            
        } catch {
            log(error, "ERROR")
        }
        
        return (nil, nil)
    }
    
}
