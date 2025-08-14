//
//  CurrencySelector.swift
//  bitConinGo
//
//  Created by arpit verma on 14/08/25.
//

import SwiftUI

struct CurrencySelector: View {
    let currency: String
    let icon: String
    let iconColor: Color
    let isExpanded: Bool
    let onTap: () -> Void
    
    var body: some View {
        Button(action: onTap) {
            HStack(spacing: 8) {
               
                if icon.hasPrefix("http") {
                   
                    NetworkImageView(
                        url: icon,
                        placeholder: currency == "BTC" ? "bitcoinsign.circle.fill" : "ethereum.circle.fill",
                        size: 20
                    )
                    .frame(width: 32, height: 32)
                    .background(
                        Circle()
                            .fill(Color.theme.cardBackground)
                    )
                } else {
                    // System icon for other currencies
                    Image(systemName: icon)
                        .font(.title2)
                        .foregroundColor(iconColor)
                        .frame(width: 32, height: 32)
                        .background(
                            Circle()
                                .fill(Color.theme.cardBackground)
                        )
                }
                
                // Currency name
                Text(currency)
                    .font(.subheadline)
                    .fontWeight(.medium)
                    .foregroundColor(.white)
                
                // Dropdown arrow
                Image(systemName: "chevron.down")
                    .font(.caption)
                    .foregroundColor(.white)
                    .rotationEffect(.degrees(isExpanded ? 180 : 0))
            }
        }
        .buttonStyle(PlainButtonStyle())
    }
}

struct CurrencySelector_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 20) {
            CurrencySelector(
                currency: "ETH",
                icon: "https://assets.coingecko.com/coins/images/279/standard/ethereum.png?1696501628",
                iconColor: .white,
                isExpanded: false
            ) {
                
            }
            
            CurrencySelector(
                currency: "BTC",
                icon: "https://assets.coingecko.com/coins/images/1/standard/bitcoin.png?1696501400",
                iconColor: .orange,
                isExpanded: false
            ) {
                
            }
            
            CurrencySelector(
                currency: "INR",
                icon: "indianrupeesign.circle.fill",
                iconColor: .green,
                isExpanded: true
            ) {
                
            }
        }
        .padding()
        .background(Color.theme.background)
        .previewLayout(.sizeThatFits)
    }
}


