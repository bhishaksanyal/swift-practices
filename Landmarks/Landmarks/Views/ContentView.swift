//
//  ContentView.swift
//  Landmarks
//
//  Created by Bhishak Sanyal on 11/04/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        LandmarkList()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environment(ModelData())
    }
}
