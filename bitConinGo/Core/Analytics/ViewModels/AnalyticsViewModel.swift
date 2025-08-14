//
//  AnalyticsViewModel.swift
//  bitConinGo
//
//  Created by arpit verma on 12/08/25.
//

import Foundation
import SwiftUI
import Combine

class AnalyticsViewModel: ObservableObject {
    @Published var portfolioValue: String = "₹ 1,57,342.05"
    @Published var isBitcoinMode: Bool = true
    @Published var isLoading: Bool = false
    @Published var selectedTimeframe: Timeframe = .sixMonths
    
    
    @Published var chartData: [Double] = [120000, 125000, 118000, 135000, 142000, 138000, 145000, 157342]
    @Published var chartDate: String = "24 March"
    @Published var chartValue: String = "₹ 1,42,340"
    
   
    @Published var holdings: [CryptoHolding] = [
        CryptoHolding(
            name: "Bitcoin",
            symbol: "BTC",
            value: "₹ 75,62,502.14",
            percentageChange: "+3.2%",
            icon: "bitcoinsign.circle.fill",
            iconColor: .orange
        ),
        CryptoHolding(
            name: "Ether",
            symbol: "ETH",
            value: "₹ 1,79,102.50",
            percentageChange: "+3.0%",
            icon: "ethereum.circle.fill",
            iconColor: .white
        )
    ]
    
    
    @Published var recentTransactions: [AnalyticsTransaction] = [
        AnalyticsTransaction(
            type: "Receive",
            symbol: "BTC",
            icon: "bitcoinsign.circle.fill",
            iconColor: .orange
        )
    ]
    
   
    @Published var portfolioData: PortfolioData = PortfolioData(
        totalValue: 157342.05,
        currency: "INR",
        bitcoinValue: 157342.05,
        dollarValue: 1892.45
    )
    
    enum Timeframe: String, CaseIterable {
        case oneHour = "1h"
        case eightHours = "8h"
        case oneDay = "1d"
        case oneWeek = "1w"
        case oneMonth = "1m"
        case sixMonths = "6m"
        case oneYear = "1y"
    }
    
    func toggleCurrencyMode() {
        withAnimation(.easeInOut(duration: 0.3)) {
            isBitcoinMode.toggle()
            updatePortfolioValue()
        }
    }
    
    func selectTimeframe(_ timeframe: Timeframe) {
        withAnimation(.easeInOut(duration: 0.3)) {
            selectedTimeframe = timeframe
           
        }
    }
    
    private func updatePortfolioValue() {
        if isBitcoinMode {
            portfolioValue = "₹ \(String(format: "%.2f", portfolioData.bitcoinValue))"
        } else {
            portfolioValue = "$ \(String(format: "%.2f", portfolioData.dollarValue))"
        }
    }
}

struct PortfolioData {
    let totalValue: Double
    let currency: String
    let bitcoinValue: Double
    let dollarValue: Double
}

struct CryptoHolding {
    let name: String
    let symbol: String
    let value: String
    let percentageChange: String
    let icon: String
    let iconColor: Color
}

struct AnalyticsTransaction {
    let type: String
    let symbol: String
    let icon: String
    let iconColor: Color
}
