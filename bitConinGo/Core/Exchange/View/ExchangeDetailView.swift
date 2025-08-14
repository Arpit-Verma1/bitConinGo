//
//  ExchangeDetailView.swift
//  bitConinGo
//
//  Created by arpit verma on 13/08/25.
//

import SwiftUI

struct ExchangeDetailView: View {
    @StateObject private var viewModel = ExchangeDetailViewModel()
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.theme.background
                    .ignoresSafeArea()
                
                ScrollView {
                    VStack(spacing: 0) {
                       
                        ExchangeSection(
                            title: "Send",
                            currency: viewModel.selectedSendCurrency,
                            amount: viewModel.sendAmount,
                            balance: viewModel.sendBalance,
                            icon: getCurrencyIcon(viewModel.selectedSendCurrency),
                            iconColor: getCurrencyColor(viewModel.selectedSendCurrency),
                            isExpanded: false,
                            cornerRadius: [.topLeft, .topRight]
                        ) {
                            
                        }
                        .padding(.horizontal, 20)
                        
                       
                        Button(action: {
                            viewModel.swapCurrencies()
                        }) {
                            Image(systemName: "arrow.up.arrow.down")
                                .font(.title3)
                                .foregroundColor(.white)
                                .frame(width: 38, height: 38)
                                .background(
                                    RoundedRectangle(cornerRadius: 12)
                                        .fill(Color.theme.cardBackground)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 12)
                                                .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                                        )
                                )
                                .padding(10)
                                .background(
                                    RoundedRectangle(cornerRadius: 16)
                                        .fill(Color.theme.background)
                                        .shadow(color: Color.black.opacity(0.2), radius: 8, x: 0, y: 4)
                                )
                        }
                        .buttonStyle(PlainButtonStyle())
                        .offset(y: -20)
                        .zIndex(1)
                        ExchangeSection(
                            title: "Recieve",
                            currency: viewModel.selectedReceiveCurrency,
                            amount: viewModel.receiveAmount,
                            balance: viewModel.receiveBalance,
                            icon: getCurrencyIcon(viewModel.selectedReceiveCurrency),
                            iconColor: getCurrencyColor(viewModel.selectedReceiveCurrency),
                            isExpanded: false,
                            cornerRadius: [.bottomLeft, .bottomRight]
                        ) {
                           
                        }
                        .padding(.horizontal, 20)
                        .offset(y: -50)
                        Button(action: {
                            viewModel.performExchange()
                        }) {
                            Text("Exchange")
                                .font(.headline)
                                .fontWeight(.semibold)
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity)
                                .frame(height: 56)
                                .background(
                                    Capsule()
                                        .fill(Color.theme.blue)
                                )
                        }
                        .buttonStyle(PlainButtonStyle())
                        .padding(.horizontal, 20)
                        .padding(.top, 32)
                        
                        // Exchange Details
                        VStack(spacing: 16) {
                            ExchangeDetailRow(title: "Rate", value: viewModel.exchangeRate)
                            ExchangeDetailRow(title: "Spread", value: viewModel.spread)
                            ExchangeDetailRow(title: "Gas fee", value: viewModel.gasFee)
                            ExchangeDetailRow(title: "You will recieve", value: viewModel.netReceiveAmount, isHighlighted: true)
                        }
                        .padding(.horizontal, 20)
                        .padding(.top, 24)
                        .padding(.bottom, 100)
                    }
                }
            }

            .navigationBarTitleDisplayMode(.inline)
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

extension ExchangeDetailView {
    private func getCurrencyIcon(_ currency: String) -> String {
        switch currency {
        case "ETH":
            return "https://assets.coingecko.com/coins/images/279/standard/ethereum.png?1696501628"
        case "BTC":
            return "https://assets.coingecko.com/coins/images/1/standard/bitcoin.png?1696501400"
        case "USDT":
            return "dollarsign.circle.fill"
        case "BNB":
            return "circle.fill"
        case "INR":
            return "indianrupeesign.circle.fill"
        case "USD":
            return "dollarsign.circle.fill"
        case "EUR":
            return "eurosign.circle.fill"
        case "GBP":
            return "sterlingsign.circle.fill"
        default:
            return "circle.fill"
        }
    }
    
    private func getCurrencyColor(_ currency: String) -> Color {
        switch currency {
        case "ETH":
            return .white
        case "BTC":
            return .orange
        case "USDT":
            return .green
        case "BNB":
            return .yellow
        case "INR":
            return .green
        case "USD":
            return .green
        case "EUR":
            return .blue
        case "GBP":
            return .purple
        default:
            return .white
        }
    }
}

struct ExchangeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ExchangeDetailView()
    }
}

