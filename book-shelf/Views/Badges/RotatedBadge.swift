import SwiftUI

struct RotatedBadge: View {
    let angle: Angle
    var greenColor: Double
    var blueColor: Double
    
    var body: some View {
        BadgeSymbol(greenColor: greenColor, blueColor: blueColor)
            .padding(-60)
            .rotationEffect(angle, anchor: .bottom)
    }
}

#Preview {
    RotatedBadge(angle: Angle(degrees: 5), greenColor: 191.0, blueColor: 191.0)
}
