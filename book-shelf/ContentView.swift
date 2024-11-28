import SwiftUI

struct ContentView: View {
    @State private var tabSelection: Tab = .home
    
    enum Tab {
        case home
        case dashboard
    }
    
    var body: some View {
        TabView(selection: $tabSelection) {
            BookHome()
                .tabItem { Label("Books", systemImage: "book") }
                .tag(Tab.home)
            
            DashboardHome()
                .tabItem { Label("Dashboard", systemImage: "star") }
                .tag(Tab.dashboard)
        }
    }
}

#Preview {
    ContentView()
        .environment(ModelData())
}
