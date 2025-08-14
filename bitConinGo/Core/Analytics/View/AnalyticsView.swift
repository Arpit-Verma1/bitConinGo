//
//  AnalyticsView.swift
//  bitConinGo
//
//  Created by arpit verma on 12/08/25.
//

import SwiftUI

struct AnalyticsView: View {
    @StateObject private var viewModel = AnalyticsViewModel()
    
    var body: some View {
        ZStack {
            Color.theme.background
                .ignoresSafeArea()
            
            ScrollView {
                VStack(spacing: 0) {
                  
                    portfolioCard
                    
                    
                    TimeframeSelector(
                        selectedTimeframe: $viewModel.selectedTimeframe,
                        onTimeframeSelected: viewModel.selectTimeframe
                    )
                    .padding(.top, 20)
                    
                   
                    PortfolioChart(
                        data: viewModel.chartData,
                        chartDate: viewModel.chartDate,
                        chartValue: viewModel.chartValue
                    )
                    .padding(.top, 20)
                    
                   
                    cryptoHoldingsSection
                        .padding(.top, 24)
                    
                   
                    recentTransactionsSection
                        .padding(.top, 24)
                        .padding(.bottom, 100)
                }
            }
        }
        .navigationBarHidden(true)
    }
}

extension AnalyticsView {
    private var portfolioCard: some View {
        VStack(spacing: 0) {
          
            VStack(spacing: 16) {
               
                HStack {
                    Button(action: {
                        
                    }) {
                        Image(systemName: "line.3.horizontal")
                            .font(.title2)
                            .foregroundColor(.white)
                    }
                    
                    Spacer()
                    
                    Button(action: {
                       
                    }) {
                        Image("bell")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 24, height: 24)
                            .foregroundColor(.white)
                    }
                }
                .padding(.top, 50)
                
                HStack {
                    HStack(spacing: 8) {
                        Text("Portfolio Value")
                            .font(.headline)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                        
                        Image(systemName: "chevron.right")
                            .font(.caption)
                            .foregroundColor(.white.opacity(0.7))
                    }
                    
                    Spacer()
                    
                   
                    CurrencyToggleView(
                        isBitcoinMode: $viewModel.isBitcoinMode,
                        onToggle: viewModel.toggleCurrencyMode
                    )
                }
                
                HStack {
                    Text(viewModel.portfolioValue)
                        .font(.system(size: 32, weight: .bold))
                        .foregroundColor(.white)
                    
                    Spacer()
                }
            }
            .padding(.horizontal, 20)
            .padding(.bottom, 24)
            .background(
                RoundedRectangle(cornerRadius: 30)
                    .fill(
                        LinearGradient(
                            colors: [
                                Color(red: 0.05, green: 0.06, blue: 0.12),
                                Color(red: 0.28, green: 0.33, blue: 0.90) 
                            ],
                            startPoint: .top,
                            endPoint: .bottom
                        )
                    )
                    .ignoresSafeArea(edges: .top)
            )
            .padding(.horizontal, 5)
            .padding(.top, -50)
        }
    }
    
    private var cryptoHoldingsSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                ForEach(viewModel.holdings, id: \.symbol) { holding in
                    CryptoHoldingCard(holding: holding)
                }
            }
            .padding(.horizontal, 20)
        }
    }
    
    private var recentTransactionsSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Recent Transactions")
                .font(.headline)
                .fontWeight(.semibold)
                .foregroundColor(.white)
                .padding(.horizontal, 20)
            
            VStack(spacing: 0) {
                ForEach(viewModel.recentTransactions, id: \.symbol) { transaction in
                    AnalyticsTransactionRow(transaction: transaction)
                        .padding(.horizontal, 20)
                    
                    if transaction.symbol != viewModel.recentTransactions.last?.symbol {
                        Divider()
                            .background(Color.theme.secondaryText.opacity(0.3))
                            .padding(.horizontal, 20)
                    }
                }
            }
            .padding(.vertical, 16)
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color.theme.cardBackground)
            )
            .padding(.horizontal, 20)
        }
    }
}

struct AnalyticsView_Previews: PreviewProvider {
    static var previews: some View {
        AnalyticsView()
    }
}
