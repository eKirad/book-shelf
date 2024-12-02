import SwiftUI

struct ProfileSummaryCard: View {
    var profile: Profile
    
    var body: some View {
            HStack {
                Image(systemName: "person.fill")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .foregroundColor(.gray)
                Text("\(Texts.fullName): \(profile.firstName) \(profile.lastName)")
            }
           
             HStack {
                Image(systemName: "envelope.fill")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .foregroundColor(.gray)
                 Text("\(profile.email)")
            }
           
             HStack {
                Image(systemName: "bell.fill")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .foregroundColor(.gray)
                 Text("\(Texts.notifications): \(profile.prefersNotifications ? "\(Texts.notificationsOn)": "\(Texts.notificationsOff)")")
            }
        }
}

#Preview {
    ProfileSummaryCard(profile: Profile.defaultProfile)
}
