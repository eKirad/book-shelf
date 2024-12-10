import SwiftUI

struct Signup: View {
    @State private var username: String = ""
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var password: String = ""
    @State private var shouldRememberUser: Bool = false
    
    private func handleSignUp() {
        // TODO: Missing implementation
    }
    
    var body: some View {
        Form {
            Section(header: Text(Texts.userData)) {
                TextField(Texts.firstName, text: $firstName)
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                
                TextField(Texts.lastName, text: $lastName)
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
            }
            
            Section(header: Text(Texts.loginCredentials)) {
                TextField(Texts.username, text: $username)
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                
                SecureField(Texts.password, text: $password)
                SecureField(Texts.repeatPassword, text: $password)
            }
            
            Section {
                Button(action: {
                    handleSignUp()
                }) {
                    Text(Texts.signUp)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.green)
                        .cornerRadius(8)
                }
            }
            .padding(.vertical, 10)
            .padding(.horizontal, 16)
            .listRowBackground(Color.clear)

        }
        .navigationTitle(Texts.signUp)
    }
}

#Preview {
    Signup()
}
