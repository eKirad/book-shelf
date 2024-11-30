import SwiftUI

struct BadgeSymbol: View {
    static let tickColor = Color.green
    static let circleColor = Color.white

    var body: some View {
        ZStack {
            // Background circle with a border for the stamp
            Circle()
                .fill(Self.circleColor)
                .frame(width: 100, height: 100)
                .overlay(
                    Circle()
                        .strokeBorder(Color.green, lineWidth: 4)
                )
                .shadow(radius: 4, x: 2, y: 2) // Add shadow for a stamp effect

            // Tick mark with a rougher stroke for a stamped appearance
            Path { path in
                let width: CGFloat = 100
                let height: CGFloat = 100
                let centerX = width / 2
                let centerY = height / 2

                // Start point of the tick
                path.move(to: CGPoint(x: centerX - 20, y: centerY))
                // First line of the tick
                path.addLine(to: CGPoint(x: centerX, y: centerY + 20))
                // Second line of the tick
                path.addLine(to: CGPoint(x: centerX + 20, y: centerY - 20))
            }
            .stroke(Self.tickColor, style: StrokeStyle(lineWidth: 6, lineCap: .round, lineJoin: .round))
            .frame(width: 100, height: 100) // Ensure tick matches the size of the circle
        }
    }
}


#Preview {
    BadgeSymbol()
}
