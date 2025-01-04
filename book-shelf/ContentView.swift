import SwiftUI

struct ContentView: View {
    @State private var loggedInUser: User? = nil
    @State private var isGuestUser: Bool = false
    @State private var hasLoggedIn: Bool = false
    
    var body: some View {
        NavigationView {
            let shouldShowMainScreen = loggedInUser != nil || isGuestUser
            
            if (shouldShowMainScreen && hasLoggedIn) {
                MainView(loggedInUser: $loggedInUser, isGuestUser: $isGuestUser)
            } else {
                SplashScreen(loggedInUser: $loggedInUser, isGuestUser: $isGuestUser, hasLoggedIn: $hasLoggedIn)
            }
        }
    }
}

#Preview {
    ContentView()
}
