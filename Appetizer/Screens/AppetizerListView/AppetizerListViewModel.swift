//
//  AppetizerListViewModel.swift
//  Appetizer
//
//  Created by Krystian Stachnik on 02/11/2023.
//

import SwiftUI

final class AppetizerListViewModel: ObservableObject {
    
    @Published private(set) var appetizers: [Appetizer] = []
    @Published var alertItem: AlertItem?
    @Published var isLoading = false
    @Published var isShowingDetail = false
    @Published var selectedAppetizer: Appetizer?
    
    func getAppetizers() {
        isLoading = true
        
        NetworkManager.shared.getAppetizers { result in
            DispatchQueue.main.async { [self] in
                isLoading = false
                
                switch result {
                    case .success(let appetizers):
                        self.appetizers = appetizers
                        
                    case .failure(let error):
                        switch error {
                            case .invalidResponse:
                                alertItem = AlertContext.invalidResponse
                            
                            case .invalidURL:
                                alertItem = AlertContext.invalidURL
                            
                            case .invalidData:
                                alertItem = AlertContext.invalidData
                            
                            case .unableToComplete:
                                alertItem = AlertContext.unableToComplete
                        }
                }
            }
        }
    }
    
}
