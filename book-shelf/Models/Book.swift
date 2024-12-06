import SwiftUI
import Foundation

struct Book: Identifiable {
    var id: Int
    var name: String
    var description: String
    var genre: BookGenre
    var coverImageName: String
    var coverImage: Image {
        Image(coverImageName)
    }
    var authorName: String
}
