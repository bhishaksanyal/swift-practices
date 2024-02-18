//
//  LandmarkRow.swift
//  Landmarks
//
//  Created by Bhishak Sanyal on 03/12/23.
//

import SwiftUI

struct LandmarkRow: View {
    
    var landmark: Landmark
    
    var body: some View {
        HStack {
            landmark.image
                .resizable()
                .frame(width: 60, height: 60)
                .clipShape(.circle)
            
            Text(landmark.name)
                .font(.headline)
            
            Spacer()
            
            if landmark.isFavorite {
                Image(systemName: "star.fill")
                    .foregroundStyle(.yellow)
            }
        }
    }
}

#Preview {
//    Group {
    LandmarkRow(landmark: ModelData().landmarks[0])
//    }
}
