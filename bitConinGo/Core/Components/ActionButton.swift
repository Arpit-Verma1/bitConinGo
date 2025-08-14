//
//  ActionButton.swift
//  bitConinGo
//
//  Created by arpit verma on 14/08/25.
//

import SwiftUI

struct ActionButton: View {
    let icon: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Image(systemName: icon)
                .font(.title2)
                .foregroundColor(.white)
                .frame(width: 56, height: 56)
                .background(
                    Circle()
                        .fill(Color.theme.cardBackground)
                        .shadow(color: Color.black.opacity(0.1), radius: 8, x: 0, y: 4)
                )
        }
        .buttonStyle(PlainButtonStyle())
    }
}

struct ActionButton_Previews: PreviewProvider {
    static var previews: some View {
        HStack(spacing: 20) {
            ActionButton(icon: "arrow.up") {}
            ActionButton(icon: "plus") {}
            ActionButton(icon: "arrow.down") {}
        }
        .padding()
        .background(Color.theme.background)
        .previewLayout(.sizeThatFits)
    }
}





