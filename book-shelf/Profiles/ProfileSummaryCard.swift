import SwiftUI

struct ProfileSummaryCard: View {
    @Binding var isShowingProfile: Bool
    @Binding var loggedInUser: User?
    @State var isSignoutLoading: Bool = false
    @Binding var isEditDisabled: Bool
    
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
        NavigationView {
            if let user = loggedInUser {
                Form {
                    Section(header: Text("User Information")) {
                        HStack() {
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
                            LabeledContent("\(Labels.firstName):") {
                            TextField("First name", text: Binding(
                                get: { user.firstName},
                                set: { loggedInUser?.firstName = $0 }
                            ))
                            .cornerRadius(8)
                            .foregroundColor(isEditDisabled ? .gray : .primary)
                            .disabled(isEditDisabled)
                            }
                        }
                        
                        HStack {
                            LabeledContent("\(Labels.lastName):") {
                                TextField("Last name", text: Binding(
                                    get: { user.lastName},
                                    set: { loggedInUser?.lastName = $0 }
                                ))
                                .cornerRadius(8)
                                .foregroundColor(isEditDisabled ? .gray : .primary)
                                .disabled(isEditDisabled)
                            }
                        }
                      
                        HStack {
                            LabeledContent("\(Labels.email):") {
                            TextField("Email", text: Binding(
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
        //        HStack {
        //            Image(systemName: "person.fill")
        //                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
        //                .foregroundColor(.gray)
        //            Text("\(Texts.fullName): \(loggedInUser?.firstName ?? Texts.nA) \(loggedInUser?.lastName ?? Texts.nA)")
        //        }
        //
        //         HStack {
        //            Image(systemName: "envelope.fill")
        //                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
        //                .foregroundColor(.gray)
        //             Text("\(loggedInUser?.email ?? Texts.nA)")
        //        }
        //
        //         HStack {
        //            Image(systemName: "bell.fill")
        //                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
        //                .foregroundColor(.gray)
        //             Toggle(isOn: Binding(
        //                get: { loggedInUser?.areNotificationsActive ?? false },
        //                set: { notificationsToggleValue in
        //                    if loggedInUser != nil {
        //                        loggedInUser?.areNotificationsActive = notificationsToggleValue
        //                    }
        //                 }
        //             )) {
        //                 Text("\(Texts.notifications): \(loggedInUser?.areNotificationsActive ?? false ? "\(Texts.notificationsOn)": "\(Texts.notificationsOff)")")
        //             }
        //             .disabled(loggedInUser == nil)
        //             .padding(.horizontal)
        //         }
        //
        //        HStack {
        //            Button(action: {
        //                handleSignout()
        //            }) {
        //                isSignoutLoading
        //                  ? AnyView(ProgressView()
        //                        .font(.title)
        //                        .progressViewStyle(CircularProgressViewStyle())
        //                  )
        //                  : AnyView(HStack {
        //                      Image(systemName: "arrow.right.circle.fill")
        //                          .font(.title)
        //                          .foregroundColor(.gray)
        //                  })
        //
        //                Text(Texts.signOut)
        //                    .foregroundColor(.black)
        //            }
        //       }
        //    }
    }
}

#Preview {
    @State var loggedInUser: User? = nil
    @State var isShowingProfile: Bool = false
    @State var isEditDisabled: Bool = true
    
    return ProfileSummaryCard(isShowingProfile: $isShowingProfile, loggedInUser: $loggedInUser, isEditDisabled: $isEditDisabled)
}
