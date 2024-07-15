import SwiftUI

struct ContentView: View {
    @State private var happiness: Double = 0.5
    @State private var coins: Int = 0

    var body: some View {
        ZStack {
            Image("background")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)

            VStack {
                HStack {
                    VStack {
                        NavigationLink(destination: SettingsView(happiness: $happiness)) {
                            Image("settings")
                                .resizable()
                                .frame(width: 50, height: 50)
                                .padding(10)
                        }
                        NavigationLink(destination: ShopView(coins: $coins)) {
                            Image("shop")
                                .resizable()
                                .frame(width: 50, height: 50)
                                .padding(10)
                        }
                        NavigationLink(destination: CalendarView()) {
                            Image("calendar")
                                .resizable()
                                .frame(width: 50, height: 50)
                                .padding(10)
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

struct CalendarView: View {
    var body: some View {
        Text("Calendar View")
    }
}

struct ShopView: View {
    @Binding var coins: Int

    var body: some View {
        Text("Shop View")
    }
}

struct SettingsView: View {
    @Binding var happiness: Double

    var body: some View {
        Text("Settings View")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
