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
        VStack {
            Image(tabIcon)
                .resizable()
                .scaledToFit()
                .frame(width: 40)
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
            Text(tabName)
                .font(.system(size: 15))
                .fontDesign(.monospaced)
                .fontWeight(.semibold)
                .foregroundStyle(selectedTab == tabName ? .cardSurface : .primaryText)
                .lineLimit(1)
                .minimumScaleFactor(0.8)
        }
        .onTapGesture {
            selectedTab = tabName
        }
    }
}

#Preview {
    TabItem(tabIcon: .home, tabName: "Home", selectedTab: .constant("Home") )
}
