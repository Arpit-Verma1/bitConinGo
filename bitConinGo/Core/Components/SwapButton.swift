//
//  SwapButton.swift
//  bitConinGo
//
//  Created by arpit verma on 14/08/25.
//

import SwiftUI

struct SwapButton: View {
    let onSwap: () -> Void
    
    var body: some View {
        Button(action: onSwap) {
            Image(systemName: "arrow.up.arrow.down")
                .font(.title2)
                .foregroundColor(Color.theme.blue)
                .frame(width: 48, height: 48)
                .background(
                    Circle()
                        .fill(Color.white)
                        .shadow(color: Color.black.opacity(0.1), radius: 8, x: 0, y: 4)
                )
        }
        .buttonStyle(PlainButtonStyle())
    }
}

struct SwapButton_Previews: PreviewProvider {
    static var previews: some View {
        SwapButton {}
            .padding()
            .background(Color.theme.background)
            .previewLayout(.sizeThatFits)
    }
}
