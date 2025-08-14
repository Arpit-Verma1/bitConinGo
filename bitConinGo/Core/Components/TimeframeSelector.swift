//
//  TimeframeSelector.swift
//  bitConinGo
//
//  Created by arpit verma on 14/08/25.
//

import SwiftUI

struct TimeframeSelector: View {
    @Binding var selectedTimeframe: AnalyticsViewModel.Timeframe
    let onTimeframeSelected: (AnalyticsViewModel.Timeframe) -> Void
    
    var body: some View {
        HStack(spacing: 16) {
            ForEach(AnalyticsViewModel.Timeframe.allCases, id: \.self) { timeframe in
                Button(action: {
                    onTimeframeSelected(timeframe)
                }) {
                    Text(timeframe.rawValue)
                        .font(.caption)
                        .fontWeight(.medium)
                        .foregroundColor(selectedTimeframe == timeframe ? .white : Color.theme.secondaryText)
                        .padding(.horizontal, 12)
                        .padding(.vertical, 6)
                        .background(
                            Circle()
                                .fill(selectedTimeframe == timeframe ? Color.theme.secondaryText.opacity(0.3) : Color.clear)
                        )
                }
                .buttonStyle(PlainButtonStyle())
            }
        }
        .padding(.horizontal, 20)
    }
}

struct TimeframeSelector_Previews: PreviewProvider {
    static var previews: some View {
        TimeframeSelector(
            selectedTimeframe: .constant(.sixMonths)
        ) { _ in }
        .background(Color.theme.background)
        .previewLayout(.sizeThatFits)
    }
}






