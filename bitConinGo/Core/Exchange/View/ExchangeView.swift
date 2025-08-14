//
//  ExchangeView.swift
//  bitConinGo
//
//  Created by arpit verma on 13/08/25.
//

import SwiftUI

struct ExchangeView: View {
    @StateObject private var viewModel = ExchangeViewModel()
    @State private var showingExchangeDetail = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.theme.background
                    .ignoresSafeArea()
                
                ScrollView {
                                    VStack(spacing: 0) {
                        StackedCards(
                            totalBalance: viewModel.totalBalance,
                            currency: viewModel.currency,
                            dailyChange: viewModel.dailyChange,
                            percentageChange: viewModel.percentageChange,
                            isPositiveChange: viewModel.isPositiveChange
                        )
                        .padding(.horizontal, 20)
                        .padding(.top, 20)
                        
                        actionButtonsSection
                        
                        recentTransactionsSection
                            .padding(.bottom, 100)
                    }
                }
            }
            .navigationTitle("Exchange")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                    }) {
                        Image(systemName: "line.3.horizontal")
                            .font(.title2)
                            .foregroundColor(.white)
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                    }) {
                        Image("bell")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 24, height: 24)
                            .foregroundColor(.white)
                    }
                }
            }
            .navigationDestination(isPresented: $showingExchangeDetail
                                    
                                    , destination: {
                 ExchangeDetailView()
             })
        }
        
       
    }
}

extension ExchangeView {
    private var actionButtonsSection: some View {
        HStack(spacing: 20) {
            ActionButton(icon: "arrow.up") {
                viewModel.sendAction()
            }
            
            ActionButton(icon: "plus") {
                viewModel.addAction()
            }
            
            ActionButton(icon: "arrow.down") {
                viewModel.receiveAction()
            }
        }
        .padding(.top, 24)
    }
    
    private var recentTransactionsSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Text("Transactions")
                    .font(.headline)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                
                Spacer()
                
                Text("Last 4 days")
                    .font(.subheadline)
                    .foregroundColor(.white)
            }
            .padding(.horizontal, 20)
            
            VStack(spacing: 12) {
                ForEach(viewModel.recentTransactions, id: \.symbol) { transaction in
                    TransactionRow(transaction: transaction) {
                        showingExchangeDetail = true
                    }
                }
            }
            .padding(.horizontal, 20)
        }
        .padding(.top, 24)
    }
}

struct ExchangeView_Previews: PreviewProvider {
    static var previews: some View {
        ExchangeView()
    }
}
