//
//  TabBarView.swift
//  Bayside Deli
//
//  Created by Harsh Makwana on 7/8/25.
//

import SwiftUI

struct TabBarView: View {
    @Binding var selectedTab: String
    private let tabIcons: [ImageResource] = [.home, .menu, .cart, .history, .profile]
    private let tabNames: [String] = ["Home", "Menu", "Cart", "History", "Profile"]
    
    
    var body: some View {
        VStack {
            Spacer()
            
            HStack(spacing: 25) {
                ForEach(0..<tabIcons.count, id: \.self) { index in
                   
                    TabItem(tabIcon: tabIcons[index], tabName: tabNames[index], selectedTab: $selectedTab)
                        .frame(maxWidth: .infinity)
                        
                }
            }
            .frame(maxWidth: .infinity)
            .padding(.horizontal, 12)
            .padding(.vertical, 15)
            .background(.primaryBtn)
            .clipShape(.buttonBorder)
            .padding(.bottom, 5)
            .padding(.horizontal)
            
        }

        
    }
}

#Preview {
    TabBarView(selectedTab: .constant("Home"))
}


struct TabItem: View {
    @State var tabIcon: ImageResource
    @State var tabName: String
    @Binding var selectedTab: String

    var body: some View {
        VStack(spacing: 3) {
            Image(tabIcon)
                .resizable()
                .scaledToFit()
                .frame(width: selectedTab == tabName ? 40 : 32, height: selectedTab == tabName ? 32 : 28)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(
                            selectedTab == tabName
                            ? AnyShapeStyle(LinearGradient(
                                colors: [.primaryBtn, .primaryText],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            ))
                            : AnyShapeStyle(Color.clear),
                            lineWidth: 3
                        )
                )
                .shadow(color: selectedTab == tabName ? .primaryBtn.opacity(0.25) : .clear, radius: 5, y: 1)
                .animation(.easeInOut(duration: 0.15), value: selectedTab)
            Text(tabName)
                .font(.system(size: selectedTab == tabName ? 14 : 12))
                .fontDesign(.monospaced)
                .fontWeight(.semibold)
                .foregroundStyle(selectedTab == tabName ? .cardSurface : .primaryText)
                .lineLimit(1)
                .minimumScaleFactor(0.8)
                .animation(.easeInOut(duration: 0.15), value: selectedTab)
        }
        .padding(.vertical, 4)
        .frame(maxWidth: .infinity)
        .background(selectedTab == tabName ? Color.primaryBtn.opacity(0.18) : .clear)
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .contentShape(Rectangle())
        .onTapGesture {
            selectedTab = tabName
        }
    }
}

#Preview {
    TabItem(tabIcon: .home, tabName: "Home", selectedTab: .constant("Home") )
}

