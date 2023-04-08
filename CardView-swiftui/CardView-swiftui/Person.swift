//
//  Person.swift
//  CardView-swiftui
//
//  Created by Bhishak Sanyal on 07/04/23.
//

import Foundation

struct Person {
    let headerImage: String
    let profileImage: String
    let name: String
    let followerCount: Int
    let jobTitle: String
}

let John = Person(headerImage: "headerImage1", profileImage: "profileImage1", name: "John Doe", followerCount: 1000, jobTitle: "Software Developer")
let Emily = Person(headerImage: "headerImage2", profileImage: "profileImage2", name: "Emily Paris", followerCount: 2500, jobTitle: "Product Designer")
let Clark = Person(headerImage: "headerImage1", profileImage: "profileImage1", name: "Clark Lee", followerCount: 2000, jobTitle: "Chief Technical Officer")
