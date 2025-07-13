//
//  HomeView.swift
//  Bayside Deli
//
//  Created by Harsh Makwana on 7/7/25.
//

//import SwiftUI
//
//struct HomeView: View {
//    @State private var searchText: String = ""
//    @Binding var selectedTab: String
//    
//    @StateObject private var dataService = DataService()
//    
//   
//  
//    var body: some View {
//
//
//                
//        NavigationStack {
//            ZStack {
//                Color("Background")
//                    .ignoresSafeArea()
//                
//                
//                VStack {
//                    Text("Good Evening, Apple Valley!")
//                        .font(.title2)
//                        .fontWeight(.semibold)
//                        .fontDesign(.monospaced)
//                        .foregroundStyle(.secondaryText)
//                    
//                    ScrollView {
//                        
//                        //Hero Banner
//                        ZStack {
//                            GeometryReader { geometry in
//                                RoundedRectangle(cornerRadius: 20)
//                                    .fill(Color(.cardSurface))
//                                    .frame(width: geometry.size.width, height: 250)
//                            }
//                            .frame(height: 250)
//                            
//                            VStack(spacing: 15) {
//                                Text("Order Now")
//                                    .font(.largeTitle)
//                                    .foregroundColor(.secondaryText)
//                                    .fontWeight(.bold)
//                                
//                                Text("Pick up 215-15 39 ave, Bayside")
//                                    .font(.title2)
//                                    .foregroundStyle(.secondaryText)
//                                
//                                Button{
//                                    
//                                } label: {
//                                    Text("Start your order")
//                                        .font(.title)
//                                        .foregroundStyle(.primaryText)
//                                        .padding(.vertical,15)
//                                        .padding(.horizontal, 60)
//                                        .background(.primaryBtn)
//                                        .clipShape(.buttonBorder)
//                                }
//                            }
//                            .padding(.bottom, 40)
//                        }
//                        
//                        //Explore category
//                        VStack {
//                            Text("Explore Category")
//                                .font(.system(size: 30, weight: .bold, design: .default))
//                                .frame(maxWidth: .infinity, alignment: .leading)
//                                .padding(.leading)
//                                .foregroundStyle(.primaryText)
//                            HStack {
//                                CategoryView(categoryName: "Classic", categoryImage: .classic, categoryDescription: "Timeless")
//                                CategoryView(categoryName: "Signature", categoryImage: .signature, categoryDescription: "Bold")
//                            }
//                            HStack {
//                                CategoryView(categoryName: "Healthy", categoryImage: .healthy, categoryDescription: "Fresh")
//                                CategoryView(categoryName: "Hot", categoryImage: .hot, categoryDescription: "Sizzling")
//                            }
//                        }
//                        
//                        
//                        // Popular Picks
//                        VStack {
//                            Text("Popular Picks")
//                                .font(.system(size: 30, weight: .bold, design: .default))
//                                .frame(maxWidth: .infinity, alignment: .leading)
//                                .padding(.leading)
//                                .foregroundStyle(.primaryText)
//                            
//                            
//                            ForEach(dataService.sandwiches.shuffled().prefix(5)) { picked in
//                                NavigationLink {
//                                    SandwichDetailsView(
//                                        sandwichName: picked.name,
//                                        sandwichPrice: picked.rollPrice,
//                                        sandwichDescription: picked.description,
//                                        sandwichImage: picked.sandwichImage,
//                                        breadPrice: 0.0, extraPrice: 0.0)
//                                } label: {
//                                    SandwichCardView(sandwichName: picked.name, sandwichImage: picked.sandwichImage, description: picked.description, rollPrice: picked.rollPrice, heroPrice: picked.heroPrice)
//                                    
//                                }
//                                
//                            }
//                        }
//                        
//                    }
//                    .padding(.bottom, 90)
//                }
//                
//                
//                
//            }
//        }
//        }
//}
//
//#Preview {
//
//
//    HomeView(selectedTab: .constant("Home"))
//}


import SwiftUI

struct HomeView: View {
    @State private var searchText: String = ""
    @Binding var selectedTab: String
    @StateObject private var dataService = DataService()
    @State private var selectedSandwich: Sandwich? = nil // For navigation
    
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
                        // Hero Banner (unchanged)
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
                        
                        // Explore category (unchanged)
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
                        
                        // Fixed Popular Picks with working navigation
                        VStack {
                            Text("Popular Picks")
                                .font(.system(size: 30, weight: .bold, design: .default))
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.leading)
                                .foregroundStyle(.primaryText)
                            
                            ForEach(dataService.sandwiches.shuffled().prefix(5)) { picked in
                                Button(action: {
                                    selectedSandwich = picked
                                }) {
                                    SandwichCardView(
                                        sandwichName: picked.name,
                                        sandwichImage: picked.sandwichImage,
                                        description: picked.description,
                                        rollPrice: picked.rollPrice,
                                        heroPrice: picked.heroPrice
                                    )
                                }
                                .buttonStyle(PlainButtonStyle())
                            }
                        }
                    }
                    .padding(.bottom, 90)
                }
            }
            .navigationDestination(item: $selectedSandwich) { sandwich in
                SandwichDetailsView(
                    sandwichName: sandwich.name,
                    sandwichPrice: sandwich.rollPrice,
                    sandwichDescription: sandwich.description,
                    sandwichImage: sandwich.sandwichImage,
                    breadPrice: 0.0,
                    extraPrice: 0.0
                )
            }
        }
    }
}
