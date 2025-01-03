
import SwiftUI

struct MainTabTwo: View {
    @Binding var isLoggedIn: Bool
    @State private var tabSelection: MainTab = .myBooks
    var user: User? = nil
    let isSignoutLoading: Bool
    let handleSignout: () -> Void
    
    var body: some View {
        TabView(selection: $tabSelection) {
            Text("Logging out...")
                .tabItem {
                    Label("Logout", systemImage: "arrow.backward.circle")
                }
                .tag(MainTab.splashScreen) // Tag for Logout tab

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
        .onChange(of: tabSelection) { newValue in
            if newValue == MainTab.splashScreen { // Detect when Logout tab is selected
                isLoggedIn = false // Log the user out
            }
        }
    
.tag(MainTab.dashboard)
    }
}

#Preview {
    MainTabTwo(
        isLoggedIn: .constant(true), 
        isSignoutLoading: true, handleSignout: {}
        )
    }
