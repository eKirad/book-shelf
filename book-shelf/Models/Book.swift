import Foundation

struct Book: Identifiable {
    var id: Int
    var name: String
    var description: String
    var genre: Genre
    
    enum Genre: String, CaseIterable, Codable {
        case mystery = "Mystery"
        case thriller = "Thriller"
        case romance = "Romance"
    }
}
