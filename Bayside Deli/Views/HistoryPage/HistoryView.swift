//
//  HistoryView.swift
//  Bayside Deli
//
//  Created by Harsh Makwana on 7/9/25.
//

import SwiftUI

struct HistoryView: View {
    @Binding var selectedTab: String
    var body: some View {
        Text("History Page")
    }
}

#Preview {
    HistoryView(selectedTab: .constant("History"))
}
