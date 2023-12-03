//
//  LandmarkList.swift
//  Landmarks
//
//  Created by Bhishak Sanyal on 03/12/23.
//

import SwiftUI

struct LandmarkList: View {
    var body: some View {
        List(landmarks) { landmark in
            LandmarkRow(landmark: landmark)
        }
    }
}

#Preview {
    LandmarkList()
}
