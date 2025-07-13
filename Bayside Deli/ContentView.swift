//
//  ContentView.swift
//  Bayside Deli
//
//  Created by Harsh Makwana on 7/7/25.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedTab = "Home"
    var body: some View {
        ZStack {
            if selectedTab == "Home" {
                HomeView(selectedTab: $selectedTab)
            }
            else if selectedTab == "Menu" {
                MenuView(selectedTab: $selectedTab)
            }
            else if selectedTab == "Cart" {
                CartView(selectedTab: $selectedTab)
            }
            else if selectedTab == "History" {
                HistoryView(selectedTab: $selectedTab)
            }
            else {
                ProfileView(selectedTab: $selectedTab)
            }
            VStack {
                TabBarView(selectedTab: $selectedTab)
            }
        }
    }
}

#Preview {
    ContentView()
}
