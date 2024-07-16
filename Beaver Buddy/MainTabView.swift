import SwiftUI

struct MainTabView: View {
    @Binding var happiness: Double
    @Binding var coins: Int
    @Binding var selectedTab: Destination

    var body: some View {
        TabView(selection: $selectedTab) {
            SettingsView(happiness: $happiness)
                .tabItem {
                    Image("settings")
                    Text("Settings")
                }
                .tag(Destination.settings)

            ShopView(coins: $coins)
                .tabItem {
                    Image("shop")
                    Text("Shop")
                }
                .tag(Destination.shop)

            CalendarView()
                .tabItem {
                    Image("calendar")
                    Text("Calendar")
                }
                .tag(Destination.calendar)
        }
    }
}

struct MainTabView_Previews: PreviewProvider {
    @State static var happiness: Double = 0.5
    @State static var coins: Int = 0
    @State static var selectedTab: Destination = .settings

    static var previews: some View {
        MainTabView(happiness: $happiness, coins: $coins, selectedTab: $selectedTab)
    }
}
