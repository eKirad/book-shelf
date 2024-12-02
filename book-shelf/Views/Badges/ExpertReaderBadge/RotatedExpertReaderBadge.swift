import SwiftUI

struct RotatedExpertReaderBadge: View {
    let angle: Angle
    
    var body: some View {
        BadgeSymbol(greenColor: 79.0, blueColor: 191.0)
            .padding(-60)
            .rotationEffect(angle, anchor: .bottom)
    }
}

#Preview {
    RotatedExpertReaderBadge(angle: Angle(degrees: 5))
}
