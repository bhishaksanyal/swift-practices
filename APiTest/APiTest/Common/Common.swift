//
//  Common.swift
//  APiTest
//
//  Created by Bhishak Sanyal on 15/04/24.
//

import Foundation

func log(_ value: Any,_ key: String = "") {
    print("\n \(key)-----> \n\(value) \n")
}

func readCountriesJSONFile() {
    do {
        if let bundlePath = Bundle.main.path(forResource: "countries", ofType: "json") ,
            let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {
            
            /**
             Decoding using JSONDecoder()
             */
            let country = try JSONDecoder().decode(CountryResult.self, from: jsonData)
//            log(country.result)
            let contryResult = country.result
            log(contryResult["ae"] ?? "")
            
            
            
            /*
             * Serialize as JSON
             *
            if let json = try JSONSerialization.jsonObject(with: jsonData, options: .mutableLeaves) as? [String: Any] {
                print(json["result"] ?? "" as Any)
            } else {
                log("Error paring json")
            }
             */
        }
    } catch {
        log(error)
    }
}
