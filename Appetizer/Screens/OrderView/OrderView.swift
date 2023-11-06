//
//  OrderView.swift
//  Appetizers
//
//  Created by Krystian Stachnik on 31/10/2023.
//

import SwiftUI

struct OrderView: View {
    
    @EnvironmentObject private var order: Order
    
    var body: some View {
        
        NavigationView {
            ZStack {
                VStack {
                    List {
                        ForEach(order.items) { appetizer in
                            AppetizerListCell(appetizer: appetizer)
                        }
                        .onDelete(perform: order.deleteItems)
                    }
                    .listStyle(.plain)
                    
                    Button {
                        print("xpp")
                    } label: {
                        APButton(title: "\(order.totalprice, specifier: "%.2f")$ - Place Order")
                            .padding(.top)
                    }.padding(.bottom, 10)
                }
                
                if order.items.isEmpty {
                    EmptyState(imageName: "empty-order",
                               message: "You have no items in your order.\n Please add an appetizer!")
                }
            }
            .navigationTitle("🧾 Orders")
        }
        
    }
}

#Preview {
    OrderView()
}
