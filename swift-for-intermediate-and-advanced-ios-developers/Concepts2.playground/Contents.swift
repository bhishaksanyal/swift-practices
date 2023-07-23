import UIKit


/**
 Enums
 */
enum Weekday: Int {
    case sunday = 1
    case monday
    case tuesday
    case wednesday
    case thursday
    case friday
    case saturday
}

print(Weekday.saturday.rawValue)

enum HTTPStatusCode: String {
    case ok = "200"
    case notFound = "404"
    case badRequest = "400"
}

print(HTTPStatusCode.notFound.rawValue)

let day = 3

if let weekday = Weekday(rawValue: day) {
    print(weekday)
}

enum UserRole: String, Codable {
    case admin = "admin"
    case user = "user"
}

let userRole = UserRole.admin
let jsonData = try JSONEncoder().encode(userRole)
print(jsonData)

let decodedUserRole = try JSONDecoder().decode(UserRole.self, from: jsonData)
print(decodedUserRole.rawValue)

/**
 Associated values
 */

enum Request {
    case get(String)
    case post(String, [String: Any])
}

func makeRequest(_ request: Request) {
    
    switch request {
        case .get(let url):
            print(url)
        case .post(let url, let parameters):
            print(url)
            print(parameters)
    }
}

enum Result<T> {
    case success(T)
    case failure(Error)
}

func fetchData(completion: ((Result<String>) -> Void)) {
    
}

/**
 Nested enums
 */
enum Restaurant {
    
    enum Menu {
        case appetizers([String])
        case entrees([String])
        case desserts([String])
    }
    
    case name(String)
    case rating(Double)
    case location(String)
    case menu(Menu)
    
}

/*
enum Routes: Hashable {
    case catalog(CatalogRoutes)
    case inventory(InventoryRoutes)
    
    enum CatalogRoutes: Hashable {
        case home
        case detail(Category)
                
    }
    
    enum InventoryRoutes: Hashable {
        case home
        case detail(Product)
    }
} */

let menu: Restaurant.Menu = .entrees(["Chicken", "Beef"])
