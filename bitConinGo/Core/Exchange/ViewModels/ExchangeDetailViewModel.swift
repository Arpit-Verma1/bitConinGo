//
//  ExchangeDetailViewModel.swift
//  bitConinGo
//
//  Created by arpit verma on 13/08/25.
//

import Foundation
import SwiftUI
import Combine

class ExchangeDetailViewModel: ObservableObject {
    @Published var sendAmount: String = "2.640"
    @Published var receiveAmount: String = "₹ 4,65,006.44"
    @Published var selectedSendCurrency: String = "ETH"
    @Published var selectedReceiveCurrency: String = "INR"
    @Published var sendBalance: String = "10.254"
    @Published var receiveBalance: String = "4,35,804"
    @Published var exchangeRate: String = "1 ETH = ₹ 1,76,138.80"
    @Published var spread: String = "0.2%"
    @Published var gasFee: String = "₹ 422.73"
    @Published var netReceiveAmount: String = "₹ 1,75,716.07"
    
    let sendCurrencies = ["ETH", "BTC", "USDT", "BNB"]
    let receiveCurrencies = ["INR", "USD", "EUR", "GBP"]
    
    func swapCurrencies() {
        let tempCurrency = selectedSendCurrency
        let tempAmount = sendAmount
        let tempBalance = sendBalance
        
        selectedSendCurrency = selectedReceiveCurrency
        selectedReceiveCurrency = tempCurrency
        sendAmount = receiveAmount.replacingOccurrences(of: "₹ ", with: "")
        receiveAmount = "₹ \(tempAmount)"
        sendBalance = receiveBalance
        receiveBalance = tempBalance
        
        
        updateExchangeCalculations()
    }
    
    func updateExchangeCalculations() {
        
        if selectedSendCurrency == "ETH" && selectedReceiveCurrency == "INR" {
            exchangeRate = "1 ETH = ₹ 1,76,138.80"
            gasFee = "₹ 422.73"
            netReceiveAmount = "₹ 1,75,716.07"
        }
    }
    
    func performExchange() {
       
        print("Exchange initiated: \(sendAmount) \(selectedSendCurrency) to \(receiveAmount)")
    }
}



