### Creating and working with Publishers
```swift
let publisher = Just(123)

let cancellable = publisher.sink { value in
    print(value)
}

// cancellable is not required
cancellable.cancel()

let numbersPublisher = [1,2,3,4,5,6].publisher
let doublePublisher = numbersPublisher.map { $0 * 2 }

let cancellable = doublePublisher.sink { value in
    print(value)
}
```
### Subscribing to Publishers

###### Device orientation publisher swiftUI
```
import SwiftUI
import Combine

@main
struct DeviceOrientationPublisherApp: App {
    
    private var cancellables: Set<AnyCancellable> = []
    
    init() {
        NotificationCenter.default.publisher(for: UIDevice.orientationDidChangeNotification)
            .sink { _ in
                let currentOrientation = UIDevice.current.orientation
                print(currentOrientation)
            }.store(in: &cancellables)
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
```

###### TextField onChange subscription UIKit
```
class ViewController: UIViewController {

    private var cancellables: Set<AnyCancellable> = []
    
    lazy var textField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Enter name"
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.green
        
        // add a TextField
        view.addSubview(textField)
        
        textField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        textField.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        textField.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
        // create publisher
        NotificationCenter.default.publisher(for: UITextField.textDidChangeNotification, object: textField)
            .compactMap { $0.object as? UITextField }
            .sink { textField in
                if let text = textField.text {
                    print(text)
                }
            }.store(in: &cancellables)
        
    }
}
```
### Handling subscription lifecycles

```
class ContentViewModel: ObservableObject {
    
    @Published var value: Int = 0
    private var cancellable: AnyCancellable?
    
    init() {
        
        let publisher = Timer.publish(every: 1.0, on: .main, in: .default)
            .autoconnect()
            .map {
                _  in self.value + 1
            }
        
        cancellable = publisher.assign(to: \.value, on: self)
        
    }
}

struct ContentView: View {
    
    @StateObject private var vm = ContentViewModel()
    
    var body: some View {
        VStack {
            Text("\(vm.value)")
                .font(.largeTitle)
        }
        .padding()
    }

}

#Preview {
    ContentView()
}
```

```
let numbersPublisher = (1...10).publisher

let cancellable = numbersPublisher.sink { value in
    print(value)
}

DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
    cancellable.cancel()
}
```
###### Error Handling
```
import UIKit
import Combine

enum AppError: Error {
    case OperationFailed
}

let numberPublisher = [1,2,3,4,5].publisher

let doublePublisher = numberPublisher.tryMap { number in
    if number == 4 {
        throw AppError.OperationFailed
    }
    
    return number * 3
}
// using mapError
    .mapError { error in
        return error
    }
//    .catch { error in
//        if let numberError = error as? AppError {
//            print("Error occured - \(numberError)")
//        }
//        return Just(0)
//    }

doublePublisher.sink { completion in
    switch completion {
    case .finished:
        print("Completed")
    case .failure(let error):
        print("Got error - \(error)")
    }
} receiveValue: { value in
    print("Doubled value = \(value)")
}
```
### Data Transformation

###### Map

```
let numberPublisher = (1...10).publisher
let numPub = numberPublisher.map { value in
    return value * 10
}
numPub.sink { number in
    print(number)
}
```
###### FlatMap - Flattening the array to individual chars

```
let stringPublisher = ["Hello", "Hey", "Howdy"].publisher
let strPub = stringPublisher.flatMap { value in
    value.publisher
}
strPub.sink { value in
    print(value)
}
```
###### Merge - Merge two publishers of the same type

```
let pub1 = [1,2,3].publisher
let pub2 = [4,5,6].publisher

let combinedPub = Publishers.Merge(pub1, pub2)

combinedPub.sink { value in
    print(value)
}
```
###### Filter

```
let numPublisher = (1...10).publisher

let filteredPublisher = numPublisher.filter { $0 % 2 == 0 }

filteredPublisher.sink { value in
    print(value)
}
```
###### CompactMap - Ignore the nil results where map will send optional and nil

```
let uncompactData = ["1", "2", "A", "4", "5"].publisher

let compactedData = uncompactData.compactMap{ Int($0) }

compactedData.sink { value in
    print(value)
}
```
###### Debounce - Input delay for mentioned duration

```
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
```

###### CombineLatest - Combine results of multiple publishers and sink with a common subscriber

```
let publisher1 = CurrentValueSubject<Int, Never>(1)
let publisher2 = CurrentValueSubject<String, Never>("Hey")

let combined = publisher1.combineLatest(publisher2)

combined.sink { value1, value2 in
    print("Value 1: \(value1) and Value 2: \(value2)")
}

publisher1.send(2)
publisher2.send("Combine")

Output:
Value 1: 1 and Value 2: Hey
Value 1: 2 and Value 2: Hey
Value 1: 2 and Value 2: Combine
```

###### Zip - Combine multiple value streams, ignores extra values in any publisher

```
let zPub1 = [1,2,3,4].publisher
let zPub2 = ["A","B","C"].publisher

//let zippedPublisher = zPub1.zip(zPub2)

let zippedPublisher = Publishers.Zip(zPub1, zPub2)

zippedPublisher.sink { val1, val2 in
    print("\(val1)/ \(val2)")
}
```

###### SwitchToLatest - Switch publishers

```
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
```