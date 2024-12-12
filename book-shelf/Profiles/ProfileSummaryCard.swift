import SwiftUI

struct ProfileSummaryCard: View {
    var profile: User
    let handleSignout: () -> Void
    
    var body: some View {
            HStack {
                Image(systemName: "person.fill")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .foregroundColor(.gray)
                Text("\(Texts.fullName): \(profile.firstName) \(profile.lastName)")
            }
           
             HStack {
                Image(systemName: "envelope.fill")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .foregroundColor(.gray)
                 Text("\(profile.email)")
            }
           
             HStack {
                Image(systemName: "bell.fill")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .foregroundColor(.gray)
                 Text("\(Texts.notifications): \(profile.areNotificationsActive ? "\(Texts.notificationsOn)": "\(Texts.notificationsOff)")")
            }
        
        HStack {
            Button(action: {
                handleSignout()
            }) {
                Image(systemName: "arrow.right.circle.fill")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .foregroundColor(.gray)
                Text(Texts.signOut)
                    .foregroundColor(.black)
            }
       }
    }
}

#Preview {
    ProfileSummaryCard(profile: User(id: UUID(), username: "John", firstName: "Doe", lastName: "johny", email: "test@musterman.com", areNotificationsActive: true)) {
        print("")
    }
}
