import SwiftUI

struct BookRow: View {
    var genreName: String
    var books: Array<Book>
    @State private var showFavouritesOnly = false
    
    var filteredBooks: Array<Book> {
        if (!showFavouritesOnly) {
            return books
        }
        
       return books.filter { book in
            (!showFavouritesOnly || book.isFavourite)
        }
    }
    
    var body: some View {
        VStack (alignment: .leading) {
            HStack {
                Text(genreName)
                    .font(.headline)
                Spacer()
                HStack {
                    Text("\(Texts.favouritesOnly)")
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                    Toggle("", isOn: $showFavouritesOnly)
                        .labelsHidden()
                }
            }
            .padding(.leading, 15)
            .padding(.top, 5)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 5) {
                    if (filteredBooks.isEmpty && showFavouritesOnly == true) {
                        VStack {
                            Image(systemName: "exclamationmark.triangle.fill")
                                .font(.system(size: 50))
                                .foregroundColor(.gray)
                            Text("\(Texts.noFavourites)")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                    } else {
                        ForEach(filteredBooks) { book in
                            NavigationLink() {
                                BookDetail(book: book)
                            } label: {
                                BookItem(book: book)
                            }
                        }
                    }
                }
                .frame(height: 185)
            }
        }
    }
}

#Preview {
    let books = ModelData().books
    return BookRow(
        genreName: books[0].genre.rawValue,
        books: Array(books.prefix(4))
    )
}
