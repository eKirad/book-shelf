import Foundation

@Observable
class ModelData {
    var books: Array<Book> = [
        Book (id: 12, name: "Test", description: "Test description"),
        Book (id: 12, name: "Test another", description: "Test description"),
        Book (id: 12, name: "Okay, this", description: "Test description"),
        
    ]
    
//    var categories: [String: [Book]] {
//        Dictionary(
//            grouping: books,
//            by: { $0.category.rawValue }
//        )
//    }
}
