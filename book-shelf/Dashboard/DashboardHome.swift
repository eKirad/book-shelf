import SwiftUI

struct DashboardHome: View {
    @State private var selectedYearOption = "2024"
    let options = ["2024", "2023", "2022"]
    
    var body: some View {
        VStack {
            Picker("Select an option", selection: $selectedYearOption) {
                ForEach(options, id: \.self) { option in
                    Text(option).tag(option)
                }
            }
            .pickerStyle(.menu)
            
            Text("Selected: \(selectedYearOption)")
        }
        .padding()
    }
}

#Preview {
    DashboardHome()
}
