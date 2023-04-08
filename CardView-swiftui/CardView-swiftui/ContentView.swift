//
//  ContentView.swift
//  CardView-swiftui
//
//  Created by Bhishak Sanyal on 05/04/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        List() {
            PersonCardView(person: John)
                .listRowSeparator(.hidden)
            
            PersonCardView(person: Emily)
                .listRowSeparator(.hidden)
            
            PersonCardView(person: Clark)
                .listRowSeparator(.hidden)
        }
        .listStyle(.plain)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
