//
//  AppetizerDetailView.swift
//  Appetizer
//
//  Created by Krystian Stachnik on 04/11/2023.
//

import SwiftUI

struct AppetizerDetailView: View {
    
    @EnvironmentObject var order: Order
    
    let appetizer: Appetizer
    @Binding var isShowingDetail: Bool
    
    var body: some View {
        VStack {
            VStack {
                AppetizerRemoteImage(urlString: appetizer.imageURL)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 300, height: 225)
                    .ignoresSafeArea(.all)
                
                VStack {
                    Text(appetizer.name)
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    Text(appetizer.description)
                        .multilineTextAlignment(.center)
                        .font(.body)
                        .padding()
                    
                    HStack(spacing: 30) {
                        NutritionIfno(title: "Calories", value: appetizer.calories)
                        NutritionIfno(title: "Protein", value: appetizer.protein)
                        NutritionIfno(title: "Carbs", value: appetizer.carbs)
                    }
                }
                
                Spacer()
                
                Button {
                    order.add(appetizer)
                    isShowingDetail = false
                } label: {
                    Text("$\(appetizer.price, specifier: "%.2f") - Add to Order")
                }
                .modifier(StandardButtonStyle())
            }
        }
        .frame(width: 300, height: 525, alignment: .center)
        .background(Color(.systemBackground))
        .clipShape(.rect(cornerRadius: 12))
        .shadow(radius: 40)
        .overlay(Button {
            isShowingDetail = false
        } label: {
            XDismissButton()
        }, alignment: .topTrailing)
        
    }
}

#Preview {
    AppetizerDetailView(appetizer: MockData.sampleAppetizer, isShowingDetail: .constant(true))
}


struct NutritionIfno: View {
    let title: String
    let value: Int
    
    var body: some View {
        VStack(spacing: 5) {
            Text(title)
                .bold()
                .font(.caption)
            
            Text("\(value)")
                .foregroundStyle(.secondary)
                .fontWeight(.semibold)
                .italic()
        }
    }
}
