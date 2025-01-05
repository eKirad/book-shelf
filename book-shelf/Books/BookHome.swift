import SwiftUI

struct BookHome: View {
    @Binding var loggedInUser: User?
    @Environment(ModelData.self) var modelData
    @State private var isShowingProfile = false
    
    var body: some View {
        NavigationSplitView() {
            List {
                ForEach(modelData.genres.keys.sorted(), id: \.self) { key in
                    BookRow(genreName: key, books: modelData.genres[key]!)
            }
            .navigationTitle("\(Texts.booksNavigationTitle)")
            .toolbar {
                if loggedInUser != nil {
                    Button {
                        isShowingProfile.toggle()
                    } label: {
                        Label("\(Labels.userProfile)", systemImage: "person.crop.circle")
                    }
                }
            }
            .sheet(isPresented: $isShowingProfile) {
                if (loggedInUser != nil) {
                    ProfileHost(isShowingProfile: $isShowingProfile, loggedInUser: $loggedInUser)
                }

            }
        } detail: {
            Text(Texts.selectBook)
        }
    }
}

#Preview {
    @State var loggedInUser: User? = nil
    
    return BookHome(loggedInUser: $loggedInUser)
    .environment(ModelData())
}
