import SwiftUI

struct SettingsView: View {
    @AppStorage("screentimeGoal") var screentimeGoal: Int = 60

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Screentime Goal")) {
                    Picker("Goal (minutes)", selection: $screentimeGoal) {
                        ForEach(30...300, id: \.self) { goal in
                            Text("\(goal) minutes").tag(goal)
                        }
                    }
                }
            }
            .navigationTitle("Settings")
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
