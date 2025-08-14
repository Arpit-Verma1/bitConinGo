//
//  StackedCards.swift
//  bitConinGo
//
//  Created by arpit verma on 14/08/25.
//

import SwiftUI

struct StackedCards: View {
    let totalBalance: String
    let currency: String
    let dailyChange: String
    let percentageChange: String
    let isPositiveChange: Bool
    
    var body: some View {
        ZStack {
           
            RoundedRectangle(cornerRadius: 20)
                .fill(
                    LinearGradient(
                        colors: [
                            Color(red: 0.42, green: 0.27, blue: 0.90),
                            Color(red: 0.19, green: 0.33, blue: 0.95)
                        ],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
                .frame(width: UIScreen.main.bounds.width - 70, height: 180)
                .offset(y: 20)
                .opacity(0.4)
            
            
            RoundedRectangle(cornerRadius: 20)
                .fill(
                    LinearGradient(
                        colors: [
                            Color(red: 0.42, green: 0.27, blue: 0.90),
                            Color(red: 0.19, green: 0.33, blue: 0.95)
                        ],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
                .frame(width: UIScreen.main.bounds.width - 50, height: 180) // Medium width
                .offset(y: 10)
                .opacity(0.6)
            
           
            VStack(spacing: 10) {
                
                Text(currency)
                    .font(.caption)
                    .fontWeight(.medium)
                    .foregroundColor(.white)
                    .padding(.horizontal, 16)
                    .padding(.vertical, 8)
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color.theme.blue)
                    )
                
               
                Text(totalBalance)
                    .font(.system(size: 36, weight: .bold))
                    .foregroundColor(.white)
                
                
                HStack(spacing: 8) {
                    Text(dailyChange)
                        .font(.system(size: 14))
                        .foregroundColor(.white)
                    
                    Text(percentageChange)
                        .font(.system(size: 14))
                        .fontWeight(.medium)
                        .foregroundColor(isPositiveChange ? Color.theme.green : Color.theme.red)
                }
            }
            .padding(32)
            .frame(width: UIScreen.main.bounds.width - 40, height: 180) // Full width
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .fill(
                        LinearGradient(
                            colors: [
                                Color(red: 0.42, green: 0.27, blue: 0.90),
                                Color(red: 0.19, green: 0.33, blue: 0.95)
                            ],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
            )
            .shadow(color: Color.black.opacity(0.3), radius: 15, x: 0, y: 8)
        }
        .frame(height: 200) 
    }
}

struct StackedCards_Previews: PreviewProvider {
    static var previews: some View {
        StackedCards(
            totalBalance: "157342.05",
            currency: "INR",
            dailyChange: "₹1,342",
            percentageChange: "+4.6%",
            isPositiveChange: true
        )
        .padding()
        .background(Color.theme.background)
        .previewLayout(.sizeThatFits)
    }
}
