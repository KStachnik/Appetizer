//
//  APButton.swift
//  Appetizer
//
//  Created by Krystian Stachnik on 04/11/2023.
//

import SwiftUI

struct APButton: View {
    
    let title: LocalizedStringKey
    
    var body: some View {
        Text(title)
            .font(.title3)
            .fontWeight(.semibold)
            .frame(width: 260, height: 50)
            .foregroundStyle(.white)
            .background(.brandPrimary)
            .clipShape(.rect(cornerRadius: 10))
        .padding(.bottom, 30)
    }
}

#Preview {
    APButton(title: "Sample title")
}
