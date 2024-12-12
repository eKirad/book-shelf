import SwiftUI

struct SplashScreen: View {
    @State private var isGuestUsage = false
    @State private var loggedInUser: User? = nil
    @State private var isLoading: Bool = false
    
    private func handleLogin(userData: User) {
        isLoading = true
        // TODO: Mock API call
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            loggedInUser = userData
            isLoading = false
        }
    }
    
    private func handleSignout() {
        // TODO: Mock API call
        if (loggedInUser != nil) {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                loggedInUser = nil
            }
        }
    }
    
    var body: some View {
        if (isGuestUsage) {
            ContentView(handleSignout: {handleSignout()})
        } else if (loggedInUser != nil) {
            ContentView(user: loggedInUser!, handleSignout:{handleSignout()})
        } else {
            NavigationView {
                VStack(alignment: .center) {
                    VStack{
                        NavigationLink(destination: 
                            Login(
                                isLoginLoading: isLoading,
                                handleLogin: { userData in handleLogin(userData: userData) })
                        ) {
                            Text(Texts.login)
                                .frame(width: 200, alignment: .center)
                                .bold()
                                .padding()
                                .background(Color.cyan)
                                .foregroundColor(.white)
                                .cornerRadius(16)
                        }
                        
                        NavigationLink(destination: Signup()) {
                            Text(Texts.signUp)
                                .frame(width: 200, alignment: .center)
                                .bold()
                                .padding()
                                .background(Color.green)
                                .foregroundColor(.white)
                                .cornerRadius(16)
                        }
                        
                        Button(Texts.useAsGuest) {
                            isGuestUsage.toggle()
                        }
                        .padding()
                    }
                    .padding(.vertical, 10)
                    .padding(.horizontal, 16)
                    .listRowBackground(Color.clear)
                }
            }    
        }
    }
}

#Preview {
    SplashScreen()
}
