//
//  CartItem.swift
//  Bayside Deli
//
//  Created by Harsh Makwana on 7/22/25.
//
import Foundation

struct CartItem: Identifiable, Hashable {
    
    let id = UUID()
    var sandwichName: String
    var sandwichImage: String
    var selectedBread: String
    var sandwichFinalPrice: Double
    var addOns: String
    var quantity: Int
}
