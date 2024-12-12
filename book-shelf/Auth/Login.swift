import SwiftUI

struct Login: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var shouldRememberUser: Bool = false
    @State private var isShowingAlert: Bool = false
    @State private var usernameError: String? = nil
    @State private var passwordError: String? = nil
    
    let isLoginLoading: Bool
    var loggedInUser: User? = nil
    let handleLogin: (_ userData: User) -> Void

    private func handleSubmit() {
        validateFormFields()
        
        if (isFormValid()) {
            let userData: User = User(
                id: UUID(),
                username: username,
                firstName: "Test",
                lastName: "Max",
                email: "test@musterman.com", a
                reNotificationsActive: true
            )
            
            handleLogin(userData)
        }
    }
    
    private func isFormValid() -> Bool {
        let isUsernameFieldValid = isUsernameValid()
        let isPasswordFieldValid = isPasswordValid()
        
        return isUsernameFieldValid && isPasswordFieldValid
    }
    
    private func isUsernameValid() -> Bool {
        return ((usernameError?.isEmpty) == nil)
    }
    
    private func isPasswordValid() -> Bool {
        return ((passwordError?.isEmpty) == nil)
    }
    
    private func validateFormFields() {
        validateUsername()
        validatePassword()
    }
    
    private func validateUsername() {
        if (username.isEmpty) {
            usernameError = Texts.emptyUsernameValidationError
        } else {
            usernameError = nil
        }
    }
    
    private func validatePassword() {
        if (password.isEmpty) {
            passwordError = Texts.emptyPasswordValidationError
        } else {
            passwordError = nil
        }
    }
    
    var loginForm: some View {
        Form {
            Section(header: Text(Texts.loginCredentials)) {
                TextField(Texts.username, text: $username)
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                    .onChange(of: username) { _ in
                        usernameError = nil
                    }
               
                if (usernameError != nil) {
                    HStack {
                        Image(systemName: "exclamationmark.triangle.fill")
                            .foregroundColor(.red)
                        Text(Texts.emptyUsernameValidationError)
                            .foregroundColor(.red)
                    }
                }
                
                SecureField(Texts.password, text: $password)
                    .onChange(of: password) { _ in
                        passwordError = nil
                    }
                
                if (passwordError != nil) {
                    HStack {
                        Image(systemName: "exclamationmark.triangle.fill")
                                .foregroundColor(.red)
                        Text(Texts.emptyPasswordValidationError)
                            .foregroundColor(.red)
                    }
                }
            }
            
            Section {
                Toggle(Texts.rememberMe, isOn: $shouldRememberUser)
            }
            
            Section {
                Button(action: {
                    handleSubmit()
                }) {
                    HStack {
                       isLoginLoading
                            ? AnyView(
                                    ProgressView()
                                        .progressViewStyle(CircularProgressViewStyle())
                                        .foregroundColor(.white)
                            )
                            : AnyView(Text(Texts.login))
                    }
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding()
                    .foregroundColor(.white)
                    .bold()
                    .background(Color.cyan)
                    .cornerRadius(16)
                }
                .disabled(isLoginLoading)
            }
            .padding(.vertical, 10)
            .padding(.horizontal, 16)
            .listRowBackground(Color.clear)
        }
        .navigationTitle(Texts.login)
    }
    
    var body: some View {
        loginForm
    }
}

#Preview {
    Login(isLoginLoading: false) { userData in
        print("ok")
    }
}
