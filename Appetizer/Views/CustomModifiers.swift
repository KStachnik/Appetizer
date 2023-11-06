//
//  CustomModifiers.swift
//  Appetizer
//
//  Created by Krystian Stachnik on 06/11/2023.
//

import SwiftUI

struct StandardButtonStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .buttonStyle(.bordered)
            .tint(.brandPrimary)
            .controlSize(.large)
            .padding(.bottom)
    }
}

 
