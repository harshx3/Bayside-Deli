//
//  CreateButton.swift
//  Bayside Deli
//
//  Created by Harsh Makwana on 7/12/25.
//

import SwiftUI

struct CreateButton: View {
    
    var btnImage: String
    var btnText: String
    var btnTextColor: Color
    var btnBackgroundColor: Color
    
    var body: some View {
        Button {
            
        } label: {
            HStack(alignment: .center) {
                Image(btnImage)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30)
                Text(btnText)
                    .foregroundStyle(btnTextColor)
                    .fontWeight(.medium)
                    .font(.headline)
            }
            .padding()
            
        }
        .frame(maxWidth: .infinity)
        .background(btnBackgroundColor)
        .clipShape(.buttonBorder)
        .padding(.horizontal)
        
    }
}

#Preview {
    CreateButton(btnImage: "Cart", btnText: "Add to Cart", btnTextColor: .primaryText, btnBackgroundColor: .primaryBtn)
}
