import SwiftUI

struct Login: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var shouldRememberUser: Bool = false
    @State private var isShowingAlert: Bool = false
    
    var body: some View {
        Form {
            Section(header: Text("Login Credentials")) {
                TextField("username", text: $username)
                    .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                    .disableAutocorrection(true)
                
                SecureField("Password", text: $password)
            }
            
            Section {
                Toggle("Remember me", isOn: $shouldRememberUser)
            }
            
            Section {
                Button(action: {
                    handleLogin()
                }) {
                    Text("Login")
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.cyan)
                        .cornerRadius(8)
                }
                .listRowBackground(Color.clear)
            }
            .padding(.vertical, 10)
            .padding(.horizontal, 16)
            .listRowBackground(Color.clear)
        }
        .navigationTitle("Login")
    }
    
    private func handleLogin() {
        isShowingAlert = true
    }
}

#Preview {
    Login()
}
