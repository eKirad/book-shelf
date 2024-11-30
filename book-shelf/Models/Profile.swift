import Foundation

struct Profile {
    var firstName: String
    var lastName: String
    var username: String
    var email: String
    var prefersNotifications = true
    
    static let `defaultProfile` = Profile(firstName: "John", lastName: "Doe", username: "jonny", email: "john.doe@jonny.com")
}
