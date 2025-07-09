//
//  SandwichCardView.swift
//  Bayside Deli
//
//  Created by Harsh Makwana on 7/8/25.
//

import SwiftUI

struct SandwichCardView: View {
    @State var sandwichName: String
    @State var sandwichImage: ImageResource
    @State var ingredients: String
    @State var price: Double
    var body: some View {
        HStack(alignment: .center) {
            Image(sandwichImage)
                .resizable()
                .scaledToFit()
                .frame(height: 80)
                .clipShape(.buttonBorder)
                .padding(.trailing)
            
            VStack(alignment: .leading) {
                Text(sandwichName)
                    .font(.system(size: 20, weight: .bold))
                    .foregroundStyle(.primaryText)
                Text(ingredients)
                    .font(.system(size: 15, design: .default))
                    .foregroundStyle(.secondaryText)
                
                Text(String(format: "$%.2f", price))
                    .font(.system(size: 20, weight: .semibold, design: .monospaced))
                    .foregroundStyle(.secondaryText)
            }
        }
        .padding()
        .padding(.horizontal, 15)
        .background(.cardSurface)
        .clipShape(.buttonBorder)
    }
}

#Preview {
    SandwichCardView(sandwichName: "Turkey Club", sandwichImage: .turkeyClub, ingredients: "Ovengold Turkey, Bacon, Lettuce, Tomato, Mayonnaise", price: 8.99)
}
