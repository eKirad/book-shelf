import SwiftUI

struct ProfileSummaryHeader: View {
    @Binding var loggedInUser: User?
    
    var body: some View {
        HStack {
            defaultProfileImage()
            Text(loggedInUser?.username ?? "n/A")
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
    
    private func defaultProfileImage() -> some View {
        Image(systemName: "person.crop.circle.fill")
            .resizable()
            .scaledToFill()
            .frame(width: 70, height: 70)
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.white, lineWidth: 4))
            .foregroundColor(.gray)
    }
}

#Preview {
    @State var loggedInUser: User? = nil
    
    return ProfileSummaryHeader(loggedInUser: $loggedInUser)
}
