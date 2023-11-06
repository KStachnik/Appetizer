//
//  EmptyState.swift
//  Appetizer
//
//  Created by Krystian Stachnik on 06/11/2023.
//

import SwiftUI

struct EmptyState: View {
    
    let imageName: String
    let message: String
    
    var body: some View {
        ZStack {
            Color(.systemBackground)
                .ignoresSafeArea(.all)
            
            VStack {
                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 150)
                
                Text(message)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.secondary)
            }
            .offset(y: -40)
        }
    }
}

#Preview {
    EmptyState(imageName: "empty-order", message: "Default Message")
}
