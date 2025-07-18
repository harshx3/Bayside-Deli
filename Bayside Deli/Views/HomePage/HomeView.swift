//
//  HomeView.swift
//  Bayside Deli
//
//  Created by Harsh Makwana on 7/7/25.
//

import SwiftUI

struct HomeView: View {
//    @State private var searchText: String = ""
    @Binding var selectedTab: String
    @StateObject private var dataService = DataService()
    @Binding  var selectedSandwich: Sandwich?
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color("Background")
                    .ignoresSafeArea()
                
                VStack {
                    Text("Good Evening, Apple Valley!")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .fontDesign(.monospaced)
                        .foregroundStyle(.secondaryText)
                    
                    ScrollView {
                        // Hero Banner
                        ZStack {
                            GeometryReader { geometry in
                                RoundedRectangle(cornerRadius: 20)
                                    .fill(Color(.cardSurface))
                                    .frame(width: geometry.size.width, height: 250)
                            }
                            .frame(height: 250)
                            
                            VStack(spacing: 15) {
                                Text("Order Now")
                                    .font(.largeTitle)
                                    .foregroundColor(.secondaryText)
                                    .fontWeight(.bold)
                                
                                Text("Pick up 215-15 39 ave, Bayside")
                                    .font(.title2)
                                    .foregroundStyle(.secondaryText)
                                
                                Button{
                                    
                                } label: {
                                    Text("Start your order")
                                        .font(.title)
                                        .foregroundStyle(.primaryText)
                                        .padding(.vertical,15)
                                        .padding(.horizontal, 60)
                                        .background(.primaryBtn)
                                        .clipShape(.buttonBorder)
                                }
                            }
                            .padding(.bottom, 40)
                        }
                        
                        // Explore category
                        VStack {
                            Text("Explore Category")
                                .font(.system(size: 30, weight: .bold, design: .default))
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.leading)
                                .foregroundStyle(.primaryText)
                            HStack {
                                CategoryView(categoryName: "Classic", categoryImage: .classic, categoryDescription: "Timeless")
                                CategoryView(categoryName: "Signature", categoryImage: .signature, categoryDescription: "Bold")
                            }
                            HStack {
                                CategoryView(categoryName: "Healthy", categoryImage: .healthy, categoryDescription: "Fresh")
                                CategoryView(categoryName: "Hot", categoryImage: .hot, categoryDescription: "Sizzling")
                            }
                        }
                        
                        
                        VStack {
                            Text("Popular Picks")
                                .font(.system(size: 30, weight: .bold, design: .default))
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.leading)
                                .foregroundStyle(.primaryText)
                            
                            ForEach(dataService.sandwiches.shuffled().prefix(5)) { picked in
                                Button(action: {
                                    withAnimation(.easeIn) {
                                        selectedSandwich = picked
                                    }
                                }) {
                                    SandwichCardView(
                                        sandwichName: picked.name,
                                        sandwichImage: picked.sandwichImage,
                                        description: picked.description,
                                        rollPrice: picked.rollPrice,
                                        heroPrice: picked.heroPrice
                                    )
                                }
                            
                            }
                        }
                    }
                    .padding(.bottom, 90)
                }
            }
            
        }
    }
}

#Preview {
    HomeView(selectedTab: .constant("Home"), selectedSandwich: .constant(nil))
}
