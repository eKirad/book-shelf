import SwiftUI

struct ProfileSummary: View {
    var profile: Profile
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                Text(profile.username)
                    .bold()
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                
                Text("First name: \(profile.firstName)")
                Text("Last name: \(profile.lastName)")
                Text("Email: \(profile.email)")
                Text("Notifications: \(profile.prefersNotifications ? "On": "Off" )")
                
                Divider()
                
            }
        }
        .padding()
    }
}

#Preview {
    ProfileSummary(profile: Profile.defaultProfile)
}
