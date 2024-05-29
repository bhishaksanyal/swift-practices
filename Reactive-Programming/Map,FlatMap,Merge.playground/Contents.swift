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

let debouncedPublisher = textPublisher.debounce(for: 0.1, scheduler: DispatchQueue.main)

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

print("\n////////////////////////////////\n")

// CombineLatest - Combine results of multiple publishers and sink with a common subscriber

let publisher1 = CurrentValueSubject<Int, Never>(1)
let publisher2 = CurrentValueSubject<String, Never>("Hey")

let combined = publisher1.combineLatest(publisher2)

combined.sink { value1, value2 in
    print("Value 1: \(value1) and Value 2: \(value2)")
}

publisher1.send(2)
publisher2.send("Combine")

print("\n////////////////////////////////\n")


// Zip - Combine multiple value streams, ignores extra values in any publisher

let zPub1 = [1,2,3,4].publisher
let zPub2 = ["A","B","C"].publisher

//let zippedPublisher = zPub1.zip(zPub2)

let zippedPublisher = Publishers.Zip(zPub1, zPub2)

zippedPublisher.sink { val1, val2 in
    print("\(val1)/ \(val2)")
}

print("\n////////////////////////////////\n")

// switchToLatest - Switch publishers

let outerPublisher = PassthroughSubject<AnyPublisher<Int, Never>, Never>()
let innerPublisher1 = CurrentValueSubject<Int, Never>(1)
let innerPublisher2 = CurrentValueSubject<Int, Never>(2)

outerPublisher
    .switchToLatest()
    .sink { value in
        print(value)
}

outerPublisher.send(AnyPublisher(innerPublisher1))
innerPublisher1.send(10)

outerPublisher.send(AnyPublisher(innerPublisher2))
innerPublisher2.send(20)
innerPublisher2.send(100)
