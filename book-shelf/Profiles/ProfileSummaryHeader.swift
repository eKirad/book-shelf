import SwiftUI

struct ProfileSummaryHeader: View {
    var userName: String
    
    var body: some View {
        HStack {
            Text(userName)
                .bold()
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            Spacer()
            
            Button(action: {
                // TODO: Implement edit logic
                print("Edit button tapped")
            }) {
                HStack {
                    Text(Texts.edit)
                        .foregroundColor(.cyan)
                    Image(systemName: "square.and.pencil")
                        .foregroundColor(.cyan)
                }
            }
        }
        .font(.headline)
    }
}

#Preview {
    ProfileSummaryHeader(userName: Profile.defaultProfile.username)
}
