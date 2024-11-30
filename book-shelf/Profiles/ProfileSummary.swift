import SwiftUI

struct ProfileSummary: View {
    var profile: Profile
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                Text(profile.username)
                    .bold()
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                Text("\(Texts.firstName): \(profile.firstName)")
                Text("\(Texts.lastName): \(profile.lastName)")
                Text("\(Texts.email): \(profile.email)")
                Text("\(Texts.notifications): \(profile.prefersNotifications ? "On": "Off" )")
                Divider()
                
            }
        }
        .padding()
    }
}

#Preview {
    ProfileSummary(profile: Profile.defaultProfile)
}
