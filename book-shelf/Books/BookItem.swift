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
            HStack {
                Text(book.name)
                    .italic()
                    .foregroundStyle(.primary)
                    .foregroundColor(.black)
                    .font(.caption)
                Label("\(Labels.toggleButton)", systemImage: book.isFavourite ? "star.fill" : "star")
                    .labelStyle(.iconOnly)
                    .foregroundStyle(book.isFavourite ? .yellow : .gray)
            }
        }
        .padding(.horizontal, 10)
    }
}

#Preview {
    BookItem(book: ModelData().books[1])
}
