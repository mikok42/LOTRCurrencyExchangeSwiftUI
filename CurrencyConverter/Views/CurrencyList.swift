//
//  CurrencyList.swift
//  CurrencyConverter
//
//  Created by Linczewski, Mikolaj on 02/01/2023.
//

import SwiftUI

struct CurrencyList: View {
    @State var titleText: String
    @State var gridlayout = [GridItem(), GridItem(), GridItem()]
    @State var currencies: [Currency]
    @Binding var selectedCurrency: Currency
    
    var body: some View {
        VStack {
            Text(titleText)
                .font(.title2)
                .foregroundColor(.black)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
            
            LazyVGrid(columns: gridlayout) {
                ForEach(currencies, id: \.iconName) { element in
                    if element.name == selectedCurrency.name {
                        CurrencyIcon(currencyName: element.name, currencyIcon: element.iconName)
                            .overlay(RoundedRectangle(cornerRadius: 25)
                                .stroke(lineWidth: 3)
                                .opacity(0.5))
                            .shadow(color: .black, radius: 9)
                    } else {
                        CurrencyIcon(currencyName: element.name, currencyIcon: element.iconName)
                            .onTapGesture {
                                selectedCurrency = element
                            }
                    }
                    
                }
            }
            .lineSpacing(5)
        }
    }
}

struct CurrencyList_Previews: PreviewProvider {
    static var previews: some View {
        CurrencyList(titleText: "This is a title text", currencies: CurrencyViewModel.currencies, selectedCurrency: .constant(CurrencyViewModel.goldPenny))
    }
}
