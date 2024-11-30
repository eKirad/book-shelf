import SwiftUI

struct BookHome: View {
    @Environment(ModelData.self) var modelData
    @State private var isShowingProfile = false
    
    var body: some View {
        NavigationSplitView() {
            List {
                ForEach(modelData.genres.keys.sorted(), id: \.self) { key in
                    BookRow(genreName: key, books: modelData.genres[key]!)
                }
                .listRowInsets(EdgeInsets())
            }
            .navigationTitle("\(Texts.booksNavigationTitle)")
            .toolbar {
                Button {
                    isShowingProfile.toggle()
                } label: {
                    Label("\(Labels.userProfile)", systemImage: "person.crop.circle")
                }
            }
            .sheet(isPresented: $isShowingProfile) {
                ProfileHost()
                    .environment(modelData)
            }
        } detail: {
            Text(Texts.selectBook)
        }
    }
}

#Preview {
    BookHome().environment(ModelData())
}
