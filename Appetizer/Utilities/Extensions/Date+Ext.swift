//
//  Date+Ext.swift
//  Appetizer
//
//  Created by Krystian Stachnik on 09/11/2023.
//

import Foundation

extension Date {
    var eighteenYearsAgo: Date {
        Calendar.current.date(byAdding: .year, value: -18, to: Date())!
    }
    
    
    var oneHundreadFiftyYearsAgo: Date {
        Calendar.current.date(byAdding: .year, value: -150, to: Date())!
    }
}
