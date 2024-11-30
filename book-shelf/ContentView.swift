import SwiftUI

struct ContentView: View {
    @State private var tabSelection: MainTab = .myBooks
    
    var body: some View {
        TabView(selection: $tabSelection) {
            BookHome()
                .tabItem { Label(Labels.myBooks, systemImage: "book") }
                .tag(MainTab.myBooks)
            
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
