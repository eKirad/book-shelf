import SwiftUI

struct LoginSuccess: View {
    @Binding var hasLoggedIn: Bool
    
    var body: some View {
        VStack {
            Text(Texts.loginSuccessful)
                .font(.largeTitle)
                .padding()

            Text(Texts.redirectionNotification)
                .foregroundColor(.gray)
                .padding()
            .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                        hasLoggedIn = true
                    }
                }
        }
    }
}

#Preview {
    @State var hasLoggedIn: Bool = false
    
    return LoginSuccess(hasLoggedIn: $hasLoggedIn)
}
