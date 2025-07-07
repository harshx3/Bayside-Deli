//
//  DataService.swift
//  Bayside Deli
//
//  Created by Harsh Makwana on 7/7/25.
//

import Foundation

class DataService {
    static func loadSandwiches() -> [Sandwich] {
        guard let url = Bundle.main.url(forResource: "menu", withExtension: "json"),
              let data = try? Data(contentsOf: url),
              let sandwiches = try? JSONDecoder().decode([Sandwich].self, from: data) else {
            print("Failed to load or decode menu.json")
            return []
        }
        return sandwiches
    }
}
