//
//  Currency.swift
//  CurrencyConverter
//
//  Created by Linczewski, Mikolaj on 02/01/2023.
//

import Foundation

infix operator =>

struct Currency {
    let name: String
    let iconName: String
    let absoluteValue: Double
    
    static func =>(lhs: Currency, rhs: Currency) -> Double {
        Double(lhs.absoluteValue / rhs.absoluteValue)
    }
    
    static func >(lhs: Currency, rhs: Currency) -> Bool {
        lhs.absoluteValue > rhs.absoluteValue
    }
}
