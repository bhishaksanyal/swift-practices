//
//  FavoriteButton.swift
//  Landmarks
//
//  Created by Bhishak Sanyal on 18/02/24.
//

import SwiftUI

struct FavoriteButton: View {
    
    @Binding var isSet: Bool
    
    var body: some View {
        Button(action: {
            isSet.toggle()
        }, label: {
            Label("Set Favorite", systemImage: isSet ? "star.fill" : "star")
                .labelStyle(.iconOnly)
                .foregroundStyle(isSet ? .yellow : .gray)
        })
    }
}

#Preview {
    FavoriteButton(isSet: .constant(true))
}
