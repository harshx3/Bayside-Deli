//
//  ProfileView.swift
//  Bayside Deli
//
//  Created by Harsh Makwana on 7/9/25.
//

import SwiftUI

struct ProfileView: View {
    @Binding var selectedTab: String
    var body: some View {
        Text("Profile Page")
    }
}

#Preview {
    ProfileView(selectedTab: .constant("Profile"))
}
