import SwiftUI

struct ExpertBadge: View {
    var name: String
    
    var body: some View {
        VStack(alignment: .center) {
            Badge(greenColor: 191.0, blueColor: 121.0)
                .frame(width: 300, height: 300)
                .scaleEffect(1.0/3.0)
                .frame(width: 100, height: 100)
            Text(name)
                .font(.caption)
                .accessibilityLabel("Badge for \(name).")
        }
    }
}

#Preview {
    ExpertBadge(name: "Preview Testing")
}
