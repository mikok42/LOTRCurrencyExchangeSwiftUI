//
//  ExchangeRate.swift
//  CurrencyConverter
//
//  Created by Linczewski, Mikolaj on 02/01/2023.
//

import SwiftUI

struct ExchangeRate: View {
    @State var leftImage: String
    @State var rightImage: String
    @State var text: String
    
    var body: some View {
        HStack {
            Image(leftImage)
                .resizable()
                .scaledToFit()
                .frame(width: 33)
            
            Text(text)
            
            Image(rightImage)
                .resizable()
                .scaledToFit()
                .frame(width: 33)
            
        }
    }
}

struct ExchangeRate_Previews: PreviewProvider {
    static var previews: some View {
        ExchangeRate(leftImage: "goldpenny", rightImage: "goldpiece", text: "kupa śmierdzi")
            .previewLayout(.sizeThatFits)
    }
}
