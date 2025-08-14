//
//  MainViewModel.swift
//  bitConinGo
//
//  Created by arpit verma on 11/08/25.
//

import Foundation
import SwiftUI
import Combine

class MainViewModel: ObservableObject {
    @Published var selectedTabIndex: Int = 0
    @Published var showAddSheet: Bool = false
    
    var selectedTab: TabItem {
        TabItem.allCases[selectedTabIndex]
    }
    
    enum TabItem: Int, CaseIterable {
        case analytics = 0
        case exchange = 1
        case record = 2
        case wallet = 3
        
        var title: String {
            switch self {
            case .analytics:
                return "Analytics"
            case .exchange:
                return "Exchange"
            case .record:
                return "Record"
            case .wallet:
                return "Wallet"
            }
        }
        
        var icon: String {
            switch self {
            case .analytics:
                return "chart.line.uptrend.xyaxis"
            case .exchange:
                return "arrow.left.arrow.right"
            case .record:
                return "doc.text"
            case .wallet:
                return "wallet.pass"
            }
        }
    }
}
