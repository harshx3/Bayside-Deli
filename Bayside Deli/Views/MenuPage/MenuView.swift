//
//  MenuView.swift
//  Bayside Deli
//
//  Created by Harsh Makwana on 7/9/25.
//

import SwiftUI

struct MenuView: View {
    @State private var selectedCategory: String = "All"
    private let categories:[String] = ["All", "Classic", "Signature", "Healthy", "Hot", "Platter", "Healthy Wrap"]
    @State private var searchSandwich: String = ""
    
    @StateObject private var dataService = DataService()
    @Binding var selectedTab: String
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color("Background").ignoresSafeArea()
                VStack {
                    //                Picker("Category", selection: $selectedCategory) {
                    //                    ForEach(categories, id: \.self) { category in
                    //                        Text(category)
                    //                    }
                    
                    
                    HStack {
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 10) {
                                ForEach(categories, id: \.self) { category in
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
                    
                    
                    
                    ScrollView {
                        VStack(spacing: 20) {
                            ForEach(filteredSandwiches) { sandwich in
                                
                                SandwichCardView(
                                    sandwichName: sandwich.name,
                                    sandwichImage: sandwich.sandwichImage, 
                                    description: sandwich.description,
                                    rollPrice: sandwich.rollPrice,
                                    heroPrice: sandwich.heroPrice
                                )
                                
                                
                            }
                        }
                        .padding(.bottom, 80) // so it's not hidden behind tab bar
                    }

                }
            }
        }
    }
    
    // MARK: - Filter logic
    var filteredSandwiches: [Sandwich] {
        dataService.sandwiches.filter {
            (selectedCategory == "All" || $0.category == selectedCategory) &&
            (searchSandwich.isEmpty || $0.name.localizedCaseInsensitiveContains(searchSandwich))
        }
    }
}

#Preview {
    MenuView(selectedTab: .constant("Menu"))
}
