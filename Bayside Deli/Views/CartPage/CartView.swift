//
//  CartView.swift
//  Bayside Deli
//
//  Created by Harsh Makwana on 7/9/25.
//

import SwiftUI

struct CartView: View {
    @Binding var selectedTab: String
    var body: some View {
        Text("Cart Page")
    }
}

#Preview {
    CartView(selectedTab: .constant("Cart"))
}
