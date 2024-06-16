//
//  MVExampleApp.swift
//  MVExample
//
//  Created by Bhishak Sanyal on 16/06/24.
//

import SwiftUI

@main
struct MVExampleApp: App {
    
    @StateObject private var storeModel = StoreModel(webservice: Webservice())
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(storeModel)
        }
    }
}
