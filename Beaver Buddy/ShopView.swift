import SwiftUI

struct ShopView: View {
    @Binding var coins: Int

    var body: some View {
        Text("Shop View")
    }
}

struct ShopView_Previews: PreviewProvider {
    @State static var coins: Int = 0

    static var previews: some View {
        ShopView(coins: $coins)
    }
}
