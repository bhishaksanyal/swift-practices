//
//  ContentView.swift
//  MVExample
//
//  Created by Bhishak Sanyal on 16/06/24.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject private var storeModel: StoreModel
    
    private func populateProducts() async {
        do {
            try await storeModel.populateProducts()
        } catch {
            print(error)
        }
    }
    
    var body: some View {
        
        ScrollView {
            LazyVGrid(columns: [
                GridItem(.adaptive(minimum: 200)),
                GridItem(.adaptive(minimum: 200))
            ]) {
                ForEach(storeModel.products, id: \.id) { product in
                    Text(String(product.rating.rate))
                        .frame(width: 180, height: 150, alignment: .center)
                        .background(.blue)
                        .cornerRadius(10)
                        .foregroundColor(.white)
                        .font(.title)
                }
            }
        }.task {
            await populateProducts()
        }
        .padding()
    }
}

#Preview {
    ContentView().environmentObject(StoreModel(webservice: Webservice()))
}
