//
//  CurrencyViewModel.swift
//  CurrencyConverter
//
//  Created by Linczewski, Mikolaj on 02/01/2023.
//

import Foundation

class CurrencyViewModel {
    static let goldPiece = Currency(name: "Gold Piece", iconName: "goldpiece", absoluteValue: 6400)
    static let goldPenny = Currency(name: "Gold Penny", iconName: "goldpenny", absoluteValue: 1600)
    static let silverPiece = Currency(name: "Silver Piece", iconName: "silverpiece", absoluteValue: 400)
    static let silverPenny = Currency(name: "Silver Penny", iconName: "silverpenny", absoluteValue: 100)
    static let copperPenny = Currency(name: "Copper Penny", iconName: "copperpenny", absoluteValue: 1)
    
    static let currencies: [Currency] = [
        goldPiece, goldPenny, silverPiece, silverPenny, copperPenny
    ]
}
