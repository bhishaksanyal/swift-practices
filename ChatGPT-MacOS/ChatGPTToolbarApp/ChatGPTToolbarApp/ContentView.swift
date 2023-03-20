//
//  ContentView.swift
//  ChatGPTToolbarApp
//
//  Created by Bhishak Sanyal on 20/03/23.
//

import SwiftUI
import OpenAISwift

struct ContentView: View {
    
    @State private var search: String = ""
    
    let openAI = OpenAISwift(authToken: "")
    @State private var responses: [String] = []
    
    private var isFormValid: Bool {
        !search.isEmpty
    }
    
    var body: some View {
        VStack {
            HStack {
                TextField("search...", text: $search)
                    .textFieldStyle(.roundedBorder)
                
                Button {
                    // action
                } label: {
                    Image(systemName: "magnifyingglass.circle.fill")
                        .font(.title)
                }.buttonStyle(.borderless)
                    .disabled(!isFormValid)
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
