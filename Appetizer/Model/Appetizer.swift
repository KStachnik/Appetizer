//
//  Appetizer.swift
//  Appetizer
//
//  Created by Krystian Stachnik on 01/11/2023.
//

import Foundation

struct Appetizer: Decodable, Identifiable {
    let id: Int
    let name : String
    let description : String
    let price : Double
    let imageURL : String
    let calories : Int
    let protein : Int
    let carbs : Int
}

struct AppetizerResponse: Decodable {
    let request: [Appetizer]
}

struct MockData {
    static let sampleAppetizer = Appetizer(id: 0001,
                                           name: "Test Appetizer",
                                           description: "Desription for Appetizer. Pretty yummy.",
                                           price: 9.98,
                                           imageURL: "",
                                           calories: 103,
                                           protein: 64,
                                           carbs:  81)
    
    static let sampleAppetizer1 = Appetizer(id: 0002,
                                           name: "Test Appetizer",
                                           description: "Desription for Appetizer. Pretty yummy.",
                                           price: 9.98,
                                           imageURL: "",
                                           calories: 103,
                                           protein: 64,
                                           carbs:  81)
    
    static let sampleAppetizer2 = Appetizer(id: 0002,
                                           name: "Test Appetizer",
                                           description: "Desription for Appetizer. Pretty yummy.",
                                           price: 9.98,
                                           imageURL: "",
                                           calories: 103,
                                           protein: 64,
                                           carbs:  81)
    
    static let appetizers = [sampleAppetizer, sampleAppetizer1, sampleAppetizer2]
}
