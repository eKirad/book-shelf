import SwiftUI

struct BookDetail: View {
    var book: Book
    
    var body: some View {
        Text(book.name)
    }
}

#Preview {
    BookDetail(book: ModelData().books[0])
}
