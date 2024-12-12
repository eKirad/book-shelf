import SwiftUI

struct ProfileHost: View {
   // @State private var draftProfile = Profile.defaultProfile
    var user: User
    let isSignoutLoading: Bool
    let handleSignout: () -> Void
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            ProfileSummary(profile: user, isSignoutLoading: isSignoutLoading, handleSignout: { handleSignout() })
        }
        .padding()
    }
}

#Preview {
    ProfileHost(
        user: User(id: UUID(), username: "John", firstName: "Doe", lastName: "johny", email: "test@musterman.com", areNotificationsActive: true),
        isSignoutLoading: false,
        handleSignout: {
            print("")
        }
    )
}
