import Foundation

@Observable
class ModelData {
    var books: Array<Book> = [
        Book (id: 12, name: "Test", description: "Test description", genre: BookGenre.mystery, coverImageName: "mystery-genre-cover", authorName: "John Doe"),
        Book (id: 13, name: "Chek mystery", description: "Test description", genre: BookGenre.mystery, coverImageName: "mystery-genre-cover", authorName:  "Max Musternan"),
        Book (id: 14, name: "Test another", description: "Test description", genre: BookGenre.romance, coverImageName: "romance-genre-cover", authorName: "Maxi Muster"),
        Book (id: 15, name: "Okay, this", description: "Test description", genre: BookGenre.thriller, coverImageName: "thriller-genre-cover", authorName: "Johny Doe"),
        
    ]
    
    var genres: [String: [Book]] {
        Dictionary(
            grouping: books,
            by: { $0.genre.rawValue }
        )
    }
}
