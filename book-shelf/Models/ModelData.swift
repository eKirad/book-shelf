import Foundation

@Observable
class ModelData {
    var books: Array<Book> = [
        Book (id: 12, name: "Test", description: "Test description", genre: BookGenre.mystery),
        Book (id: 12, name: "Chek mystery", description: "Test description", genre: BookGenre.mystery),
        Book (id: 12, name: "Test another", description: "Test description", genre: BookGenre.romance),
        Book (id: 12, name: "Okay, this", description: "Test description", genre: BookGenre.thriller),
        
    ]
    
    var genres: [String: [Book]] {
        Dictionary(
            grouping: books,
            by: { $0.genre.rawValue }
        )
    }
}
