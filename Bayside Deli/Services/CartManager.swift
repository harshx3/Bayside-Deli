//
//  CartManager.swift
//  Bayside Deli
//
//  Created by Harsh Makwana on 7/22/25.
//

import Foundation

class CartManager: ObservableObject {
    @Published var cartItems: [CartItem] = []
    
    func addToCart(sandwich: Sandwich, selectedBread: String, breadPrice: Double, extras: [String], extraPrice: Double) {
        let item = CartItem(sandwich: sandwich, selectedBread: selectedBread, addOns: extras.joined(separator: ", "), quantity: 1)
        cartItems.append(item)
    }
}
