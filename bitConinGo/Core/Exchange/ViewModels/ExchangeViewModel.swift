//
//  ExchangeViewModel.swift
//  bitConinGo
//
//  Created by arpit verma on 13/08/25.
//

import Foundation
import SwiftUI
import Combine

class ExchangeViewModel: ObservableObject {
    @Published var totalBalance: String = "1,57,342.05"
    @Published var currency: String = "INR"
    @Published var dailyChange: String = "₹1,342"
    @Published var percentageChange: String = "+4.6%"
    @Published var isPositiveChange: Bool = true
    
    
    @Published var recentTransactions: [ExchangeTransaction] = [
        ExchangeTransaction(
            type: "Recieve",
            symbol: "BTC",
            icon: "arrow.down.circle.fill",
            iconColor: .gray,
            date: "20 March",
            amount: "+0.002126"
        ),
        ExchangeTransaction(
            type: "Sent",
            symbol: "ETH",
            icon: "arrow.up.circle.fill",
            iconColor: .gray,
            date: "19 March",
            amount: "+0.003126"
        ),
        ExchangeTransaction(
            type: "Send",
            symbol: "LTC",
            icon: "arrow.up.circle.fill",
            iconColor: .gray,
            date: "18 March",
            amount: "+0.02126"
        )
    ]
    
    func sendAction() {
       
    }
    
    func addAction() {
      
    }
    
    func receiveAction() {
       
    }
}

struct ExchangeTransaction {
    let type: String
    let symbol: String
    let icon: String
    let iconColor: Color
    let date: String
    let amount: String
}
