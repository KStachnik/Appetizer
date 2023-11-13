//
//  RemoteImage.swift
//  Appetizer
//
//  Created by Krystian Stachnik on 03/11/2023.
//

import SwiftUI

@MainActor final class ImageLoader: ObservableObject {
   @Published var image: Image? = nil
    
    func load(fromURLString urlString: String) {
        Task {
            do {

                guard let uiImage = try await NetworkManager.shared.downloadImage(fromURLString: urlString) else {
                    return
                }
                image = Image(uiImage: uiImage)
                
            } catch {
                if let apError = error as? APError {
                    switch apError {
                    case .invalidURL:
                        print("invalidURL")
                    case .invalidResponse:
                        print("invalidResponse")
                    case .invalidData:
                        print("invalidData")
                    case .unableToComplete:
                        print("unableToComplete")
                    }
                } else {
                    print("error")
                }
            }
        }
    }
    
}

struct RemoteImage: View {
    var image: Image?
    
    var body: some View {
        image?.resizable() ?? Image("food-placeholder").resizable()
    }
    
}

struct AppetizerRemoteImage: View {
    
    @StateObject var imageLoader = ImageLoader()
    let urlString: String
    
    var body: some View {
        RemoteImage(image: imageLoader.image)
            .onAppear {
                imageLoader.load(fromURLString: urlString)
            }
    }
    
}
