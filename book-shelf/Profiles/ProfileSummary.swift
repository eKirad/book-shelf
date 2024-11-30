import SwiftUI

struct ProfileSummary: View {
    var profile: Profile
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                ProfileSummaryHeader(userName: profile.username)
                ProfileSummaryCard(profile: profile)

                Divider()
            }
        }
        .padding()
    }
}

#Preview {
    ProfileSummary(profile: Profile.defaultProfile)
}
