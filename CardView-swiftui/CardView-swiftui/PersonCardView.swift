//
//  PersonCardView.swift
//  CardView-swiftui
//
//  Created by Bhishak Sanyal on 07/04/23.
//

import SwiftUI

struct PersonCardView: View {
    
    let person: Person
    var body: some View {
        VStack {
            
            ZStack (alignment: .leading) {
                Image(person.headerImage)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 80)
                    .clipped()
                
                Image(person.profileImage)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 80, height: 80)
                    .clipShape(Circle())
                    .offset(y: 40)
                    .padding(.horizontal)
                    .frame(alignment: .leading)
            }
            .overlay(alignment: .topTrailing) {
                Button {
                    //
                } label: {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(.white)
                        .padding(6)
                    
                }
            }
            
            VStack (spacing: 0.0) {
                Button {
                    //
                } label: {
                    Text("Follow")
                        .padding(.vertical, 4)
                        .padding(.horizontal)
                        .foregroundColor(.blue)
                        .overlay {
                            Capsule()
                                .stroke(lineWidth: 2)
                                .foregroundColor(.blue)
                        }
                    
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
                .padding([.trailing, .top])
                
                HStack {
                    Text(person.name)
                        .fontWeight(.bold)
                    
                    Text("· \(person.followerCount) followers")
                        .foregroundColor(.secondary)
                    
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading)
                
                Text(person.jobTitle)
                    .font(.footnote)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding([.leading, .bottom])

            }
        }
        .background(Color(.tertiarySystemFill))
        .cornerRadius(12)
    }
}

struct PersonCardView_Previews: PreviewProvider {
    static var previews: some View {
        PersonCardView(person: John)
            .previewLayout(.sizeThatFits)
    }
}
