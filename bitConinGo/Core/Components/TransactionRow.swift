//
//  TransactionRow.swift
//  bitConinGo
//
//  Created by arpit verma on 14/08/25.
//

import SwiftUI

struct TransactionRow: View {
    let transaction: ExchangeTransaction
    let onTap: () -> Void
    
    var body: some View {
        Button(action: onTap) {
            HStack(spacing: 16) {
             
                Image(systemName: transaction.icon)
                    .font(.title3)
                    .foregroundColor(transaction.iconColor)
                    .frame(width: 32, height: 32)
                    .background(
                        RoundedRectangle(cornerRadius: 8)
                            .fill(Color.theme.secondaryText.opacity(0.2))
                    )
                
              
                VStack(alignment: .leading, spacing: 4) {
                    Text(transaction.type)
                        .font(.subheadline)
                        .fontWeight(.medium)
                        .foregroundColor(.white)
                    
                    Text(transaction.date)
                        .font(.caption)
                        .foregroundColor(Color.theme.secondaryText)
                }
                
                Spacer()
                
               
                VStack(alignment: .trailing, spacing: 4) {
                    Text(transaction.symbol)
                        .font(.subheadline)
                        .fontWeight(.medium)
                        .foregroundColor(.white)
                    
                    Text(transaction.amount)
                        .font(.subheadline)
                        .fontWeight(.medium)
                        .foregroundColor(.white)
                }
            }
            .padding(16)
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.theme.cardBackground)
            )
        }
        .buttonStyle(PlainButtonStyle())
    }
}

struct AnalyticsTransactionRow: View {
    let transaction: AnalyticsTransaction
    
    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: transaction.icon)
                .font(.title3)
                .foregroundColor(transaction.iconColor)
                .frame(width: 32, height: 32)
            
           
            VStack(alignment: .leading, spacing: 2) {
                Text(transaction.type)
                    .font(.subheadline)
                    .fontWeight(.medium)
                    .foregroundColor(.white)
                
                Text(transaction.symbol)
                    .font(.caption)
                    .foregroundColor(Color.theme.secondaryText)
            }
            
            Spacer()
        }
        .padding(.vertical, 8)
    }
}

struct TransactionRow_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 12) {
            TransactionRow(
                transaction: ExchangeTransaction(
                    type: "Recieve",
                    symbol: "BTC",
                    icon: "arrow.down.circle.fill",
                    iconColor: .gray,
                    date: "20 March",
                    amount: "+0.002126"
                )
            ) {
                // Action
            }
            
            TransactionRow(
                transaction: ExchangeTransaction(
                    type: "Sent",
                    symbol: "ETH",
                    icon: "arrow.up.circle.fill",
                    iconColor: .gray,
                    date: "19 March",
                    amount: "+0.003126"
                )
            ) {
                // Action
            }
        }
        .padding()
        .background(Color.theme.background)
        .previewLayout(.sizeThatFits)
    }
}

