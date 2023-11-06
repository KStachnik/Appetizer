//
//  OrderView.swift
//  Appetizers
//
//  Created by Krystian Stachnik on 31/10/2023.
//

import SwiftUI

struct OrderView: View {
    
    @State private var orderItems = MockData.appetizers
    
    
    var body: some View {
        
        NavigationView {
            ZStack {
                VStack {
                    List {
                        ForEach(orderItems) { appetizer in
                            AppetizerListCell(appetizer: appetizer)
                        }
                        .onDelete(perform: { indexSet in
                            orderItems.remove(atOffsets: indexSet)
                        })
                    }
                    .listStyle(.plain)
                    
                    Button {
                        print("xpp")
                    } label: {
                        APButton(title: "30xpp - Place Order")
                            .padding(.top)
                    }.padding(.bottom, 10)
                }
                
                if orderItems.isEmpty {
                    EmptyState(imageName: "empty-order",
                               message: "You have no items in your order.\n Please add an appetizer!")
                }
            }
            .navigationTitle("🧾 Orders")
        }
        
    }
    
    func deleteItems(at offsets: IndexSet) {
        orderItems.remove(atOffsets: offsets)
    }
    
}

#Preview {
    OrderView()
}
