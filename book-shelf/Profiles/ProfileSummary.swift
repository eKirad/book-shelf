import SwiftUI

struct ProfileSummary: View {
    @Binding var isShowingProfile: Bool
    @Binding var loggedInUser: User?
    @State var isSignoutLoading: Bool = false
    
    private func handleSignout() {
        isSignoutLoading = true
        // TODO: Mock API call
        if (loggedInUser != nil) {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                loggedInUser = nil
                isSignoutLoading = false
                isShowingProfile = false
            }
        }
    }   
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                // ProfileSummaryHeader(userName: profile.username)
                Divider()
                if (loggedInUser == nil) {
                    Text("nill")
                }
//                ProfileSummaryCard(loggedInUser: $loggedInUser)
                if (loggedInUser != nil) {
                    HStack {
                        Image(systemName: "person.fill")
                            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                            .foregroundColor(.gray)
                        Text("\(Texts.fullName): \(loggedInUser!.firstName) \(loggedInUser!.lastName)")
                    }
                   
                     HStack {
                        Image(systemName: "envelope.fill")
                            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                            .foregroundColor(.gray)
                         Text("\(loggedInUser!.email)")
                    }
                   
                     HStack {
                        Image(systemName: "bell.fill")
                            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                            .foregroundColor(.gray)
                         Text("\(Texts.notifications): \(loggedInUser!.areNotificationsActive ? "\(Texts.notificationsOn)": "\(Texts.notificationsOff)")")
                    }
                
                    HStack {
                        Button(action: {
                            handleSignout()
                        }) {
                            isSignoutLoading
                              ? AnyView(ProgressView()
                                    .font(.title)
                                    .progressViewStyle(CircularProgressViewStyle())
                              )
                              : AnyView(HStack {
                                  Image(systemName: "arrow.right.circle.fill")
                                      .font(.title)
                                      .foregroundColor(.gray)
                              })
                            
                            Text(Texts.signOut)
                                .foregroundColor(.black)
                        }
                   }
                }
                Divider()
                ProfileAchievements()
            }
        }
        .padding()
    }
}

#Preview {
    @State var loggedInUser: User? = nil
    @State var isShowingProfile: Bool = false
    
    return ProfileSummary(isShowingProfile: $isShowingProfile, loggedInUser: $loggedInUser)
}
