//
//  CartProduct.swift
//  Bayside Deli
//
//  Created by Harsh Makwana on 7/15/25.
//

import SwiftUI

struct CartProduct: View {
    var body: some View {
        ScrollView {
            HStack {
                
                HStack(alignment: .top) {
                    
                    //Image
                    Image("BLT")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 80, height: 80)
                        .clipShape(.rect(cornerRadius: 10))
                    
                   
                    VStack(alignment: .leading, spacing: 5) {
                        //sandwich details
                        HStack(alignment: .top) {
                            Text("Bacon Lettuce and Tomato")
                            Spacer()
                            Text("$ 8.99")
                        }
                        .foregroundStyle(.primaryText)
                        .font(.footnote)
                        .fontWeight(.semibold)
                        Text("On: Roll")
                            .font(.footnote)
                        Text("Add Ons: Lightly toasted sourdough bread, crispy bacon, fresh lettuce, and juicy tomatoes.")
                            .font(.caption2)
                            
                        
                        HStack() {
                            //quantity and remove button
                            Button {
                                
                            } label: {
                                HStack(spacing: 25) {
                                    Image(systemName: "plus")
                                    Text("1")
                                        .fontWeight(.medium)
                                    Image(systemName: "minus")
                                }
                                .foregroundStyle(.primaryText)
                                .padding(5)
                                .background(Color.white)
                                .clipShape(.rect(cornerRadius: 10))
                        
                            }
                            Spacer()
                            Button("Remove") {
                                
                            }
                            .foregroundStyle(.primaryText)
                            .fontWeight(.medium)
                            .padding(5)
                            .padding(.horizontal)
                            .background(Color.white)
                            .clipShape(.rect(cornerRadius: 10))
                        }
                    }
                }
              
            }
            .padding()
            .background(Color.gray.opacity(0.2))
            .clipShape(.rect(cornerRadius: 10))
            .padding(.horizontal)
            
            HStack {
                Text("Your Total: $ 8.99")
                    .fontWeight(.semibold)
            }
            .frame(maxWidth: .infinity, alignment: .trailing)
            .padding([.top, .horizontal])
          
           
            
            CreateButton(btnImage: "checkout", btnText: "Checkout", btnTextColor: .primaryText, btnBackgroundColor: .secondaryBtn)
                
        }
    }
}

#Preview {
    CartProduct()
//        .preferredColorScheme(.dark)
}
