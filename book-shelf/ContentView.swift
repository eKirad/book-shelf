import SwiftUI

struct ContentView: View {
    @State private var isLoggedIn: Bool = true
    var user: User? = nil
    let isSignoutLoading: Bool
    let handleSignout: () -> Void
    
    struct MainTabView: View {
        @State private var tabSelection: MainTab = .myBooks
        @Binding var isLoggedIn: Bool
        var user: User? = nil
        let isSignoutLoading: Bool
        let handleSignout: () -> Void

        var body: some View {
            TabView(selection: $tabSelection) {
                if (user == nil) {
                    Button {
                        isLoggedIn = false
                    } label: {
                        Text("okk")
                    }
                    .tabItem { Label(Labels.backToSplashScreen, systemImage: "person.circle.fill") }
                    .tag(MainTab.splashScreen)
                }

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
                  
        }
        
  .tag(MainTab.dashboard)
        }
    }
    

    var body: some View {
        if (isLoggedIn) {
            MainTabView(isLoggedIn: $isLoggedIn, user: user, isSignoutLoading: isSignoutLoading, handleSignout: handleSignout)
        } else {
            SplashScreen()
        }
       
    }
}

#Preview {
    ContentView(
        isSignoutLoading: false,
        handleSignout: {
        print("")
    }
    )
        .environment(ModelData())
}
