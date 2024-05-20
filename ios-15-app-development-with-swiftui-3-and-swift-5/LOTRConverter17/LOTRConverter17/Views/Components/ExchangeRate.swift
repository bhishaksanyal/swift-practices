//
//  ExchangeRate.swift
//  LOTRConverter17
//
//  Created by Bhishak Sanyal on 13/05/24.
//

import SwiftUI

struct ExchangeRate: View {
    
    let leftImage: ImageResource
    let converstiontext: String
    let rightImage: ImageResource
    
    var body: some View {
        HStack {
            Image(leftImage)
                .resizable()
                .scaledToFit()
                .frame(height: 33)
            
            Text(converstiontext)
                .font(.callout)
                .fontWeight(.medium)
            
            Image(rightImage)
                .resizable()
                .scaledToFit()
                .frame(height: 33)
        }
    }
}

#Preview {
    ExchangeRate(leftImage: .copperpenny, converstiontext: "Message", rightImage: .goldpenny)
}
