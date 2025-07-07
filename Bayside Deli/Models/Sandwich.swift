//
//  Sandwich.swift
//  Bayside Deli
//
//  Created by Harsh Makwana on 7/7/25.
//

import Foundation

struct Sandwich: Identifiable, Codable {
    var id: String
    var name: String
    var breadOptions: [String]
    var proteinOptions: [String]
    var description: String
    var priceRoll: Double
    var priceHero: Double

}
