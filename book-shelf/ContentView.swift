import SwiftUI

struct ContentView: View {
    @State private var loggedInUser: User? = nil
    @State private var isGuestUser: Bool = false
    
    var body: some View {
        NavigationStack {
            let shouldShowMainScreen = loggedInUser != nil || isGuestUser
            
            if (shouldShowMainScreen) {
                MainView(loggedInUser: $loggedInUser, isGuestUser: $isGuestUser)
            } else {
                SplashScreen(loggedInUser: $loggedInUser, isGuestUser: $isGuestUser)
            }
        }
    }
}

#Preview {
    ContentView()
}
