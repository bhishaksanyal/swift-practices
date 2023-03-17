//
//  Action.swift
//  MapSwiftSwiftUI
//
//  Created by Bhishak Sanyal on 16/03/23.
//

import Foundation

struct Action: Identifiable {
    let id = UUID()
    let title: String
    let image: String
    let handler: () -> Void
}
