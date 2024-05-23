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

