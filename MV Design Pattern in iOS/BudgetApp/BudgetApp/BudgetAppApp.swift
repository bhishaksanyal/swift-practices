//
//  BudgetAppApp.swift
//  BudgetApp
//
//  Created by Bhishak Sanyal on 11/08/24.
//

import SwiftUI

@main
struct BudgetAppApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, CoreDataManager.shared.viewContext)
        }
    }
}
