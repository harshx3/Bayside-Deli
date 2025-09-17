import SwiftUI

struct MenuView: View {
    @EnvironmentObject var cartManager: CartManager
    @State private var selectedCategory: String = "All"
    private let categories: [String] = ["All", "Classic", "Signature", "Healthy", "Hot", "Platter", "Healthy Wrap"]
    @State private var searchSandwich: String = ""
    
    @StateObject private var dataService = DataService()
    @Binding var selectedTab: String
    @Binding var selectedSandwich: Sandwich?
    
    
    var body: some View {
        NavigationStack {
            menuContent
        }
    }
    
    private var menuContent: some View {
        ZStack {
            Color("Background").ignoresSafeArea()
            VStack {
                categoryPicker
                sandwichList
            }
        }
        .navigationBarTitleDisplayMode(.inline)
    }

    
    private var categoryPicker: some View {
        HStack {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 10) {
                    ForEach(categories, id: \.self) { category in
                        categoryButton(for: category)
                    }
                }
                .padding()
            }
        }
        .frame(maxWidth: .infinity)
        .clipShape(.buttonBorder)
        .background(.primaryBtn)
        .clipShape(.buttonBorder)
        .padding(.top)
        .padding(.horizontal)
    }
    
    private func categoryButton(for category: String) -> some View {
        Text(category)
            .font(.system(size: 15))
            .padding()
            .lineLimit(1)
            .foregroundStyle(category == selectedCategory ? .cardSurface : .primaryText)
            .background(category == selectedCategory ? .primaryText : .clear)
            .onTapGesture {
                withAnimation(.interactiveSpring(duration: 0.4)) {
                    selectedCategory = category
                }
            }
            .clipShape(.buttonBorder)
    }
    
    private var sandwichList: some View {
        ScrollView {
            VStack(spacing: 20) {
                ForEach(filteredSandwiches) { sandwich in
                    sandwichCard(for: sandwich)
                }
            }
            .padding(.bottom, 80)
        }
    }
    
    private func sandwichCard(for sandwich: Sandwich) -> some View {
        Button {
            withAnimation(.easeIn){
                selectedSandwich = sandwich
            }
        } label: {
            SandwichCardView(
                sandwichName: sandwich.name,
                sandwichImage: sandwich.sandwichImage,
                description: sandwich.description,
                rollPrice: sandwich.rollPrice,
                heroPrice: sandwich.heroPrice
            )
        }
        .buttonStyle(PlainButtonStyle())
    }
    
    var filteredSandwiches: [Sandwich] {
        dataService.sandwiches.filter {
            (selectedCategory == "All" || $0.category == selectedCategory) &&
            (searchSandwich.isEmpty || $0.name.localizedCaseInsensitiveContains(searchSandwich))
        }
    }
}

#Preview {
    MenuView(selectedTab: .constant("Menu"), selectedSandwich: .constant(nil))
}
