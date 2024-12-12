import SwiftUI

struct ContentView: View {
    @State private var tabSelection: MainTab = .myBooks
    var user: User? = nil
    let handleSignout: () -> Void
    
    var body: some View {
        TabView(selection: $tabSelection) {
            BookHome(loggedInUser: user, handleSignout: { handleSignout() } )
                .tabItem { Label(Labels.myBooks, systemImage: "book") }
                .tag(MainTab.myBooks)
             FindBooksHome()
                .tabItem { Label(Labels.findBooks, systemImage: "magnifyingglass") }
                .tag(MainTab.search)
            DashboardHome()
                .tabItem { Label(Labels.dashboard, systemImage: "star") }
                .tag(MainTab.dashboard)
        }
    }
}

#Preview {
    ContentView(handleSignout: {
        print("Sign out")
    })
        .environment(ModelData())
}
