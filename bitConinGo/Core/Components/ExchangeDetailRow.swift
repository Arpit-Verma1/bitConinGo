//
//  ExchangeDetailRow.swift
//  bitConinGo
//
//  Created by arpit verma on 14/08/25.
//

import SwiftUI

struct ExchangeDetailRow: View {
    let title: String
    let value: String
    let isHighlighted: Bool
    
    init(title: String, value: String, isHighlighted: Bool = false) {
        self.title = title
        self.value = value
        self.isHighlighted = isHighlighted
    }
    
    var body: some View {
        HStack {
            Text(title)
                .font(.subheadline)
                .foregroundColor(Color.theme.secondaryText)
            
            Spacer()
            
            Text(value)
                .font(.subheadline)
                .fontWeight(isHighlighted ? .semibold : .medium)
                .foregroundColor(isHighlighted ? .white : Color.theme.secondaryText)
        }
        .padding(.vertical, 4)
    }
}

struct ExchangeDetailRow_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 12) {
            ExchangeDetailRow(title: "Rate", value: "1 ETH = ₹ 1,76,138.80")
            ExchangeDetailRow(title: "Spread", value: "0.2%")
            ExchangeDetailRow(title: "Gas fee", value: "₹ 422.73")
            ExchangeDetailRow(title: "You will recieve", value: "₹ 1,75,716.07", isHighlighted: true)
        }
        .padding()
        .background(Color.theme.background)
        .previewLayout(.sizeThatFits)
    }
}



