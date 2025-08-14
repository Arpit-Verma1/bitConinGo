//
//  CryptoHoldingCard.swift
//  bitConinGo
//
//  Created by arpit verma on 14/08/25.
//

import SwiftUI

struct CryptoHoldingCard: View {
    let holding: CryptoHolding
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
           
            HStack(spacing: 8) {
             
                if holding.symbol == "BTC" {
                    NetworkImageView(
                        url: "https://assets.coingecko.com/coins/images/1/standard/bitcoin.png?1696501400",
                        placeholder: "bitcoinsign.circle.fill",
                        size: 24
                    )
                } else if holding.symbol == "ETH" {
                    NetworkImageView(
                        url: "https://assets.coingecko.com/coins/images/279/standard/ethereum.png?1696501628",
                        placeholder: "ethereum.circle.fill",
                        size: 24
                    )
                } else {
                    Image(systemName: holding.icon)
                        .font(.title2)
                        .foregroundColor(holding.iconColor)
                }
                
                VStack(alignment: .leading, spacing: 2) {
                    Text(holding.name)
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                    
                    Text(holding.symbol)
                        .font(.caption)
                        .foregroundColor(Color.theme.secondaryText)
                }
                
                Spacer()
            }
            
            // Value and percentage change
            VStack(alignment: .leading, spacing: 4) {
                Text(holding.value)
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                
                Text(holding.percentageChange)
                    .font(.caption)
                    .fontWeight(.medium)
                    .foregroundColor(Color.theme.green)
            }
        }
        .padding(16)
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.theme.cardBackground)
        )
    }
}

struct CryptoHoldingCard_Previews: PreviewProvider {
    static var previews: some View {
        HStack(spacing: 12) {
            CryptoHoldingCard(
                holding: CryptoHolding(
                    name: "Bitcoin",
                    symbol: "BTC",
                    value: "₹ 75,62,502.14",
                    percentageChange: "+3.2%",
                    icon: "bitcoinsign.circle.fill",
                    iconColor: .orange
                )
            )
            
            CryptoHoldingCard(
                holding: CryptoHolding(
                    name: "Ether",
                    symbol: "ETH",
                    value: "₹ 1,79,102.50",
                    percentageChange: "+3.0%",
                    icon: "ethereum.circle.fill",
                    iconColor: .white
                )
            )
        }
        .padding()
        .background(Color.theme.background)
        .previewLayout(.sizeThatFits)
    }
}





