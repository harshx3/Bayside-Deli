//
//  Sandwich.swift
//  Bayside Deli
//
//  Created by Harsh Makwana on 7/7/25.
//

import Foundation

struct Sandwich: Identifiable, Decodable, Hashable {
    var id: String
    var name: String
    var sandwichImage: String
    var breadOptions: [String]
    var description: String
    var rollPrice: Double
    var heroPrice: Double
    var category: String
    

}

