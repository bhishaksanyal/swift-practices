import UIKit
import Combine

class EvenSubject<Failure: Error>: Subject {
    
    typealias Output = Int
    
    private let wrapped: PassthroughSubject<Int, Failure>
    
    init(initialValue: Int) {
        self.wrapped = PassthroughSubject()
        let evenInitialValue = initialValue % 2 == 0 ? initialValue: 0
        send(initialValue)
    }
    
    func send(subscription: Subscription) {
        wrapped.send(subscription: subscription)
    }
    
    func send(_ value: Int) {
        if value % 2 == 0 {
            wrapped.send(value)
        }
    }
    
    func send(completion: Subscribers.Completion<Failure>) {
        wrapped.send(completion: completion)
    }
    
    func receive<S>(subscriber: S) where S : Subscriber, Failure == S.Failure, Int == S.Input {
        wrapped.receive(subscriber: subscriber)
    }
    
}

let subject = EvenSubject<Never>(initialValue: 4)

let cancellable = subject.sink { value in
    print(value)
}

subject.send(12)
subject.send(13)
subject.send(20)


class OddSubject<Failure: Error>: Subject {
    
    typealias Output = Int
    
    private let subject: PassthroughSubject<Int, Failure>
    
    init(initialValue: Int) {
        self.subject = PassthroughSubject()
        let oddValue = initialValue % 2 == 1 ? initialValue : 0
        send(oddValue)
    }
    
    func send(_ value: Int) {
        if value % 2 == 1 {
            subject.send(value)
        }
    }
    
    func send(completion: Subscribers.Completion<Failure>) {
        subject.send(completion: completion)
    }
    
    func receive<S>(subscriber: S) where S : Subscriber, Failure == S.Failure, Int == S.Input {
        subject.receive(subscriber: subscriber)
    }
    
    func send(subscription: any Subscription) {
        subject.send(subscription: subscription)
    }
}

let oddSub = OddSubject<Never>(initialValue: 3)

oddSub.sink { value in
    print(value)
}

oddSub.send(13)
oddSub.send(30)
oddSub.send(33)
