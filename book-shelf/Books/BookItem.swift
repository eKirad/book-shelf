import SwiftUI

struct BookItem: View {
    var book: Book
    
    var body: some View {
        VStack (alignment: .leading) {
            Text(book.name)
                .foregroundStyle(.primary)
                .font(.caption)
        }
        .padding(.leading, 15)
    }
}

#Preview {
    BookItem(book: ModelData().books[0])
}
