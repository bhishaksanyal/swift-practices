//
//  ContentView.swift
//  Landmarks
//
//  Created by Bhishak Sanyal on 11/04/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            MapView()
                .frame(height: 300)
                .clipShape(
                    .rect(topLeadingRadius: 20, topTrailingRadius: 20)
                )
            
            CircleImage()
                .offset(y: -130)
                .padding(.bottom, -130)
            
            VStack (alignment: .leading) {
                Text("Turtle Rock")
                    .font(.title)
                    .fontWeight(.bold)
                HStack {
                    Text("Joshua Tree National Park")
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                    Spacer()
                    Text("California")
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                }
                
                Divider()
                Text("About turtle rock")
                    .font(.title2)
                    .fontWeight(.semibold)
                
                Text("Descriptive text goes here.")
                    .font(.caption)
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
