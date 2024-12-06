import SwiftUI

struct BookRow: View {
    var genreName: String
    var books: Array<Book>
    
    var body: some View {
        VStack (alignment: .leading) {
            Text(genreName)
                .font(.headline)
                .padding(.leading, 15)
                .padding(.top, 5)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 5) {
                    ForEach(books) { book in
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
