import SwiftUI

struct BookRow: View {
    var genreName: String
    var books: Array<Book>
    @State private var showFavouritesOnly = false
    
    var filteredBooks: Array<Book> {
       books.filter { book in
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
                    Text("Favourites only")
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
                    ForEach(filteredBooks) { book in
                        NavigationLink() {
                            BookDetail(book: book)
                        } label: {
                            BookItem(book: book)
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
