//
//  AppetizerListView.swift
//  Appetizers
//
//  Created by Krystian Stachnik on 31/10/2023.
//

import SwiftUI

struct AppetizerListView: View {
    var body: some View {
        NavigationView {
            List(MockData.appetizers) { appetizer in
                AppetizerListCell(appetizer: appetizer)
            }
            .navigationTitle("🌭Appetizers") 
        }
    }
}

#Preview {
    AppetizerListView()
}
