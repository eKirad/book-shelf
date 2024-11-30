import SwiftUI

struct ProfileSummaryCard: View {
    var profile: Profile
    
    var body: some View {
        HStack {
            Image(systemName: "person")
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .foregroundColor(.cyan)
            Text("\(Texts.firstName): \(profile.firstName)")
        }
       
        HStack {
            Image(systemName: "person")
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .foregroundColor(.cyan)
            Text("\(Texts.lastName): \(profile.lastName)")
        }
        
         HStack {
            Image(systemName: "envelope")
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .foregroundColor(.cyan)
             Text("\(profile.email)")
        }
       
         HStack {
            Image(systemName: "bell")
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .foregroundColor(.cyan)
             Text("\(Texts.notifications): \(profile.prefersNotifications ? "\(Texts.notificationsOn)": "\(Texts.notificationsOff)")")
        }
    }
}

#Preview {
    ProfileSummaryCard(profile: Profile.defaultProfile)
}
