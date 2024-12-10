import SwiftUI

struct SplashScreen: View {
   @State private var isGuestUsage = false
    
    var body: some View {
        if (isGuestUsage) {
            ContentView()
        } else {
            NavigationView {
                VStack(alignment: .center) {
                    NavigationLink(destination: Login()) {
                        Text(Texts.login)
                            .bold()
                            .padding()
                            .background(Color.cyan)
                            .foregroundColor(.white)
                            .cornerRadius(16)
                    }
                
                    NavigationLink(destination: Login()) {
                        Text(Texts.signUp)
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
            }    
        }
    }
}

#Preview {
    SplashScreen()
}
