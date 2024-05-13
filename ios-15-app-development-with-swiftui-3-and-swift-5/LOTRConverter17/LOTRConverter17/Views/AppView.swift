//
//  ContentView.swift
//  LOTRConverter17
//
//  Created by Bhishak Sanyal on 02/05/24.
//

import SwiftUI

struct AppView: View {
    
    @State private var showCurrencyView = false
    @State private var leftAmount = ""
    @State private var rightAmount = ""
    
    var body: some View {
        ZStack {
            // Background Image
            Image(.background)
                .resizable()
                .ignoresSafeArea()
            
            // Rest of the UI
            VStack {
                Image(.prancingpony)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 250, height: 250)
                
                Text("Currency Exchange")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundStyle(.white)
                
                // Coverter component
                HStack {
                    VStack {
                        HStack {
                            Image(.silverpiece)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 33)
                            
                            Text("Silver Piece")
                                .font(.callout)
                                .fontWeight(.bold)
                                .foregroundStyle(.white)
                        } // HStack
                        
                        TextField("Amount", text: $leftAmount)
                            .textFieldStyle(.roundedBorder)
                    }
                    
                    Image(systemName: "equal")
                        .font(.title)
                        .foregroundStyle(.white)
                        .symbolEffect(.pulse)
                    
                    VStack {
                        HStack {
                            Image(.silverpiece)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 33)
                            
                            Text("Silver Piece")
                                .font(.callout)
                                .fontWeight(.bold)
                                .foregroundStyle(.white)
                        } // HStack
                        
                        TextField("Amount", text: $rightAmount)
                            .textFieldStyle(.roundedBorder)
                    }
                }
                .padding()
                .background(.black.opacity(0.5))
                .clipShape(.capsule)
                
                Spacer()
                
                HStack {
                    
                    Spacer()
                    
                    Button(action: {
                        showCurrencyView.toggle()
                    }, label: {
                        Image(systemName: "info.circle.fill")
                            .font(.largeTitle)
                            .foregroundStyle(.white)
                    })
                }
                .padding(.horizontal)
                
            } // VStack
        } // ZStack
    }
}

#Preview {
    AppView()
}
