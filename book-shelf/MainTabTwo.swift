
import SwiftUI

struct MainTabTwo: View {
    @State private var tabSelection: MainTab = .myBooks
    @Binding var loggedInUser: User? // Passed from ContentView to allow logging out
    @Binding var isGuestUser: Bool
    
    
    let isSignoutLoading: Bool
    let handleSignout: () -> Void
    
    var body: some View {
        TabView(selection: $tabSelection) {
            if (isGuestUser) {
                Text("Logging out...")
                    .tabItem {
                        Label("Logout", systemImage: "arrow.backward.circle")
                    }
                    .tag(MainTab.splashScreen) // Tag for Logout tab
            }
            
            BookHome(
                loggedInUser: loggedInUser,
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
        .onChange(of: tabSelection) { newValue in
            if newValue == MainTab.splashScreen { // Detect when Logout tab is selected
                loggedInUser = nil
                isGuestUser = false
            }
        }
    
.tag(MainTab.dashboard)
    }
}

#Preview {
    @State var loggedInUser: User? = nil
    @State var isGuestUser: Bool = true
    
    return MainTabTwo(
        loggedInUser: $loggedInUser,
        isGuestUser: $isGuestUser,
        isSignoutLoading: true, handleSignout: {}
        )
    }
