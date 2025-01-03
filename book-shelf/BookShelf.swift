import SwiftUI

@main
struct book_shelfApp: App {
    @State private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
//            SplashScreenTwo(isLoggedIn: .constant(true))
//                .environment(modelData)
//
            
            ContentViewTwo()
                .environment(modelData)
        }
    }
}
