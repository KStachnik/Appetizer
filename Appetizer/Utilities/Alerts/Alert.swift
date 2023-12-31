//
//  Alert.swift
//  Appetizer
//
//  Created by Krystian Stachnik on 02/11/2023.
//

import SwiftUI

struct AlertItem: Identifiable {
    let id = UUID()
    let title: Text
    let message: Text
    let dissmissButton: Alert.Button
}

struct AlertContext {
    
    //MARK: - Network Alerts
    static let invalidData      = AlertItem(title: Text("Server Error"),
                                            message: Text("The data received from the server was invalid. Please contact support."),
                                            dissmissButton: .default(Text("OK")))
    
    static let invalidResponse  = AlertItem(title: Text("Server Error"),
                                            message: Text("Invalid response from the server. Please try again later or contact support."),
                                            dissmissButton: .default(Text("OK")))
    
    static let invalidURL       = AlertItem(title: Text("Server Error"),
                                            message: Text("There was an issue connecting ot the server. If this persist, please contact support."),
                                            dissmissButton: .default(Text("OK")))
    
    static let unableToComplete = AlertItem(title: Text("Server Error"),
                                            message: Text("Unable to complete your request at this time. Please check your internet connection."),
                                            dissmissButton: .default(Text("OK")))
    
    //MARK: - Account Alerts
    static let invalidForm = AlertItem(title: Text("InvalidForm"),
                                            message: Text("Please ensure all fields in the form have been filled out."),
                                            dissmissButton: .default(Text("OK")))
    
    static let invalidEmail = AlertItem(title: Text("Invalid Email"),
                                            message: Text("Please ensure your email is correct."),
                                            dissmissButton: .default(Text("OK")))
    
    static let userSaveSucces = AlertItem(title: Text("Profile Saved"),
                                            message: Text("Your profile information was succesfully saved."),
                                            dissmissButton: .default(Text("OK")))
    
    static let invalidUserData = AlertItem(title: Text("Profile Error"),
                                            message: Text("There was an error saving or retrieving your profile."),
                                            dissmissButton: .default(Text("OK")))
    
}
