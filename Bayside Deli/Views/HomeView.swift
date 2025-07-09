//
//  HomeView.swift
//  Bayside Deli
//
//  Created by Harsh Makwana on 7/7/25.
//

import SwiftUI

struct HomeView: View {
    @State private var searchText: String = ""
  
    var body: some View {

        ZStack {
            Color("Background")
                            .ignoresSafeArea()
            
            ScrollView {
                    
                    VStack {
                        Text("Good Evening, Apple Pie!")
                            .font(.title2)
                            .fontWeight(.semibold)
                            .fontDesign(.monospaced)
                            .foregroundStyle(.primaryText)
                        
                        //Hero Banner
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
                                    .foregroundColor(.primaryText)
                                    .fontWeight(.bold)
                                
                                Text("Pick up 215-15 39 ave, Bayside")
                                    .font(.title2)
                                    .foregroundStyle(.secondaryText)
                                
                                Button{
                                    
                                } label: {
                                    Text("Start your order")
                                        .font(.title)
                                        .foregroundStyle(.white)
                                        .padding(.vertical,15)
                                        .padding(.horizontal, 60)
                                        .background(.primaryBtn)
                                        .clipShape(.buttonBorder)
                                }
                            }
                            .padding(.bottom, 40)
                        }
                        
                
                        
                        
                        //Explore category
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
                    
                        
                        // Popular Picks
                        VStack {
                            Text("Popular Picks")
                                .font(.system(size: 30, weight: .bold, design: .default))
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.leading)
                                .foregroundStyle(.primaryText)
                            
                            //Sandwich Card View
                            SandwichCardView(sandwichName: "Turkey Club", sandwichImage: .turkeyClub, ingredients: "Ovengold Turkey, Bacon, Lettuce, Tomato, Mayonnaise", price: 8.99)
                            
                            SandwichCardView(sandwichName: "Turkey Club", sandwichImage: .baconEggandCheese, ingredients: "Ovengold Turkey, Bacon, Lettuce, Tomato, Mayonnaise", price: 8.99)
                            
                            SandwichCardView(sandwichName: "Turkey Club", sandwichImage: .turkeyClub, ingredients: "Ovengold Turkey, Bacon, Lettuce, Tomato, Mayonnaise", price: 8.99)
                            
                            SandwichCardView(sandwichName: "Turkey Club", sandwichImage: .baconEggandCheese, ingredients: "Ovengold Turkey, Bacon, Lettuce, Tomato, Mayonnaise", price: 8.99)
                            
                            SandwichCardView(sandwichName: "Turkey Club", sandwichImage: .turkeyClub, ingredients: "Ovengold Turkey, Bacon, Lettuce, Tomato, Mayonnaise", price: 8.99)
                        }
                        
                    }
            }
            
        }
        
    }
}

#Preview {


    HomeView()
}
