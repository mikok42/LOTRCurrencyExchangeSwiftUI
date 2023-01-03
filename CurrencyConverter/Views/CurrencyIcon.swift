//
//  CurrencyIcon.swift
//  CurrencyConverter
//
//  Created by Linczewski, Mikolaj on 02/01/2023.
//

import SwiftUI

struct CurrencyIcon: View {
    @State var currencyName: String
    @State var currencyIcon: String
    
    var body: some View {
        ZStack {
            Image(currencyIcon)
                .resizable()
                .scaledToFit()
            VStack {
                Spacer()
                Text(currencyName)
                    .font(.caption)
                    .padding(3)
                    .background(.brown.opacity(0.75))
            }
        }
        .padding(3)
        .frame(width: 100, height: 100)
        .background(.brown)
        .cornerRadius(25)
    }
}

struct CurrencyIcon_Previews: PreviewProvider {
    static var previews: some View {
        CurrencyIcon(currencyName: "Gold Piece", currencyIcon: "goldpiece")
            .previewLayout(.sizeThatFits)
    }
}
