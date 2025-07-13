//
//  SandwichDetailView.swift
//  Bayside Deli
//
//  Created by Harsh Makwana on 7/11/25.
//

import SwiftUI

struct SandwichDetailsView: View {
    
    @State var sandwichName: String
    @State var sandwichPrice: Double
    @State var sandwichDescription: String
    @State var sandwichImage: String
    @State var breadPrice: Double
    @State var extraPrice: Double
   
  
    var finalPrice: Double {
        sandwichPrice + breadPrice + extraPrice
    }
 
    var body: some View {
        ZStack {
            Color("Background").ignoresSafeArea()
            VStack {
                Image(sandwichImage)
                    .resizable()
                    .scaledToFit()
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                   
                
                
                
                HStack {
                    Text(sandwichName)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .foregroundStyle(.primaryText)
                    
                    Text(String(format: "$ %.2f", finalPrice))
                        .foregroundStyle(.primaryBtn)
                }
                .font(.system(size: 25, weight: .bold, design: .rounded))
                .padding(.horizontal)
                .padding(.top)
                
                
                // Bread Type
                ScrollView {
                    Text(sandwichDescription)
                        .foregroundStyle(.primaryText.opacity(0.8))
                        .font(.headline)
                        .multilineTextAlignment(.center)
                        .scaleEffect(0.9)
                    
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
    SandwichDetailsView(sandwichName: "Bacon Egg and Cheese", sandwichPrice: 5.99, sandwichDescription: "Crispy Bacon, Fried Egg, Melted American Cheese",  sandwichImage: "BLT", breadPrice: 0.0, extraPrice: 0.0)
}
