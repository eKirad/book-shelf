import SwiftUI

struct ProfileSummary: View {
    var profile: Profile
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                ProfileSummaryHeader(userName: profile.username)
                Divider()
                ProfileSummaryCard(profile: profile)
                Divider()
                ProfileAchievements()
            }
        }
        .padding()
    }
}

#Preview {
    ProfileSummary(profile: Profile.defaultProfile)
}
