//
//  AppetizerDetailView.swift
//  Appetizer
//
//  Created by Krystian Stachnik on 04/11/2023.
//

import SwiftUI

struct AppetizerDetailView: View {
    
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
                        
                        HStack(spacing: 35) {
                            VStack(spacing: 5) {
                                Text("Calories")
                                    .bold()
                                    .font(.caption)
                                
                                Text("\(appetizer.calories)")
                                    .foregroundStyle(.secondary)
                                    .fontWeight(.semibold)
                                    .italic()
                            }
                            
                            VStack(spacing: 5) {
                                Text("Carbs")
                                    .bold()
                                    .font(.caption)
                                
                                Text("\(appetizer.carbs)")
                                    .foregroundStyle(.secondary)
                                    .fontWeight(.semibold)
                                    .italic()
                            }
                            
                            VStack(spacing: 5) {
                                Text("Protein")
                                    .bold()
                                    .font(.caption)
                                
                                Text("\(appetizer.protein)")
                                    .foregroundStyle(.secondary)
                                    .fontWeight(.semibold)
                                    .italic()
                            }
                        }
                    }
                    
                    Spacer()
                    
                    Button {
                        print("tapped")
                    } label: {
                        Text("$\(appetizer.price, specifier: "%.2f") - Add to Order")
                            .font(.title3)
                            .fontWeight(.semibold)
                            .frame(width: 260, height: 50)
                            .foregroundStyle(.white)
                            .background(.brandPrimary)
                            .clipShape(.rect(cornerRadius: 10))
                    }
                    .padding(.bottom, 30)
                    
                }
                
            }
            .frame(width: 300, height: 525, alignment: .center)
            .background(Color(.systemBackground))
            .clipShape(.rect(cornerRadius: 12))
            .shadow(radius: 40)
            .overlay(Button {
                isShowingDetail = false
            } label: {
                ZStack {
                    Circle()
                        .frame(width: 30, height: 30)
                        .foregroundStyle(.white)
                        .opacity(0.6)
                    
                    Image(systemName: "xmark")
                        .imageScale(.small)
                        .frame(width: 44, height: 44)
                        .foregroundStyle(.black)
                }
            }, alignment: .topTrailing)
            
    }
}

#Preview {
    AppetizerDetailView(appetizer: MockData.sampleAppetizer, isShowingDetail: .constant(true))
}