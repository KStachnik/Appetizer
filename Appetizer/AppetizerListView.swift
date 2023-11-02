//
//  AppetizerListView.swift
//  Appetizers
//
//  Created by Krystian Stachnik on 31/10/2023.
//

import SwiftUI

struct AppetizerListView: View {
    
    @StateObject var vm = AppetizerListViewModel()
    
    var body: some View {
        NavigationView {
            List(vm.appetizers) { appetizer in
                AppetizerListCell(appetizer: appetizer)
            }
            .navigationTitle("🌭Appetizers") 
        }
        .onAppear {
            vm.getAppetizers()
        }
    }
}

#Preview {
    AppetizerListView()
}
