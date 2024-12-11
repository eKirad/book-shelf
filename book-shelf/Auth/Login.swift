import SwiftUI

struct Login: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var shouldRememberUser: Bool = false
    @State private var isShowingAlert: Bool = false
    @State private var loggedInUser: User? = nil
    
    private func handleLogin() {
        loggedInUser = User(id: UUID(), username: username, firstName: "Test", lastName: "Max")
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
                    Text(Texts.login)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.cyan)
                        .cornerRadius(8)
                }
            }
            .padding(.vertical, 10)
            .padding(.horizontal, 16)
            .listRowBackground(Color.clear)

        }
        .navigationTitle(Texts.login)
    }
    
    var body: some View {
        Group {
            if let user = loggedInUser {
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
