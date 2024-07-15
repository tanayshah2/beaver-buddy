import SwiftUI

struct MainTabView: View {
    @Binding var happiness: Double
    @Binding var coins: Int
    @State private var selectedTab: Int

    init(happiness: Binding<Double>, coins: Binding<Int>, initialTab: Int) {
        self._happiness = happiness
        self._coins = coins
        self._selectedTab = State(initialValue: initialTab)
    }

    var body: some View {
        TabView(selection: $selectedTab) {
            SettingsView(happiness: $happiness)
                .tabItem {
                    Label("Settings", systemImage: "gearshape")
                }
                .tag(0)
            ShopView(coins: $coins)
                .tabItem {
                    Label("Shop", systemImage: "cart")
                }
                .tag(1)
            CalendarView()
                .tabItem {
                    Label("Calendar", systemImage: "calendar")
                }
                .tag(2)
        }
    }
}

struct SettingsView: View {
    @Binding var happiness: Double

    var body: some View {
        Text("Settings View")
    }
}

struct ShopView: View {
    @Binding var coins: Int

    var body: some View {
        Text("Shop View")
    }
}

struct CalendarView: View {
    var body: some View {
        Text("Calendar View")
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView(happiness: .constant(0.5), coins: .constant(0), initialTab: 0)
    }
}
