//
//  LandmarksApp.swift
//  Landmarks
//
//  Created by Bhishak Sanyal on 11/04/23.
//

import SwiftUI

@main
struct LandmarksApp: App {
    
    @State private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(modelData)
        }
    }
}
