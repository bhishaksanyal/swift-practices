import UIKit
import Combine

// Map - Iterate
let numberPublisher = (1...10).publisher
let numPub = numberPublisher.map { value in
    return value * 10
}
numPub.sink { number in
    print(number)
}

print("\n///////////////////////////////\n")

// FlatMap - Flattening the array to individual chars
let stringPublisher = ["Hello", "Hey", "Howdy"].publisher
let strPub = stringPublisher.flatMap { value in
    value.publisher
}
strPub.sink { value in
    print(value)
}

print("\n////////////////////////////////\n")

// Merge - Merge two publishers of the same type
let pub1 = [1,2,3].publisher
let pub2 = [4,5,6].publisher

let combinedPub = Publishers.Merge(pub1, pub2)

combinedPub.sink { value in
    print(value)
}

print("\n////////////////////////////////\n")

// Filter
let numPublisher = (1...10).publisher

let filteredPublisher = numPublisher.filter { $0 % 2 == 0 }

filteredPublisher.sink { value in
    print(value)
}

print("\n////////////////////////////////\n")

// CompactMap - Ignore the nil results where map will send optional and nil

let uncompactData = ["1", "2", "A", "4", "5"].publisher

let compactedData = uncompactData.compactMap{ Int($0) }

compactedData.sink { value in
    print(value)
}

print("\n////////////////////////////////\n")

// Debounce - Input delay for mentioned duration

let textPublisher = PassthroughSubject<String, Never>()

let debouncedPublisher = textPublisher.debounce(for: 0.5, scheduler: DispatchQueue.main)

let cancellable = debouncedPublisher.sink { value in
    print(value)
}

textPublisher.send("A")
textPublisher.send("B")
textPublisher.send("C")
textPublisher.send("D")
textPublisher.send("E")
textPublisher.send("F")
textPublisher.send("G")
textPublisher.send("H")


textPublisher.send("22A")
textPublisher.send("22B")
textPublisher.send("22C")
textPublisher.send("22D")
textPublisher.send("22E")
textPublisher.send("22F")
textPublisher.send("22G")
textPublisher.send("22H")


