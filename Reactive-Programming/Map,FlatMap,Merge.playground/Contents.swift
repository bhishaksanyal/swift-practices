import UIKit
import Combine

// Map
let numberPublisher = (1...10).publisher
let numPub = numberPublisher.map { value in
    return value * 10
}
numPub.sink { number in
    print(number)
}

print("\n///////////////////////////////\n")

// FlatMap
let stringPublisher = ["Hello", "Hey", "Howdy"].publisher
let strPub = stringPublisher.flatMap { value in
    value.publisher
}
strPub.sink { value in
    print(value)
}

print("\n////////////////////////////////\n")

// Merge
let pub1 = [1,2,3].publisher
let pub2 = [4,5,6].publisher

let combinedPub = Publishers.Merge(pub1, pub2)

combinedPub.sink { value in
    print(value)
}
