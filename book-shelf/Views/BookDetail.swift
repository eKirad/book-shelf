import SwiftUI

struct BookDetail: View {
    @Environment(ModelData.self) var modelData
    var book: Book
    
    var bookIndex: Int {
        modelData.books.firstIndex(where: {$0.id == book.id})!
    }
    
    var body: some View {
        @Bindable var modelData = modelData
        
        VStack {
            CircleImage(image: book.coverImage)
                .offset(y: -130)
                .padding(.bottom, -150)
           
            VStack (alignment: .leading) {
                HStack {
                    Text(book.name)
                        .italic()
                        .font(.title)
                    FavouritesButton(isSet: $modelData.books[bookIndex].isFavourite)
                }
                
                HStack {
                    Text(book.genre.rawValue)
                    Spacer()
                    Text(book.authorName)
                }
                .font(.subheadline)
                .foregroundStyle(.secondary)
                
                Divider()
              
                HStack {
                    Text("\(Texts.about)")
                        .font(.title2)
                    Text("\(book.name)")
                        .italic()
                        .font(.title2)
                }
                
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
    let modelData = ModelData()
    return BookDetail(book: ModelData().books[1])
        .environment(modelData)
}
