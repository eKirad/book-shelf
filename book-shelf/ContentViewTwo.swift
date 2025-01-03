import SwiftUI

struct ContentViewTwo: View {
    @State private var isLoggedIn: Bool = false

    var body: some View {
        NavigationStack {
            if (isLoggedIn) {
                MainTabTwo(isLoggedIn: $isLoggedIn, isSignoutLoading: true, handleSignout: {})
            } else {
                SplashScreenTwo(isLoggedIn: $isLoggedIn)
            }
        }
    }
}

#Preview {
    ContentViewTwo()
}
