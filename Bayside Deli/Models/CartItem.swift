//
//  CartItem.swift
//  Bayside Deli
//
//  Created by Harsh Makwana on 7/22/25.
//
import Foundation

struct CartItem: Identifiable, Hashable {
    
    let id = UUID()
    var sandwich: Sandwich
    var selectedBread: String
    var addOns: String
    var quantity: Int
}
