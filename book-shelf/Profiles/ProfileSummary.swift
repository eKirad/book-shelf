import SwiftUI

struct ProfileSummary: View {
    var profile: Profile
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                HStack {
                    Text(profile.username)
                        .bold()
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    Spacer()
                    
                    Button(action: {
                        // TODO: Implement edit logic
                        print("Edit button tapped")
                    }) {
                        HStack {
                            Text("Edit")
                                .foregroundColor(.cyan)
                            Image(systemName: "square.and.pencil")
                                .foregroundColor(.cyan)
                        }
                    }
                }
                .font(.headline)
               
                HStack {
                    Image(systemName: "person")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .foregroundColor(.cyan)
                    Text("\(Texts.firstName): \(profile.firstName)")
                }
               
                HStack {
                    Image(systemName: "person")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .foregroundColor(.cyan)
                    Text("\(Texts.lastName): \(profile.lastName)")
                }
                
                 HStack {
                    Image(systemName: "envelope")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .foregroundColor(.cyan)
                     Text("\(profile.email)")
                }
               
                 HStack {
                    Image(systemName: "bell")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .foregroundColor(.cyan)
                     Text("\(Texts.notifications): \(profile.prefersNotifications ? "\(Texts.notificationsOn)": "\(Texts.notificationsOff)")")
                }
               
                Divider()
            }
        }
        .padding()
    }
}

#Preview {
    ProfileSummary(profile: Profile.defaultProfile)
}
