//
//  ViewController.swift
//  APiTest
//
//  Created by Bhishak Sanyal on 13/04/24.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let network = NetworkManager()
        
        Task {
            do {
                let result: APIError = try await network.fetchData(urlType: .getCountries)
                print("CODE ====== \(result.statusCode ?? 0)\n")
                print("MESSAGE ====== \(result.message ?? "nothing")\n")
            } catch {
                print("Error", error)
            }
        }
    }
    
    
}

