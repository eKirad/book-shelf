import Foundation

@Observable
class ModelData {
    var books: Array<Book> = [
        Book (id: 12, name: "Test", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.", genre: BookGenre.mystery, coverImageName: "mystery-genre-cover", authorName: "John Doe"),
        Book (id: 13, name: "Chek mystery", description:  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",genre: BookGenre.mystery, coverImageName: "mystery-genre-cover", authorName:  "Max Musternan"),
        Book (id: 14, name: "Test another", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.", genre: BookGenre.romance, coverImageName: "romance-genre-cover", authorName: "Maxi Muster"),
        Book (id: 15, name: "Okay, this", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.", genre: BookGenre.thriller, coverImageName: "thriller-genre-cover", authorName: "Johny Doe"),
        
    ]
    
    var genres: [String: [Book]] {
        Dictionary(
            grouping: books,
            by: { $0.genre.rawValue }
        )
    }
}
