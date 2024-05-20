//
//  ExchangeInfo.swift
//  LOTRConverter17
//
//  Created by Bhishak Sanyal on 13/05/24.
//

import SwiftUI

struct ExchangeInfo: View {
    var body: some View {
        ZStack {
            Image(.parchment)
                .resizable()
                .ignoresSafeArea()
            
            // Content
            VStack {
                Text("Exchange Rates")
                    .font(.largeTitle)
                    .fontWeight(.medium)
                
                Text("Here at the Prancing Pony, we are happy to offer you a place where you can exchange all the known currencies in the entire world except one. We used to take Brandy Bucks, but after finding out that it was a person instead of a piece of paper, we realized it had no value to us. Below is a simple guide to our currency exchange rates:")
                    .font(.title2)
                
                // Repeater
                ExchangeRate(leftImage: .goldpiece, converstiontext: "1 Gold Piece = 4 Gold Pennies", rightImage: .goldpenny)
                
                Button(action: {
                    
                }, label: {
                    Text("Done")
                        .font(.title)
                        .foregroundStyle(.white)
                })
                .buttonStyle(.borderedProminent)
                .tint(.brown)
                .padding()
            }
            .foregroundStyle(.black)
            .padding()
        }
        .background(.brown)
    }
}

#Preview {
    ExchangeInfo()
}
