//
//  CategoryView.swift
//  Bayside Deli
//
//  Created by Harsh Makwana on 7/8/25.
//

import SwiftUI

struct CategoryView: View {
    @State var categoryName: String
    @State var categoryImage: ImageResource
    @State var categoryDescription: String
    var body: some View {

        HStack(alignment: .center) {
            Image(categoryImage)
                .resizable()
                .scaledToFit()
                .frame(height: 50)
                .clipShape(.circle)
            
            VStack(alignment: .leading) {
                Text(categoryName)
                    .font(.system(size: 20, weight: .bold))
                    .foregroundStyle(.primaryText)
                Text(categoryDescription)
                    .font(.system(size: 15, weight: .semibold, design: .monospaced))
                    .foregroundStyle(.secondaryText)
            }
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical)
        .padding(.horizontal, 15)
        .background(.cardSurface)
        .clipShape(.buttonBorder)
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(
                    LinearGradient(
                        colors: [.primaryBtn, .primaryText],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    ),
                    lineWidth: 2
                )
       )
        .padding(.horizontal, 5)

    }
}

#Preview {
    CategoryView(categoryName: "Classic", categoryImage: .classic, categoryDescription: "favorites")
}
