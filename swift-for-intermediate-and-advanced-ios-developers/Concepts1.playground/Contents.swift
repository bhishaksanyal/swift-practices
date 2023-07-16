import UIKit

/**
 Associated types
 */

struct Movie: Codable {
    var title: String
}

struct User: Codable {
    var name: String
}

protocol WebserviceProtocol {
    associatedtype Model
    
    func getAll(url: URL, completion: (Result<[Model], Error>) -> Void)
}

class MovieService: WebserviceProtocol {
    typealias Model = Movie
    func getAll(url: URL, completion: (Result<[Movie], Error>) -> Void) {
        
    }
}

class UserService: WebserviceProtocol {
    typealias Model = User
    func getAll(url: URL, completion: (Result<[User], Error>) -> Void) {
        
    }
}


/**
 Generic types
 */

let names = ["Alex", "Bhishak", "Himanshu"]
let numbers = [3,4,5,6]

// String signature
//func firstElement(_ array: [String]) -> String? {
//    array.first
//}

// Generic signature
func firstElement<T>(_ array: [T]) -> T? {
    array.first
}

if let name = firstElement(names) {
//    print(name)
}

if let number = firstElement(numbers) {
//    print(number)
}

/**
 Generic struct and class
 */
struct Pair<T, K> {
    var first: T
    var second: K
}

let pair = Pair(first: "New", second: 99)

class Stack<T> {
    var elements = [T]()
    
    func push(item: T) {
        elements.append(item)
    }
    
    func pop() {
        elements.popLast()
    }
}

let stackInt = Stack<Int>()

stackInt.push(item: 22)
stackInt.push(item: 33)
stackInt.push(item: 44)

print(stackInt.elements)

stackInt.pop()

print(stackInt.elements)

let stackString = Stack<String>()

stackString.push(item: "Alex")
stackString.push(item: "Bhishak")
stackString.push(item: "John")

print(stackString.elements)

stackString.pop()

print(stackString.elements)
