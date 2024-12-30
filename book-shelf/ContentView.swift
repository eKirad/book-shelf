import SwiftUI

struct ContentView: View {
    @State private var tabSelection: MainTab = .myBooks
    var user: User? = nil
    let isSignoutLoading: Bool
    let handleSignout: () -> Void

    var body: some View {
        TabView(selection: $tabSelection) {
            // TODO: Fix
            SplashScreen()
                .tabItem { Label(Labels.backToSplashScreen, systemImage: "person.circle.fill") }
                .tag(MainTab.splashScreen)
            BookHome(
                loggedInUser: user,
                isSignoutLoading: isSignoutLoading,
                handleSignout: { handleSignout() } 
            )
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
    ContentView(isSignoutLoading: false,
        handleSignout: {
        print("")
    })
        .environment(ModelData())
}
