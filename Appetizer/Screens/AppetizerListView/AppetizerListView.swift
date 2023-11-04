//
//  AppetizerListView.swift
//  Appetizers
//
//  Created by Krystian Stachnik on 31/10/2023.
//

import SwiftUI

struct AppetizerListView: View {
    
    @StateObject var vm = AppetizerListViewModel()
    @State private var isShowingDetail = false
    @State private var selectedAppetizer: Appetizer?
    
    var body: some View {
        
        ZStack {
            NavigationView {
                List(vm.appetizers) { appetizer in
                    AppetizerListCell(appetizer: appetizer)
                        .onTapGesture {
                            selectedAppetizer = appetizer
                            isShowingDetail = true
                        }
                }
                .navigationTitle("🌭Appetizers")
                .disabled(isShowingDetail)
            }
            .onAppear {
                vm.getAppetizers()
            }
            .blur(radius: isShowingDetail ? 20 : 0)
            
            if isShowingDetail {
                AppetizerDetailView(appetizer: selectedAppetizer!, isShowingDetail: $isShowingDetail)
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
