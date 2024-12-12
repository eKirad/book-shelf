import SwiftUI

struct ProfileSummary: View {
    var profile: User
    let isSignoutLoading: Bool
    let handleSignout: () -> Void
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                ProfileSummaryHeader(userName: profile.username)
                Divider()
                ProfileSummaryCard(profile: profile, isSignoutLoading: isSignoutLoading, handleSignout: { handleSignout() })
                Divider()
                ProfileAchievements()
            }
        }
        .padding()
    }
}

#Preview {
    ProfileSummary(
        profile: User(id: UUID(), username: "John", firstName: "Doe", lastName: "johny", email: "test@musterman.com", areNotificationsActive: true),
        isSignoutLoading: false,
        handleSignout: {
            print("")
        }
    )
}
