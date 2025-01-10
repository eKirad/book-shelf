import SwiftUI

struct ProfileSummaryCard: View {
    @Binding var isShowingProfile: Bool
    @Binding var loggedInUser: User?
    @Binding var isEditDisabled: Bool
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
    
    var settingsView: some View {
        VStack {
            HStack {
                HStack (spacing: 8) {
                    Image(systemName: "bell.fill")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .foregroundColor(.gray)
                        .frame(width: 20, height: 20)
                     Text((Texts.notifications))
                }
                .padding()
                Spacer()
                Toggle(isOn: Binding(
                   get: { loggedInUser?.areNotificationsActive ?? false },
                   set: { notificationsToggleValue in
                       if loggedInUser != nil {
                           loggedInUser?.areNotificationsActive = notificationsToggleValue
                       }
                    }
                )) {

                }
                .disabled(loggedInUser == nil)
                .padding(.horizontal)
            }
            
            HStack () {
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
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
           }
            .padding(.horizontal)
        }
    }
    
    var profileForm: some View {
        NavigationView {
            if let user = loggedInUser {
                Form {
                    Section(header: Text(Texts.userInformation)) {
                        HStack() {
                            Image(systemName: "person.fill")
                                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                                .foregroundColor(.gray)
                            LabeledContent("\(Labels.username):") {
                                TextField(Texts.username, text: Binding(
                                get: { user.username },
                                set: { loggedInUser?.username = $0 }
                            ))
                            .cornerRadius(8)
                            .foregroundColor(isEditDisabled ? .gray : .primary)
                            .disabled(isEditDisabled)
                            }
                        }
                        
                        HStack {
                            Image(systemName: "person.fill")
                                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                                .foregroundColor(.gray)
                            LabeledContent("\(Labels.firstName):") {
                                TextField(Texts.firstName, text: Binding(
                                    get: { user.firstName},
                                    set: { loggedInUser?.firstName = $0 }
                                ))
                            .cornerRadius(8)
                            .foregroundColor(isEditDisabled ? .gray : .primary)
                            .disabled(isEditDisabled)
                            }
                        }
                        
                        HStack {
                            Image(systemName: "person.fill")
                                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                                .foregroundColor(.gray)
                            LabeledContent("\(Labels.lastName):") {
                                TextField(Texts.lastName, text: Binding(
                                    get: { user.lastName},
                                    set: { loggedInUser?.lastName = $0 }
                                ))
                                .cornerRadius(8)
                                .foregroundColor(isEditDisabled ? .gray : .primary)
                                .disabled(isEditDisabled)
                            }
                        }
                      
                        HStack {
                            Image(systemName: "envelope.fill")
                                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                                .foregroundColor(.gray)
                            LabeledContent("\(Labels.email):") {
                                TextField(Texts.email, text: Binding(
                                    get: { user.email },
                                    set: { loggedInUser?.email = $0 }
                            ))
                            .cornerRadius(8)
                            .foregroundColor(isEditDisabled ? .gray : .primary)
                            .disabled(isEditDisabled)
                            }
                        }
                    }
                }
            }
        }
    }
    
    var body: some View {
        profileForm
        settingsView
    }
}

#Preview {
    @State var loggedInUser: User? = nil
    @State var isShowingProfile: Bool = false
    @State var isEditDisabled: Bool = true
    
    return ProfileSummaryCard(isShowingProfile: $isShowingProfile, loggedInUser: $loggedInUser, isEditDisabled: $isEditDisabled)
}
