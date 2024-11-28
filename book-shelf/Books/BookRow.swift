import SwiftUI

struct BookRow: View {
    var genreName: String
    var books: Array<Book>
    
    var body: some View {
        VStack (alignment: .leading) {
            Text("Some text")
                .font(.headline)
                .padding(.leading, 15)
                .padding(.top, 5)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 0) {
                    ForEach(books) { book in
                        NavigationLink() {
                            BookDetail()
                        } label: {
                            Text("Nice book")
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
        books: Array(books.prefix(3))
    )
}
