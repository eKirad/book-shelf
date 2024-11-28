import SwiftUI

struct ContentView: View {
    @State private var tabSelection: MainTab = .home
    
    
    var body: some View {
        TabView(selection: $tabSelection) {
            BookHome()
                .tabItem { Label("Books", systemImage: "book") }
                .tag(MainTab.home)
            
            DashboardHome()
                .tabItem { Label("Dashboard", systemImage: "star") }
                .tag(MainTab.dashboard)
        }
    }
}

#Preview {
    ContentView()
        .environment(ModelData())
}
