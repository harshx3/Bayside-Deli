//
//  SandwichDetailView.swift
//  Bayside Deli
//
//  Created by Harsh Makwana on 7/11/25.
//

import SwiftUI

struct SandwichDetailsView: View {
    
 
    @State var sandwichPrice = 8.99
    @State var breadPrice: Double = 0.0
    @State var extraPrice: Double = 0.0
    @Binding var selectedTab: String
  
    var finalPrice: Double {
        sandwichPrice + breadPrice + extraPrice
    }
 
    var body: some View {
        ZStack {
            VStack {
                Image(.BLT)
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                
                
                
                HStack {
                    Text("Bacon Egg and Cheese")
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Text(String(format: "$ %.2f", finalPrice))
                        .foregroundStyle(.primaryBtn)
                }
                .font(.system(size: 25, weight: .bold, design: .rounded))
                .padding(.horizontal)
                .padding(.top, -15)
                
                
                // Bread Type
                ScrollView {
                    AddOnCheckboxView(
                        title: "Select Your Bread",
                        options: [
                            ("Roll", 0.0, false),
                            ("Hero", 1.99, false),
                            ("Wrap", 2.49, false)
                        ],
                        selectionType: .single,
                        selectedPrice: $breadPrice
                    )
                    
                    AddOnCheckboxView(
                        title: "Extras",
                        options: [
                            ("Lettuce", 0.50, false),
                            ("Tomato", 0.50, false),
                            ("Onion", 0.50, false),
                            ("Pickle", 0.50, false),
                            ("Jalapeno", 0.50, false),
                            ("Avocado", 1.00, false)
                        ],
                        selectionType: .multiple,
                        selectedPrice: $extraPrice)
                }
                .padding(.bottom, 80)
                
            }
            
            VStack {
                CreateButton(btnImage: "Cart", btnText: "Add to Cart", btnTextColor: .primaryText, btnBackgroundColor: .primaryBtn)
            }
            .frame(maxHeight: .infinity, alignment: .bottom)
            
           
        }
        
    }
}

#Preview {
    SandwichDetailsView(selectedTab: .constant("History"))
}
