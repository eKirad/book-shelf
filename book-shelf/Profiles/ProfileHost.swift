import SwiftUI

struct ProfileHost: View {
    @State private var draftProfile = Profile.defaultProfile
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            ProfileSummary(profile: draftProfile)
        }
        .padding()
    }
}

#Preview {
    ProfileHost()
}
