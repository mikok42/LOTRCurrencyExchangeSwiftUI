//
//  SelectCurrency.swift
//  CurrencyConverter
//
//  Created by Linczewski, Mikolaj on 02/01/2023.
//

import SwiftUI

struct SelectCurrency: View {
    @Binding var selectedFromCurrency: Currency
    @Binding var selectedToCurrency: Currency
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack {
            Image("parchment")
                .resizable()
                .background(.brown)
                .ignoresSafeArea(.all)
            VStack {
                CurrencyList(titleText: "Select currency you are starting with", currencies: CurrencyViewModel.currencies, selectedCurrency: $selectedFromCurrency)
                    .padding(.horizontal, 10)
                CurrencyList(titleText: "Select currency you would like to convert to", currencies: CurrencyViewModel.currencies, selectedCurrency: $selectedToCurrency)
                    .padding(.horizontal, 10)
                Button("Done") {
                    dismiss()
                }
                .font(.title2)
                .padding(10)
                .foregroundColor(.white)
                .background(.brown)
                .cornerRadius(15)
            }
        }
    }
}

struct SelectCurrency_Previews: PreviewProvider {
    static var previews: some View {
        SelectCurrency(selectedFromCurrency: .constant(CurrencyViewModel.goldPenny), selectedToCurrency: .constant(CurrencyViewModel.copperPenny))
    }
}
