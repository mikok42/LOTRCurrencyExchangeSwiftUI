//
//  ContentView.swift
//  CurrencyConverter
//
//  Created by Linczewski, Mikolaj on 02/01/2023.
//

import SwiftUI

struct ContentView: View {
    @State var selectedFromCurrency: Currency = CurrencyViewModel.goldPenny
    @State var selectedToCurrency: Currency = CurrencyViewModel.silverPiece
    @State var leftAmount = ""
    @State var rightAmount = ""
    @State var leftAmountTemp = ""
    @State var rightAmountTemp = ""
    @State var leftFieldTyping = false
    @State var rightFieldTyping = false
    @State var showSelectCurrency = false
    @State var infoTapped = false
    
    var body: some View {
        ZStack {
            Image("background")
                .resizable()
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Image("prancingpony")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
                    
                Text("Currency Exchange")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                
                HStack {
                    VStack {
                        HStack {
                            Image(selectedFromCurrency.iconName)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 33)
                            
                            Text(selectedFromCurrency.name)
                                .font(.headline)
                                .foregroundColor(.white)
                        }
                        .padding(.bottom, -5)
                        .onTapGesture {
                            showSelectCurrency.toggle()
                        }
                        .sheet(isPresented: $showSelectCurrency, onDismiss: updateValue) {
                            SelectCurrency(selectedFromCurrency: $selectedFromCurrency, selectedToCurrency: $selectedToCurrency)
                        }
                        
                        TextField("amount", text: $leftAmount, onEditingChanged: {
                            leftFieldTyping = $0
                            leftAmountTemp = leftAmount
                        })
                            .padding(7)
                            .background(Color(.lightGray))
                            .cornerRadius(7)
                            .multilineTextAlignment(.leading)
                            .keyboardType(.decimalPad)
                            .onChange(of: leftFieldTyping ? leftAmount : leftAmountTemp) { newValue in
                                guard let amount = Double(newValue) else { return }
                                rightAmount = String(amount * ( selectedFromCurrency => selectedToCurrency ))
                            }
                    }
                    
                    Image(systemName: "equal")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                    
                    VStack {
                        HStack {
                            Text(selectedToCurrency.name)
                                .font(.headline)
                                .foregroundColor(.white)
                            
                            Image(selectedToCurrency.iconName)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 33)
                        }
                        .padding(.bottom, -5)
                        .onTapGesture {
                            showSelectCurrency.toggle()
                        }
                        .sheet(isPresented: $showSelectCurrency, onDismiss: updateValue) {
                            SelectCurrency(selectedFromCurrency: $selectedFromCurrency, selectedToCurrency: $selectedToCurrency)
                        }
                        
                        
                        TextField("amount", text: $rightAmount, onEditingChanged: {
                            rightFieldTyping = $0
                            rightAmountTemp = rightAmount
                        })
                            .padding(7)
                            .background(Color(.lightGray))
                            .cornerRadius(7)
                            .multilineTextAlignment(.trailing)
                            .keyboardType(.decimalPad)
                            .onChange(of: rightFieldTyping ? rightAmount : rightAmountTemp) { newValue in
                                guard let amount = Double(newValue) else { return }
                                leftAmount = String(amount * ( selectedToCurrency => selectedFromCurrency ))
                            }
                    }
                }
                .padding()
                .background(.black.opacity(0.5))
                .cornerRadius(50)
                
                Spacer()
                HStack {
                    Spacer()
                    Button {
                        infoTapped.toggle()
                    } label: {
                        Image(systemName: "info.circle.fill")
                    }
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .padding(.trailing)
                    .sheet(isPresented: $infoTapped) {
                        ExchangeInfo()
                    }
                }
                
            }
        }
    }
    
    private func updateValue() {
        guard let amount = Double(leftAmount) else { return }
        rightAmount = String(amount * ( selectedFromCurrency => selectedToCurrency ))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
