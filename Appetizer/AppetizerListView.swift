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
        
        ZStack {
            NavigationView {
                List(vm.appetizers) { appetizer in
                    AppetizerListCell(appetizer: appetizer)
                }
                .navigationTitle("🌭Appetizers")
            }
            .onAppear {
                vm.getAppetizers()
            }
            
            if vm.isLoading {
                ProgressView()
                      .progressViewStyle(CircularProgressViewStyle(tint: .brandPrimary))
                      .scaleEffect(2.0, anchor: .center)
            }
            
        }
        .alert(item: $vm.alertItem){ alertItem in
            Alert(title: alertItem.title,
                  message: alertItem.message,
                  dismissButton: alertItem.dissmissButton)
        }
        
    }
}

#Preview {
    AppetizerListView()
}
