import SwiftUI

struct BookItem: View {
    var book: Book
    
    var body: some View {
        VStack (alignment: .leading) {
            book.coverImage
                .renderingMode(.original)
                .resizable()
                .scaledToFit()
                .cornerRadius(5)
                .shadow(radius: 7)
            Text(book.name)
                .foregroundStyle(.primary)
                .font(.caption)
        }
        .padding(.horizontal, 10)
    }
}

#Preview {
    BookItem(book: ModelData().books[1])
}
