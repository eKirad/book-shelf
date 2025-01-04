import SwiftUI

struct ProfileHost: View {
    @Binding var isShowingProfile: Bool
    @Binding var loggedInUser: User?
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            ProfileSummary(isShowingProfile: $isShowingProfile, loggedInUser: $loggedInUser)
        }
        .padding()
    }
}

#Preview {
    @State var loggedInUser: User? = nil
    @State var isShowingProfile: Bool = false
    
    return ProfileHost(isShowingProfile: $isShowingProfile, loggedInUser: $loggedInUser)
}
