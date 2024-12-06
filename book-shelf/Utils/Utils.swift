import SwiftUI

func mapGenreToColor(for genre: BookGenre) -> Color {
    switch genre {
    case .mystery:
        return Color.gray
    case .thriller:
        return Color.cyan
    case .romance:
        return Color(red: 1.0, green: 0.6, blue: 0.6)
    }
}
