import SwiftUI

struct TagModifier: ViewModifier {
    var backgroundColor: Color
    
    func body(content: Content) -> some View {
        content
            .padding(8)
            .background(backgroundColor)
            .foregroundColor(.white)
            .font(.caption)
            .cornerRadius(10)
    }
}

extension View {
    func tagStyle(backgroundColor: Color) -> some View {
        self.modifier(TagModifier(backgroundColor: backgroundColor))
    }
}
