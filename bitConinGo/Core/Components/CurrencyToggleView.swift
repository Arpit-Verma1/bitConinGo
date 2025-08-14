//
//  CurrencyToggleView.swift
//  bitConinGo
//
//  Created by arpit verma on 14/08/25.
//

import SwiftUI

struct CurrencyToggleView: View {
    @Binding var isBitcoinMode: Bool
    let onToggle: () -> Void
    
    var body: some View {
        Button(action: onToggle) {
            ZStack {
               
                Capsule()
                    .fill(Color.white.opacity(0.2))
                    .frame(width: 80, height: 34)
                
               
                RoundedRectangle(cornerRadius: 14)
                    .fill(Color.theme.black)
                    .frame(width: 45, height: 34)
                    .offset(x: isBitcoinMode ? 20 : -20)
                    .animation(.easeInOut(duration: 0.3), value: isBitcoinMode)
                
                
                HStack(spacing: 0) {
                   
                    Image("cash")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 16, height: 16)
                        .foregroundColor(isBitcoinMode ? .white : .gray)
                        .frame(width: 45, height: 34)
                    
                  
                    Image("bitCoin")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 16, height: 16)
                        .foregroundColor(!isBitcoinMode ? .white : .gray)
                        .frame(width: 45, height: 34)
                }
            }
        }
        .buttonStyle(PlainButtonStyle())
    }
}

struct CurrencyToggleView_Previews: PreviewProvider {
    static var previews: some View {
        HStack {
            CurrencyToggleView(isBitcoinMode: .constant(true)) {}
            CurrencyToggleView(isBitcoinMode: .constant(false)) {}
        }
        .padding()
        .background(Color.theme.blue)
        .previewLayout(.sizeThatFits)
    }
}
