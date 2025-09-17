//
//  CartManager.swift
//  Bayside Deli
//
//  Created by Harsh Makwana on 7/22/25.
//
import Foundation

class CartManager: ObservableObject {
    static let shared = CartManager()
    @Published var cartItems: [CartItem] = []
    
    func addToCart(sandwichName: String,
                   sandwichImage: String,
                   selectedBread: String,
                   sandwichFinalPrice: Double,
                   addOns: String) {
        // Check if the exact same item already exists in the cart
        if let index = cartItems.firstIndex(where: {
            $0.sandwichName == sandwichName &&
            $0.sandwichImage == sandwichImage &&
            $0.selectedBread == selectedBread &&
            $0.sandwichFinalPrice == sandwichFinalPrice &&
            $0.addOns == addOns
        }) {
            // If found, increment the quantity instead of adding a duplicate
            cartItems[index].quantity += 1
        } else {
            // If not found, create a new CartItem and append to the cart
            let item = CartItem(
                sandwichName: sandwichName,
                sandwichImage: sandwichImage,
                selectedBread: selectedBread,
                sandwichFinalPrice: sandwichFinalPrice,
                addOns: addOns,
                quantity: 1
            )
            cartItems.append(item)
        }
    }
    
    func increment(_ item: CartItem) {
        guard let i = cartItems.firstIndex(where: { $0.id == item.id }) else { return }
        cartItems[i].quantity += 1
    }
    
    func decrement(_ item: CartItem) {
        guard let i = cartItems.firstIndex(where: { $0.id == item.id }) else { return }
        cartItems[i].quantity = max(1, cartItems[i].quantity - 1)
    }
    
    func remove(_ item: CartItem) {
        cartItems.removeAll { $0.id == item.id }
    }
    
    var subtotal: Double {
        cartItems.reduce(0) { $0 + ($1.sandwichFinalPrice * Double($1.quantity)) }
    }
}
