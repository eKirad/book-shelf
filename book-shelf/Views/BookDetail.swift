import SwiftUI

struct BookDetail: View {
    var book: Book
    
    var body: some View {
        VStack {
            CircleImage(image: book.coverImage)
                .offset(y: -130)
                .padding(.bottom, -150)
           
            VStack (alignment: .leading) {
                Text(book.name)
                    .font(.title)
                
                HStack {
                    Text(book.genre.rawValue)
                    Spacer()
                    Text(book.authorName)
                }
                .font(.subheadline)
                .foregroundStyle(.secondary)
                
                Divider()
               
                Text("About \(book.name)")
                    .font(.title2)
                Text(book.description)
            }
            .padding()
        }
        .padding()
        .navigationTitle(book.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    BookDetail(book: ModelData().books[1])
}
