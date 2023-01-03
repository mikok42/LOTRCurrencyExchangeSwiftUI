//
//  ExchangeInfo.swift
//  CurrencyConverter
//
//  Created by Linczewski, Mikolaj on 02/01/2023.
//

import SwiftUI

struct ExchangeInfo: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack {
            Image("parchment")
                .resizable()
                .ignoresSafeArea(.all)
                .background(.brown)
            
            VStack {
                Text("Exchange Rates")
                    .font(.largeTitle)
                
                Text("Here at the Prancing Pony, we are happy to offer you a place where you can exchange all the known currencies in the entire world except one. We used to take Brandy Bucks, but after finding out that it was a person instead of a piece of paper, we realized it had no value to us. Below is a simple guide to our currency exchange rates")
                    .multilineTextAlignment(.leading)
                    .padding(.horizontal, 15)
                    .font(.title2)
                let currencies = CurrencyViewModel.currencies.sorted(by: >)
                ForEach(0..<currencies.count - 1, id: \.self) { i in
                    let text = "1 " + String(currencies[i].name) + " = " + String(Int(currencies[i] => currencies[i+1])) + " " + currencies[i+1].name
                    ExchangeRate(leftImage: currencies[i].iconName, rightImage: currencies[i+1].iconName, text: text)
                }
                
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
        .foregroundColor(.black)
    }
}

struct ExchangeInfo_Previews: PreviewProvider {
    static var previews: some View {
        ExchangeInfo()
    }
}
