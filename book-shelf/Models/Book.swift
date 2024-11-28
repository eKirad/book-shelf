import Foundation

struct Book: Identifiable {
    var id: Int
    var name: String
    var description: String
    var genre: Genre
    
    enum Genre: String, CaseIterable, Codable {
        case mystery = "mystery"
        case thriller = "thriller"
        case romance = "romance"
    }
}
