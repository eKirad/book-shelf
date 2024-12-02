import SwiftUI

struct ProfileAchievements: View {
    var body: some View {
        HStack {
            BeginnerBadge(name: "Beginner")
            ExpertBadge(name: "Expert")
        }
    }
}

#Preview {
    ProfileAchievements()
}
