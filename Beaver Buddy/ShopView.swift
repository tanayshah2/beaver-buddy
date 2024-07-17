import SwiftUI

struct ShopView: View {
    @Binding var coins: Int
    @State private var hats: [Hat] = [
        Hat(name: "Red Hat", price: 50),
        Hat(name: "Blue Hat", price: 75)
    ]
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Coins: \(coins)")
                    .font(.headline)
                    .padding()
                
                List(hats) { hat in
                    HStack {
                        Text(hat.name)
                        Spacer()
                        Text("\(hat.price) coins")
                        Button(action: {
                            buyHat(hat)
                        }) {
                            Text("Buy")
                                .padding(8)
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(8)
                        }
                        .disabled(coins < hat.price)
                    }
                }
            }
            .navigationTitle("Shop")
        }
    }
    
    private func buyHat(_ hat: Hat) {
        if coins >= hat.price {
            coins -= hat.price
            // Add logic to give the hat to the beaver
        }
    }
}

struct Hat: Identifiable {
    let id = UUID()
    let name: String
    let price: Int
}

struct ShopView_Previews: PreviewProvider {
    static var previews: some View {
        ShopView(coins: .constant(100))
    }
}
