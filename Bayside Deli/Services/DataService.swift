//
//  DataService.swift
//  Bayside Deli
//
//  Created by Harsh Makwana on 7/7/25.
//

import Foundation

class DataService: ObservableObject {
    @Published var allSandwiches: [Sandwich] = []
    @Published var sandwiches: [Sandwich] = []
    
    init() {
        loadSandwiches()
    }
    
    func loadSandwiches() {
        if let url = Bundle.main.url(forResource: "menu", withExtension: "json") {
            print("✅ Found menu.json at: \(url)")
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                allSandwiches = try decoder.decode([Sandwich].self, from: data)
                sandwiches = allSandwiches
//                print("✅ Loaded \(sandwiches.count) sandwiches")
//                for s in sandwiches {
//                    print(" - \(s.name)")
//                }
            } catch {
                print("❌ Error decoding JSON: \(error)")
            }
        } else {
            print("❌ Could not find menu.json in bundle.")
        }
    }

 
  
}


