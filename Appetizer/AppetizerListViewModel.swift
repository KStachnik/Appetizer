//
//  AppetizerListViewModel.swift
//  Appetizer
//
//  Created by Krystian Stachnik on 02/11/2023.
//

import SwiftUI

final class AppetizerListViewModel: ObservableObject {
    
    @Published private(set) var appetizers: [Appetizer] = []
    
    func getAppetizers() {
        NetworkManager.shared.getAppetizers { result in
            DispatchQueue.main.async {
                switch result {
                    
                case .success(let appetizers):
                    self.appetizers = appetizers
                    
                case .failure(let error):
                    print(error.localizedDescription)
                    
                }
            }
        }
    }
    
}
