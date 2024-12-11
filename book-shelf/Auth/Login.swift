import SwiftUI

struct Login: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var shouldRememberUser: Bool = false
    @State private var isShowingAlert: Bool = false
    @State private var loggedInUser: User? = nil
    @State private var isLoading: Bool = false
    
    private func handleLogin() {
        isLoading = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            loggedInUser = User(id: UUID(), username: username, firstName: "Test", lastName: "Max")
            isLoading = false
        }
    }
    
    var loginForm: some View {
        Form {
            Section(header: Text(Texts.loginCredentials)) {
                TextField(Texts.username, text: $username)
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                
                SecureField(Texts.password, text: $password)
            }
            
            Section {
                Toggle(Texts.rememberMe, isOn: $shouldRememberUser)
            }
            
            Section {
                Button(action: {
                    handleLogin()
                }) {
                    HStack {
                        isLoading ? AnyView(
                            ProgressView()
                                .progressViewStyle(CircularProgressViewStyle())
                                .foregroundColor(.white)
                        )
                        : AnyView(Text(Texts.login))
                    }
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.cyan)
                    .cornerRadius(16)
                }
                .disabled(isLoading)
            }
            .padding(.vertical, 10)
            .padding(.horizontal, 16)
            .listRowBackground(Color.clear)

        }
        .navigationTitle(Texts.login)
    }
    
    var body: some View {
        Group {
            if isLoggedIn, let user = loggedInUser {
                ContentView(user: user)
            } else {
                loginForm
            }
        }
    }
}

#Preview {
    Login()
}
