//
//  ContentView.swift
//  Landmarks
//
//  Created by Bhishak Sanyal on 11/04/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack (alignment: .leading) {
            Text("Turtle Rock")
                .font(.title)
                .fontWeight(.bold)
            HStack {
                Text("Joshua Tree National Park")
                    .font(.subheadline)
                Spacer()
                Text("California")
                    .font(.subheadline)
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
