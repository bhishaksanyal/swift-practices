//
//  LandmarkDetail.swift
//  Landmarks
//
//  Created by Bhishak Sanyal on 03/12/23.
//

import SwiftUI

struct LandmarkDetail: View {
    
    @Environment(ModelData.self) var modelData
    var landmark: Landmark
    
    var landmarkIndex: Int {
        modelData.landmarks.firstIndex(where: { $0.id == landmark.id })!
    }
    
    var body: some View {
        
        @Bindable var modelData = modelData
        
        ScrollView {
            MapView(coordinate: landmark.locationCoordinate)
                .frame(height: 300)
            
            CircleImage(image: landmark.image)
                .offset(y: -130)
                .padding(.bottom, -130)
            
            VStack (alignment: .leading) {
                
                HStack {
                    Text(landmark.name)
                        .font(.title)
                    .fontWeight(.bold)
                    
                    Spacer()
                    
                    FavoriteButton(isSet: $modelData.landmarks[landmarkIndex].isFavorite)
                }
                
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
    let modelData = ModelData()
    return LandmarkDetail(landmark: modelData.landmarks[0])
        .environment(modelData)
}
