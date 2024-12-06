import Foundation

@Observable
class ModelData {
    var books: Array<Book> = [
        Book (
            id: 1,
            name: "Test",
            description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.", 
            genre: BookGenre.mystery,
            coverImageName: "mystery-genre-cover",
            authorName: "John Doe",
            isFavourite: true
        ),
        Book (
            id: 13,
            name: "Chek mystery",
            description:  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
            genre: BookGenre.mystery,
            coverImageName: "mystery-genre-cover",
            authorName:  "Max Musternan",
            isFavourite: true
        
        ),
        Book (
            id: 14,
            name: "Test another",
            description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.", 
            genre: BookGenre.romance, 
            coverImageName: "romance-genre-cover",
            authorName: "Maxi Muster",
            isFavourite: false
        ),
        Book (
            id: 15,
            name: "Okay, this",
            description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
            genre: BookGenre.thriller,
            coverImageName: "thriller-genre-cover",
            authorName: "Johny Doe",
            isFavourite: false
        ),
    ]
    
    var genres: [String: [Book]] {
        Dictionary(
            grouping: books,
            by: { $0.genre.rawValue }
        )
    }
}
