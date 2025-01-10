import SwiftUI

struct ProfileSummaryHeader: View {
    @Binding var loggedInUser: User?
    @Binding var isEditDisabled: Bool
    
    private var negatedEditBinding: Binding<Bool> {
        Binding(
            get: { !isEditDisabled },
            set: { isEditDisabled = !$0 }
        )
    }
    
    var body: some View {
        HStack {
            defaultProfileImage()
            Text(loggedInUser?.username ?? Texts.nA)
                .bold()
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            Spacer()
            
            HStack (spacing: 8) {
                Toggle(isOn: negatedEditBinding) {
                    HStack () {
                        Text(Texts.edit)
                            .foregroundColor(.gray)
                            .frame(maxWidth: .infinity, alignment: .trailing)
                    }
                }
                .toggleStyle(SwitchToggleStyle())
            }
            .padding(.trailing)
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
    @State var isEditProfileDisabled: Bool = true
    
    return ProfileSummaryHeader(loggedInUser: $loggedInUser, isEditDisabled: $isEditProfileDisabled)
}
