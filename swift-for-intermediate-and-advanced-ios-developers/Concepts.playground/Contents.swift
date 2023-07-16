import UIKit

// Optionals

let name: String? = nil

// nil coalescing
//print(name ?? "Placeholder")


// Optional chaning
class Person {
    var name: String
    var age: Int?
    var address: Address?
    
    init(name: String, age: Int?, address: Address?) {
        self.name = name
        self.age = age
        self.address = address
    }
}

class Address {
    var street: String
    var city: String
    
    init(street: String, city: String) {
        self.street = street
        self.city = city
    }
}

let person: Person = Person(name: "Bhishak", age: nil, address: Address(street: "Bangur avenue", city: "Kolkata"))

if let city = person.address?.city {
//    print(city)
}

//print(person.address?.city ?? "No city")


