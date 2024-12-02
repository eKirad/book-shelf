import SwiftUI

struct RotatedBeginnerReaderBadge: View {
    let angle: Angle
    
    var body: some View {
        BadgeSymbol(greenColor: 191.0, blueColor: 191.0)
            .padding(-60)
            .rotationEffect(angle, anchor: .bottom)
    }
}

#Preview {
    RotatedBeginnerReaderBadge(angle: Angle(degrees: 5))
}
