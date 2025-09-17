//
//  ContentView.swift
//  Bayside Deli
//
//  Created by Harsh Makwana on 7/7/25.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedTab = "Home"
    @State private var selectedSandwich: Sandwich? = nil
    @StateObject private var cartManager = CartManager.shared

    var body: some View {
        NavigationStack {
            ZStack {
                if let sandwich = selectedSandwich {
                    SandwichDetailsView(
                        sandwichName: sandwich.name,
                        sandwichPrice: sandwich.rollPrice,
                        sandwichDescription: sandwich.description,
                        sandwichImage: sandwich.sandwichImage,
                        breadPrice: 0.0,
                        extraPrice: 0.0,
                        selectedSandwich: $selectedSandwich
                    )
                } else {
                    ZStack {
                        Group {
                            if selectedTab == "Home" {
                                HomeView(selectedTab: $selectedTab, selectedSandwich: $selectedSandwich)
                            } else if selectedTab == "Menu" {
                                MenuView(selectedTab: $selectedTab, selectedSandwich: $selectedSandwich)
                            } else if selectedTab == "Cart" {
                                CartView(selectedTab: $selectedTab)   // shows CartProduct
                            } else if selectedTab == "History" {
                                HistoryView(selectedTab: $selectedTab)
                            } else {
                                ProfileView(selectedTab: $selectedTab)
                            }
                        }
                        VStack { TabBarView(selectedTab: $selectedTab) }
                    }
                }
            }
        }
        .environmentObject(cartManager)
    }
}

#Preview {
    ContentView()
        .environmentObject(CartManager.shared)
}
