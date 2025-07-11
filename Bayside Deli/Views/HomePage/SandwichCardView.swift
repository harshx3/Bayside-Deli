//
//  SandwichCardView.swift
//  Bayside Deli
//
//  Created by Harsh Makwana on 7/8/25.
//

import SwiftUI

struct SandwichCardView: View {
     var sandwichName: String
     var sandwichImage: String
     var description: String
     var rollPrice: Double
     var heroPrice: Double
    
    var body: some View {
        HStack(alignment: .center, spacing: 15) {
            Image(sandwichImage)
                .resizable()
                .scaledToFit()
                .frame(width:80, height: 80)
                .clipShape(.buttonBorder)
                .padding(.trailing)
            
            VStack(alignment: .leading, spacing: 2) {
                Text(sandwichName)
                    .font(.system(size: 20, weight: .bold))
                    .foregroundStyle(.primaryText)
                Text(description)
                    .font(.system(size: 15, design: .default))
                    .foregroundStyle(.secondaryText)
                
                HStack {
                    Text(String(format: "$%.2f", rollPrice))
                        .font(.system(size: 15, weight: .semibold, design: .monospaced))
                        .foregroundStyle(.secondaryText)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .frame(maxWidth: .infinity)
        .padding()
        .padding(.horizontal, 10)
        .background(.cardSurface)
        .clipShape(.buttonBorder)
    }
}

#Preview {
    SandwichCardView(sandwichName: "Blzzing Saddle", sandwichImage: "BlazingSaddle", description: "Blazzing buffalo chicken, Bacon, Lettuce, Tomato, Mayonnaise", rollPrice: 8.99, heroPrice: 10.99)
}
