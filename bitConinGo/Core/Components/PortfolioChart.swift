//
//  PortfolioChart.swift
//  bitConinGo
//
//  Created by arpit verma on 14/08/25.
//

import SwiftUI

struct PortfolioChart: View {
    private let data: [Double]
    private let maxY: Double
    private let minY: Double
    private let lineColor: Color
    private let chartDate: String
    private let chartValue: String
    
    @State private var percentage: CGFloat = 0
    
    init(data: [Double], chartDate: String, chartValue: String) {
        self.data = data
        self.chartDate = chartDate
        self.chartValue = chartValue
        self.maxY = data.max() ?? 0
        self.minY = data.min() ?? 0
        let priceChange = (data.last ?? 0) - (data.first ?? 0)
        self.lineColor = priceChange > 0 ? Color.theme.green : Color.theme.red
    }
    
    var body: some View {
        VStack(spacing: 0) {
          
            ZStack {
                chartView
                    .frame(height: 200)
                    .background(chartBackground)
                    .overlay(
                        chartYAxis.padding(.horizontal, 4),
                        alignment: .leading
                    )
                
                VStack {
                    HStack {
                        Spacer()
                        VStack(alignment: .trailing, spacing: 4) {
                            Text(chartDate)
                                .font(.caption2)
                                .foregroundColor(.white)
                            Text(chartValue)
                                .font(.caption)
                                .fontWeight(.semibold)
                                .foregroundColor(.white)
                        }
                        .padding(.horizontal, 8)
                        .padding(.vertical, 4)
                        .background(
                            RoundedRectangle(cornerRadius: 8)
                                .fill(Color.theme.cardBackground.opacity(0.8))
                        )
                    }
                    .padding(.horizontal, 20)
                    
                    Spacer()
                }
                .padding(.top, 20)
            }
        }
        .font(.caption)
        .foregroundColor(Color.theme.secondaryText)
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                withAnimation(.linear(duration: 2.0)) {
                    percentage = 1.0
                }
            }
        }
    }
}

extension PortfolioChart {
    private var chartView: some View {
        GeometryReader { geometry in
            Path { path in
                for index in data.indices {
                    let xPosition = geometry.size.width / CGFloat(data.count) * CGFloat(index + 1)
                    let yAxis = maxY - minY
                    let yPosition = (1 - CGFloat((data[index] - minY) / yAxis)) * geometry.size.height
                    
                    if index == 0 {
                        path.move(to: CGPoint(x: xPosition, y: yPosition))
                    }
                    
                    path.addLine(to: CGPoint(x: xPosition, y: yPosition))
                }
            }
            .trim(from: 0, to: percentage)
            .stroke(lineColor, style: StrokeStyle(
                lineWidth: 2,
                lineCap: .round,
                lineJoin: .round
            ))
            .shadow(color: lineColor, radius: 10, x: 0.0, y: 10.0)
            .shadow(color: lineColor.opacity(0.5), radius: 10, x: 0.0, y: 20.0)
            .shadow(color: lineColor.opacity(0.7), radius: 10, x: 0.0, y: 30.0)
            .shadow(color: lineColor.opacity(0.1), radius: 10, x: 0.0, y: 40.0)
        }
    }
    
    private var chartBackground: some View {
        VStack {
            Divider()
                .background(Color.theme.secondaryText.opacity(0.3))
            Spacer()
            Divider()
                .background(Color.theme.secondaryText.opacity(0.3))
            Spacer()
            Divider()
                .background(Color.theme.secondaryText.opacity(0.3))
        }
    }
    
    private var chartYAxis: some View {
        VStack {
            Text(formatCurrency(maxY))
                .font(.caption2)
            Spacer()
            Text(formatCurrency((maxY + minY) / 2))
                .font(.caption2)
            Spacer()
            Text(formatCurrency(minY))
                .font(.caption2)
        }
    }
    
    private func formatCurrency(_ value: Double) -> String {
        return "₹ \(String(format: "%.0f", value))"
    }
}

struct PortfolioChart_Previews: PreviewProvider {
    static var previews: some View {
        PortfolioChart(
            data: [120000, 125000, 118000, 135000, 142000, 138000, 145000, 157342],
            chartDate: "24 March",
            chartValue: "₹ 1,42,340"
        )
        .padding()
        .background(Color.theme.background)
        .previewLayout(.sizeThatFits)
    }
}






