import SwiftUI

struct SplashScreenTwo: View {
    @Binding var loggedInUser: User?
    @Binding var isGuestUser: Bool
    
    @State private var isLoading: Bool = false
    @State private var isSignoutLoading: Bool = false
    @State private var navigateToHome = false
   
    private func handleLogin(userData: User) {
        isLoading = true
        // TODO: Mock API call
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                loggedInUser =                         User(id: UUID(), username: "John", firstName: "Doe", lastName: "johny", email: "test@musterman.com", areNotificationsActive: true)
            isLoading = false
            navigateToHome = true
        }
    }
    
    var body: some View {
        NavigationView {
            VStack(alignment: .center) {
                VStack{
                    NavigationLink(
                        destination: MainView(
                            loggedInUser: $loggedInUser,
                            isGuestUser: $isGuestUser
                        )
                        .navigationBarBackButtonHidden(true),
                        isActive: $navigateToHome,
                        label: { EmptyView() }
                    )
                    NavigationLink(destination:
                        Login(
                            isLoginLoading: isLoading,
                            handleLogin: { userData in handleLogin(userData: userData) }
                        )
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
                        isGuestUser = true
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

#Preview {
    @State var loggedInUser: User? = nil
    @State var isGuestUser: Bool = true
    
    return SplashScreenTwo(loggedInUser: $loggedInUser, isGuestUser: $isGuestUser)
}
