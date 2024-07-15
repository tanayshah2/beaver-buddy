import SwiftUI

struct MenuView: View {
    @Binding var selectedTab: Destination?
    @Binding var isMenuVisible: Bool

    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button(action: { isMenuVisible = false }) {
                    Image(systemName: "xmark.circle.fill")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .foregroundColor(.gray)
                        .padding()
                }
            }
            Spacer()
            Button(action: { selectedTab = .settings; isMenuVisible = false }) {
                Text("Settings")
                    .font(.largeTitle)
                    .padding()
            }
            Button(action: { selectedTab = .shop; isMenuVisible = false }) {
                Text("Shop")
                    .font(.largeTitle)
                    .padding()
            }
            Button(action: { selectedTab = .calendar; isMenuVisible = false }) {
                Text("Calendar")
                    .font(.largeTitle)
                    .padding()
            }
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.white)
        .cornerRadius(20)
        .padding()
    }
}
