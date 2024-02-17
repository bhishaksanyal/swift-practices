//
//  LandmarkDetail.swift
//  Landmarks
//
//  Created by Bhishak Sanyal on 03/12/23.
//

import SwiftUI

struct LandmarkDetail: View {
    
    var landmark: Landmark
    
    var body: some View {
        ScrollView {
            MapView(coordinate: landmark.locationCoordinate)
                .frame(height: 300)
            
            CircleImage(image: landmark.image)
                .offset(y: -130)
                .padding(.bottom, -130)
            
            VStack (alignment: .leading) {
                Text(landmark.name)
                    .font(.title)
                    .fontWeight(.bold)
                HStack {
                    Text(landmark.park)
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                    Spacer()
                    Text(landmark.state)
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                }
                
                Divider()
                Text("About \(landmark.name)")
                    .font(.title2)
                    .fontWeight(.semibold)
                
                Text(landmark.description)
                    .font(.subheadline)
            }
            .padding()
        }
        .navigationTitle(landmark.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    LandmarkDetail(landmark: ModelData().landmarks[0])
}
