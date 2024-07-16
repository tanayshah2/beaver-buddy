import SwiftUI

enum Destination: Hashable {
    case settings
    case shop
    case calendar
}

struct ContentView: View {
    @State private var happiness: Double = 0.5
    @State private var coins: Int = 0
    @State private var selectedTab: Destination? = nil
    @State private var isMenuVisible: Bool = false

    var body: some View {
        NavigationStack {
            ZStack {
                Image("background")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)

                VStack {
                    HStack {
                        VStack {
                            Button(action: {
                                selectedTab = .settings
                                isMenuVisible = true
                            }) {
                                Image("settings")
                                    .resizable()
                                    .frame(width: 50, height: 50)
                                    .padding(10)
                                    .background(selectedTab == .settings && isMenuVisible ? Color.gray.opacity(0.3) : Color.clear)
                                    .cornerRadius(10)
                            }
                            Button(action: {
                                selectedTab = .shop
                                isMenuVisible = true
                            }) {
                                Image("shop")
                                    .resizable()
                                    .frame(width: 50, height: 50)
                                    .padding(10)
                                    .background(selectedTab == .shop && isMenuVisible ? Color.gray.opacity(0.3) : Color.clear)
                                    .cornerRadius(10)
                            }
                            Button(action: {
                                selectedTab = .calendar
                                isMenuVisible = true
                            }) {
                                Image("calendar")
                                    .resizable()
                                    .frame(width: 50, height: 50)
                                    .padding(10)
                                    .background(selectedTab == .calendar && isMenuVisible ? Color.gray.opacity(0.3) : Color.clear)
                                    .cornerRadius(10)
                            }
                        }
                        .padding(.leading, 10)
                        Spacer()
                        CoinBoxView(coins: $coins)
                            .padding(.trailing, 10)
                    }
                    Spacer()

                    BeaverView(happiness: $happiness)
                        .padding(.bottom, 80)

                    Spacer()
                }

                if isMenuVisible {
                    BlurEffect(style: .systemMaterial)
                        .edgesIgnoringSafeArea(.all)
                    MenuView(selectedTab: $selectedTab, isMenuVisible: $isMenuVisible)
                        .transition(.move(edge: .bottom))
                }
            }
            .animation(.easeInOut, value: isMenuVisible)
            .navigationDestination(for: Destination.self) { destination in
                switch destination {
                case .settings:
                    SettingsView(happiness: $happiness)
                case .shop:
                    ShopView(coins: $coins)
                case .calendar:
                    CalendarView()
                }
            }
        }
    }
}

struct CoinBoxView: View {
    @Binding var coins: Int

    var body: some View {
        HStack {
            Image("coin")
                .resizable()
                .frame(width: 30, height: 30)
            Text("\(coins)")
                .font(.headline)
                .foregroundColor(.white)
                .padding(.leading, 5)
        }
        .padding(10)
        .background(Color.black.opacity(0.7))
        .cornerRadius(10)
    }
}

struct BeaverView: View {
    @Binding var happiness: Double

    var body: some View {
        let beaverImageName = getBeaverImageName(for: happiness)
        
        return Image(beaverImageName)
            .resizable()
            .scaledToFit()
            .frame(width: 400, height: 400)
            .position(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height * 0.45)
    }

    func getBeaverImageName(for happiness: Double) -> String {
        switch happiness {
        case 0..<0.1:
            return "beaver1"
        case 0.1..<0.2:
            return "beaver2"
        case 0.2..<0.3:
            return "beaver3"
        case 0.3..<0.4:
            return "beaver4"
        case 0.4..<0.5:
            return "beaver5"
        case 0.5..<0.6:
            return "beaver6"
        case 0.6..<0.7:
            return "beaver7"
        case 0.7..<0.8:
            return "beaver8"
        case 0.8..<0.9:
            return "beaver9"
        case 0.9...1.0:
            return "beaver10"
        default:
            return "beaver1"
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
