//
//  ContentView.swift
//  MVExample
//
//  Created by Bhishak Sanyal on 16/06/24.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject private var storeModel: StoreModel
    
    private let width = UIScreen.main.bounds.width
    private let itemWidth = (UIScreen.main.bounds.width / 2)
    
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
                GridItem(.adaptive(minimum: itemWidth)),
                GridItem(.adaptive(minimum: itemWidth))
            ]) {
                ForEach(storeModel.products, id: \.id) { product in
                    
                    VStack {
                        VStack (alignment: .leading) {
                            AsyncImage(url: URL(string: product.image)) { image in
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                            } placeholder: {
                                ProgressView()
                            }
                            
                            Text(product.title)
                                .bold()
                                .font(.title3)
                            
                            Text(product.description)
                                .bold()
                                .font(.caption)
                        }
                        .padding(5)
                        
                    }
                    .background(Color(.white))
                    .cornerRadius(10)
                    .shadow(radius: 2)
                    .padding(5)
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
