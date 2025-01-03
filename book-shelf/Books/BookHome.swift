import SwiftUI

struct BookHome: View {
    @Environment(ModelData.self) var modelData
    @State private var isShowingProfile = false
    var loggedInUser: User?
    let isSignoutLoading: Bool
    let handleSignout: () -> Void
    
    var body: some View {
        NavigationSplitView() {
            List {
                ForEach(modelData.genres.keys.sorted(), id: \.self) { key in
                    BookRow(genreName: key, books: modelData.genres[key]!)
                }
             //.listRowInsets(EdgeInsets())
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
                    ProfileHost(user: loggedInUser!, isSignoutLoading: isSignoutLoading, handleSignout: { handleSignout() })
                        // .environment(modelData)
                }

            }
        } detail: {
            Text(Texts.selectBook)
        }
    }
}

#Preview {
    BookHome(isSignoutLoading: false, handleSignout: {
        print("")
    }).environment(ModelData())
}
