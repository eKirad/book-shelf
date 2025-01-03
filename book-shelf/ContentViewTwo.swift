import SwiftUI

struct ContentViewTwo: View {
    @State private var loggedInUser: User? = nil
    @State private var isGuestUser: Bool = false
    
    
    var body: some View {
        NavigationStack {
            let shouldShowMainScreen = loggedInUser != nil || isGuestUser
            
            if (shouldShowMainScreen) {
                MainTabTwo(
                    loggedInUser: $loggedInUser,
                    isGuestUser: $isGuestUser,
                    isSignoutLoading: true,
                    handleSignout: {}
                )
            } else {
                SplashScreenTwo(loggedInUser: $loggedInUser, isGuestUser: $isGuestUser)
            }
        }
    }
}

#Preview {
    ContentViewTwo()
}
