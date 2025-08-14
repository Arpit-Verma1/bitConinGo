//
//  ExchangeSection.swift
//  bitConinGo
//
//  Created by arpit verma on 14/08/25.
//

import SwiftUI

struct ExchangeSection: View {
    let title: String
    let currency: String
    let amount: String
    let balance: String
    let icon: String
    let iconColor: Color
    let isExpanded: Bool
    let cornerRadius: UIRectCorner
    let onCurrencyTap: () -> Void
    
    init(title: String, currency: String, amount: String, balance: String, icon: String, iconColor: Color, isExpanded: Bool, cornerRadius: UIRectCorner = .allCorners, onCurrencyTap: @escaping () -> Void) {
        self.title = title
        self.currency = currency
        self.amount = amount
        self.balance = balance
        self.icon = icon
        self.iconColor = iconColor
        self.isExpanded = isExpanded
        self.cornerRadius = cornerRadius
        self.onCurrencyTap = onCurrencyTap
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
          
            HStack {
                CurrencySelector(
                    currency: currency,
                    icon: icon,
                    iconColor: iconColor,
                    isExpanded: isExpanded,
                    onTap: onCurrencyTap
                )
                
                Spacer()
                
                Text(title)
                    .font(.subheadline)
                    .fontWeight(.medium)
                    .foregroundColor(.white)
            }
            
            
            Text(amount)
                .font(.system(size: 32, weight: .bold))
                .foregroundColor(.white)
            
        
            HStack {
                Text("Balance")
                    .font(.caption)
                    .foregroundColor(Color.theme.secondaryText)
                
                Spacer()
                
                Text(balance)
                    .font(.caption)
                    .fontWeight(.medium)
                    .foregroundColor(.white)
            }
        }
        .padding(20)
        .background(
            RoundedCorner(radius: 16, corners: cornerRadius)
                .fill(Color.theme.cardBackground)
        )
    }
}


struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

struct ExchangeSection_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 20) {
            ExchangeSection(
                title: "Send",
                currency: "ETH",
                amount: "2.640",
                balance: "10.254",
                icon: "diamond.fill",
                iconColor: .white,
                isExpanded: false,
                cornerRadius: [.topLeft, .topRight]
            ) {
                // Action
            }
            
            ExchangeSection(
                title: "Recieve",
                currency: "INR",
                amount: "₹ 4,65,006.44",
                balance: "4,35,804",
                icon: "indianrupeesign.circle.fill",
                iconColor: .green,
                isExpanded: false,
                cornerRadius: [.bottomLeft, .bottomRight]
            ) {
                // Action
            }
        }
        .padding()
        .background(Color.theme.background)
        .previewLayout(.sizeThatFits)
    }
}

