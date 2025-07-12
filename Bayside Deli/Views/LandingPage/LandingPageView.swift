//
//  LandingPageView.swift
//  Bayside Deli
//
//  Created by Harsh Makwana on 7/11/25.
//

import SwiftUI

struct LandingPageView: View {
    var body: some View {
        ZStack {
            Image("LandingImage")
                .resizable()
                .scaledToFill()
                .padding(.trailing, 60)
                .ignoresSafeArea()
        
            VStack(spacing: 15){
                Spacer()
                
                CreateButton(
                btnImage: "email",
                btnText: "Log in with Email",
                btnTextColor: .white,
                btnBackgroundColor: .black.opacity(0.9))
                
                CreateButton(
                btnImage: "signup",
                btnText: "New to Bayside? Sign Up",
                btnTextColor: .black,
                btnBackgroundColor: .white.opacity(0.9))
                          
            }
            .padding(.bottom, 20)
                    
        }

    }
}

#Preview {
    LandingPageView()
}
