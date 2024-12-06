import Foundation

@Observable
class ModelData {
    var books: Array<Book> = [
        Book (id: 12, name: "Test", description: "Test description", genre: BookGenre.mystery, coverImageName: "mystery-genre-cover"),
        Book (id: 13, name: "Chek mystery", description: "Test description", genre: BookGenre.mystery, coverImageName: "mystery-genre-cover"),
        Book (id: 14, name: "Test another", description: "Test description", genre: BookGenre.romance, coverImageName: "romance-genre-cover"),
        Book (id: 15, name: "Okay, this", description: "Test description", genre: BookGenre.thriller, coverImageName: "thriller-genre-cover"),
        
    ]
    
    var genres: [String: [Book]] {
        Dictionary(
            grouping: books,
            by: { $0.genre.rawValue }
        )
    }
}
