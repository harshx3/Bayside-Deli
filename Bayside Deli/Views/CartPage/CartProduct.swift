//
//  CartProduct.swift
//  Bayside Deli
//
//  Created by Harsh Makwana on 7/15/25.
//

import SwiftUI

struct CartProduct: View {
    @EnvironmentObject var cartManager: CartManager
    
    var body: some View {
        ZStack {
            Color("Background").ignoresSafeArea()
            
            VStack(spacing: 16) {
                if cartManager.cartItems.isEmpty {
                    VStack(spacing: 12) {
                        Image(systemName: "cart")
                            .font(.system(size: 48, weight: .regular))
                            .foregroundStyle(.secondary)
                        Text("Your cart is empty")
                            .font(.title3.weight(.semibold))
                            .foregroundStyle(.secondaryText)
                        Text("Add a sandwich to get started.")
                            .font(.subheadline)
                            .foregroundStyle(.secondaryText.opacity(0.7))
                    }
                    .padding(.top, 48)
                    Spacer()
                } else {
                    ScrollView {
                        VStack(spacing: 12) {
                            ForEach(cartManager.cartItems, id: \.self) { item in
                                CartItemCard(item: item)
                            }
                        }
                        .padding(.horizontal, 16)
                        .padding(.top, 8)
                    }
                    
                    // Summary & Checkout
                    VStack(spacing: 12) {
                        HStack {
                            Text("Subtotal")
                                .foregroundStyle(.secondaryText)
                            Spacer()
                            Text(cartManager.subtotal, format: .currency(code: "USD"))
                                .fontWeight(.semibold)
                                .foregroundStyle(.primaryText)
                        }
                        .padding(.horizontal, 16)
                        
                        CreateButton(
                            btnImage: "checkout",
                            btnText: "Checkout",
                            btnTextColor: .primaryText,
                            btnBackgroundColor: .secondaryBtn
                        )
                        .padding(.horizontal, 16)
                    }
                    .padding(.bottom, 100)
                }
            }
        }
        .navigationTitle("Your Cart")
        .navigationBarTitleDisplayMode(.inline)
    }
}

private struct CartItemCard: View {
    @EnvironmentObject var cartManager: CartManager
    let item: CartItem
    
    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            Image(item.sandwichImage)
                .resizable()
                .scaledToFill()
                .frame(width: 76, height: 76)
                .clipShape(RoundedRectangle(cornerRadius: 12))
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .strokeBorder(Color.black.opacity(0.05))
                )
            
            VStack(alignment: .leading, spacing: 6) {
                HStack(alignment: .top) {
                    Text(item.sandwichName)
                        .font(.subheadline.weight(.semibold))
                        .foregroundStyle(.primaryText)
                        .lineLimit(2)
                    
                    Spacer()
                    
                    Text((item.sandwichFinalPrice * Double(item.quantity)),
                         format: .currency(code: "USD"))
                    .font(.subheadline.weight(.bold))
                    .foregroundStyle(.primaryText)
                }
                
                Text("On: \(item.selectedBread)")
                    .font(.caption)
                    .foregroundStyle(.secondaryText)
                if !item.addOns.isEmpty {
                    Text("Add-ons: \(item.addOns)")
                        .font(.caption2)
                        .foregroundStyle(.secondaryText)
                        .lineLimit(2)
                }
                
                HStack(spacing: 10) {
                    HStack(spacing: 18) {
                        Button {
                            cartManager.increment(item)
                        } label: {
                            Image(systemName: "plus")
                                .font(.subheadline)
                        }
                        Text("\(item.quantity)")
                            .font(.subheadline.weight(.medium))
                        Button {
                            cartManager.decrement(item)
                        } label: {
                            Image(systemName: "minus")
                                .font(.subheadline)
                        }
                    }
                    .foregroundStyle(.primaryText)
                    .padding(.vertical, 6)
                    .padding(.horizontal, 12)
                    .background(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    
                    Spacer()
                    
                    Button {
                        cartManager.remove(item)
                    } label: {
                        Text("Remove")
                            .font(.subheadline.weight(.medium))
                            .foregroundStyle(.primaryText)
                            .padding(.vertical, 6)
                            .padding(.horizontal, 12)
                            .background(.white)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    }
                }
                .padding(.top, 2)
            }
        }
        .padding(12)
        .background(Color.gray.opacity(0.12))
        .clipShape(RoundedRectangle(cornerRadius: 14))
    }
}

#Preview("Empty Cart") {
    // NOTE: In production, CartManager should be shared from ContentView root.
    NavigationStack {
        CartProduct()
    }
    .environmentObject(CartManager())
}

#Preview("Filled Cart") {
    // NOTE: This preview is for UI purposes only; real app should share CartManager instance.
    let manager = CartManager()
    manager.cartItems = [
        CartItem(
            sandwichName: "Bacon Egg & Cheese",
            sandwichImage: "BLT",
            selectedBread: "Roll",
            sandwichFinalPrice: 6.99,
            addOns: "Lettuce, Tomato, Mayo",
            quantity: 1
        ),
        CartItem(
            sandwichName: "Turkey Avocado",
            sandwichImage: "TurkeyAvocado",
            selectedBread: "Hero",
            sandwichFinalPrice: 9.49,
            addOns: "Onion, Pickle, Jalapeno",
            quantity: 2
        )
    ]
    
    return NavigationStack {
        CartProduct()
    }
    .environmentObject(manager)
}
