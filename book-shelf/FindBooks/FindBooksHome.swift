import SwiftUI

struct FindBooksHome: View {
    @State private var searchText = ""
    
    private let books = [
        "First book", "Second book", "Third book"
   ]
    
    private var searchResults: Array<String> {
        searchText.isEmpty ? books : books.filter {$0.contains(searchText)}
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    ForEach(books, id: \.self) { book in
                        DisclosureGroup(book) {
                            Text(book)
                        }
                    }
                }
            }
            .searchable(text: $searchText)
        }
    }
}

#Preview {
    FindBooksHome()
}
