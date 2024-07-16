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
            HStack {
                Button(action: { selectedTab = .settings }) {
                    Image("settings")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .padding()
                        .background(selectedTab == .settings ? Color.gray.opacity(0.3) : Color.clear)
                        .cornerRadius(10)
                }
                Button(action: { selectedTab = .shop }) {
                    Image("shop")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .padding()
                        .background(selectedTab == .shop ? Color.gray.opacity(0.3) : Color.clear)
                        .cornerRadius(10)
                }
                Button(action: { selectedTab = .calendar }) {
                    Image("calendar")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .padding()
                        .background(selectedTab == .calendar ? Color.gray.opacity(0.3) : Color.clear)
                        .cornerRadius(10)
                }
            }
            .padding()
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.white)
        .cornerRadius(20)
        .padding()
    }
}
