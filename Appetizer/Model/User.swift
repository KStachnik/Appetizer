//
//  User.swift
//  Appetizer
//
//  Created by Krystian Stachnik on 05/11/2023.
//

import Foundation

struct User: Codable {
    var firstName       = ""
    var lastName        = ""
    var email           = ""
    var birthdate       = Date()
    var extraNapkins    = false
    var frequentRefills = false
}
