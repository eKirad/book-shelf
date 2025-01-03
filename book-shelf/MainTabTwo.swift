
import SwiftUI

struct MainTabTwo: View {
    @State private var tabSelection: MainTab = .myBooks
    @Binding var loggedInUser: User?
    @Binding var isGuestUser: Bool
    let isSignoutLoading: Bool
    let handleSignout: () -> Void
    
    var body: some View {
        TabView(selection: $tabSelection) {
            if (isGuestUser) {
                Text("")
                    .tabItem {
                        Label("Logout", systemImage: "arrow.backward.circle")
                    }
                    .tag(MainTab.splashScreen)           
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
                .tag(MainTab.dashboard)
        }
        .onChange(of: tabSelection) { newValue in
            if newValue == MainTab.splashScreen {
                loggedInUser = nil
                isGuestUser = false
            }
        }
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
