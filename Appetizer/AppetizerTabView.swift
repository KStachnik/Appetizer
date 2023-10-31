//
//  ContentView.swift
//  Appetizers
//
//  Created by Krystian Stachnik on 31/10/2023.
//

import SwiftUI

struct AppetizerTabView: View {
    var body: some View {
        TabView {
            AppetizerListView()
                .tabItem {
                    Image(systemName: "house")
                        .foregroundStyle(Color(.black))
                    Text("Home")
                }
            
            AccountView()
                .tabItem {
                    Image(systemName: "person")
                        .foregroundStyle(Color(.black))
                    Text("Account")
                }
            
            OrderView()
                .tabItem {
                    Image(systemName: "bag")
                        .foregroundStyle(Color(.black))
                    Text("Order")
                }
        }
        .tint(Color("brandPrimary"))
    }
}

#Preview {
    AppetizerTabView()
}
