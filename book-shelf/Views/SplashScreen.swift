import SwiftUI

struct SplashScreen: View {
   @State private var isGuestUsage = false

    var body: some View {
        if (isGuestUsage) {
            ContentView()
        } else {
            NavigationView {
                VStack(alignment: .center) {
                    VStack{
                        NavigationLink(destination: Login()) {
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
