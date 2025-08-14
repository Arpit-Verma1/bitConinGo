//
//  WalletView.swift
//  bitConinGo
//
//  Created by arpit verma on 14/08/25.
//

import SwiftUI

struct WalletView: View {
    var body: some View {
        VStack {
            Spacer()
            
            VStack(spacing: 16) {
                Image(systemName: "wallet.pass")
                    .font(.system(size: 60))
                    .foregroundColor(Color.theme.accent)
                
                Text("Wallet")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(Color.theme.accent)
                
                Text("Coming Soon")
                    .font(.subheadline)
                    .foregroundColor(Color.theme.secondaryText)
            }
            
            Spacer()
        }
        .background(Color.theme.background)
    }
}

struct WalletView_Previews: PreviewProvider {
    static var previews: some View {
        WalletView()
    }
}
