import SwiftUI

struct ContentView: View {
    @State private var tabSelection: MainTab = .home
    
    var body: some View {
        TabView(selection: $tabSelection) {
            BookHome()
                .tabItem { Label(Labels.books, systemImage: "book") }
                .tag(MainTab.home)
            
            DashboardHome()
                .tabItem { Label(Labels.dashboard, systemImage: "star") }
                .tag(MainTab.dashboard)
        }
    }
}

#Preview {
    ContentView()
        .environment(ModelData())
}
