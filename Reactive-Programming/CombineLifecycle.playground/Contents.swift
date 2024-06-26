import UIKit
import Combine

let numbersPublisher = (1...10).publisher

let cancellable = numbersPublisher.sink { value in
    print(value)
}

DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
    cancellable.cancel()
}


