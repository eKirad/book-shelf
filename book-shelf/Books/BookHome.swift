import SwiftUI

struct BookHome: View {
    @Environment(ModelData.self) var modelData
    
    var body: some View {
        NavigationSplitView() {
            List {
                ForEach(modelData.genres.keys.sorted(), id: \.self) { key in
                    BookRow(genreName: key, books: modelData.genres[key]!)
                }
                .listRowInsets(EdgeInsets())
            }
        } detail: {
            Text("Select a Landmark")
        }
    }
}

#Preview {
    BookHome().environment(ModelData())
}
