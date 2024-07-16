import SwiftUI

struct SettingsView: View {
    @Binding var happiness: Double
    @State private var screentimeGoal: String = ""
    @State private var notificationsEnabled: Bool = true

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Screentime Goals")) {
                    TextField("Enter daily screentime goal (hours)", text: $screentimeGoal)
                        .keyboardType(.numberPad)
                }

                Section(header: Text("Notifications")) {
                    Toggle(isOn: $notificationsEnabled) {
                        Text("Enable Notifications")
                    }
                }

                Button(action: saveSettings) {
                    Text("Save Settings")
                        .foregroundColor(.blue)
                }
            }
            .navigationBarTitle("Settings")
        }
    }

    func saveSettings() {
        // Implement the logic to save the settings
        print("Screentime goal saved: \(screentimeGoal)")
        print("Notifications enabled: \(notificationsEnabled)")
    }
}

struct SettingsView_Previews: PreviewProvider {
    @State static var happiness: Double = 0.5

    static var previews: some View {
        SettingsView(happiness: $happiness)
    }
}
