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
                        .onTapGesture {
                            vm.selectedAppetizer = appetizer
                            vm.isShowingDetail = true
                        }
                }
                .navigationTitle("🌭Appetizers")
                .disabled(vm.isShowingDetail)
            }
            .onAppear {
                vm.getAppetizers()
            }
            .blur(radius: vm.isShowingDetail ? 20 : 0)
            
            if vm.isShowingDetail {
                AppetizerDetailView(appetizer: vm.selectedAppetizer!, isShowingDetail: $vm.isShowingDetail)
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
