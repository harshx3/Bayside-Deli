import SwiftUI

struct SandwichDetailsView: View {
    // Keeping your current @State inputs so you don't have to refactor now
    @State var sandwichName: String
    @State var sandwichPrice: Double
    @State var sandwichDescription: String
    @State var sandwichImage: String
    @State var breadPrice: Double
    @State var extraPrice: Double
    // Tracks selected bread and extras for add-to-cart
    @State private var selectedBread: String? = "Roll"
    @State private var selectedExtras: [String] = []

    @State private var goToCart = false   // navigation trigger

    @Binding var selectedSandwich: Sandwich?

    @EnvironmentObject var cartManager: CartManager

    var finalPrice: Double {
        sandwichPrice + breadPrice + extraPrice
    }

    var body: some View {
        ZStack {
            Color("Background").ignoresSafeArea()

            VStack {
                Button {
                    withAnimation(.default) {
                        selectedSandwich = nil
                    }
                } label: {
                    HStack {
                        Image(systemName: "chevron.left")
                        Text("Back")
                    }
                    .font(.title2)
                    .foregroundStyle(.primaryBtn)
                    .fontWeight(.semibold)
                    .padding(.vertical, 5)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 35)

                Image(sandwichImage)
                    .resizable()
                    .scaledToFit()
                    .clipShape(RoundedRectangle(cornerRadius: 10))

                HStack {
                    Text(sandwichName)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .foregroundStyle(.primaryText)

                    Text(finalPrice, format: .currency(code: "USD"))
                        .foregroundStyle(.primaryBtn)
                }
                .font(.system(size: 25, weight: .bold, design: .rounded))
                .padding(.horizontal)
                .padding(.top)

                ScrollView {
                    Text(sandwichDescription)
                        .foregroundStyle(.primaryText.opacity(0.8))
                        .font(.headline)
                        .multilineTextAlignment(.center)
                        .scaleEffect(0.9)

                    AddOnCheckboxView(
                        title: "Select Your Bread",
                        options: [
                            ("Roll", 0.0),
                            ("Hero", 1.99),
                            ("Wrap", 2.49)
                        ],
                        selectionType: .single,
                        selectedPrice: $breadPrice,
                        selectedOption: $selectedBread,
                        selectedOptions: .constant([])
                    )

                    AddOnCheckboxView(
                        title: "Extras",
                        options: [
                            ("Lettuce", 0.50),
                            ("Tomato", 0.50),
                            ("Onion", 0.50),
                            ("Pickle", 0.50),
                            ("Jalapeno", 0.50),
                            ("Avocado", 1.00)
                        ],
                        selectionType: .multiple,
                        selectedPrice: $extraPrice,
                        selectedOption: .constant(nil),
                        selectedOptions: $selectedExtras
                    )
                }
                .padding(.bottom, 80)
                .onAppear {
                    // Reset selections when the view appears or a new sandwich is shown
                    selectedBread = "Roll"
                    breadPrice = 0.0
                    selectedExtras = []
                    extraPrice = 0.0
                }
            }

            // Bottom "Add to Cart" + NavigationLink
            VStack {
                // Hidden link that pushes the page
                NavigationLink(isActive: $goToCart) {
                    CartProduct().environmentObject(cartManager)
                } label: { EmptyView() }
                .hidden()

                Button {
                    cartManager.addToCart(
                        sandwichName: sandwichName,
                        sandwichImage: sandwichImage,
                        selectedBread: selectedBread ?? "Roll",
                        sandwichFinalPrice: finalPrice,
                        addOns: selectedExtras.joined(separator: ", ")
                    )
                    goToCart = true
                } label: {
                    CreateButton(
                        btnImage: "Cart",
                        btnText: "Add to Cart",
                        btnTextColor: .primaryText,
                        btnBackgroundColor: .primaryBtn
                    )
                }
            }
            .frame(maxHeight: .infinity, alignment: .bottom)
        }
    }
}

#Preview {
    SandwichDetailsView(
        sandwichName: "Bacon Egg and Cheese",
        sandwichPrice: 5.99,
        sandwichDescription: "Crispy Bacon, Fried Egg, Melted American Cheese",
        sandwichImage: "BLT",
        breadPrice: 0.0,
        extraPrice: 0.0,
        selectedSandwich: .constant(nil)
    )
    // The environmentObject below is only for preview/testing purposes
    .environmentObject(CartManager.shared)
}

#Preview("Empty Cart") {
    NavigationStack {
        CartProduct()
    }
    .environmentObject(CartManager.shared)
}

#Preview("Add to Cart Flow") {
    @State var selectedSandwich: Sandwich? = nil
    let cartManager = CartManager.shared
    return NavigationStack {
        SandwichDetailsView(
            sandwichName: "Turkey Club",
            sandwichPrice: 7.99,
            sandwichDescription: "Turkey, Bacon, Lettuce, Tomato, Mayo",
            sandwichImage: "TurkeyClub",
            breadPrice: 0.0,
            extraPrice: 0.0,
            selectedSandwich: $selectedSandwich
        )
    }
    .environmentObject(cartManager)
}
