import SwiftUI

struct ProfileSummary: View {
    @Binding var isShowingProfile: Bool
    @Binding var loggedInUser: User?
    @State var isSignoutLoading: Bool = false
    
    private func handleSignout() {
        isSignoutLoading = true
        // TODO: Mock API call
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            loggedInUser = nil
            isSignoutLoading = false
            isShowingProfile = false
        }
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                ProfileSummaryHeader(loggedInUser: $loggedInUser)
                Divider()
                ProfileSummaryCard(isShowingProfile: $isShowingProfile, loggedInUser: $loggedInUser)
                Divider()
                ProfileAchievements()
            }
        }
        .padding()
    }
}

#Preview {
    @State var loggedInUser: User? = nil
    @State var isShowingProfile: Bool = false
    
    return ProfileSummary(isShowingProfile: $isShowingProfile, loggedInUser: $loggedInUser)
}
