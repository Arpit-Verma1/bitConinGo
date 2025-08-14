//
//  MainView.swift
//  bitConinGo
//
//  Created by arpit verma on 11/08/25.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject private var mainViewModel: MainViewModel
    
    var body: some View {
        Group {
        if #available(iOS 26,*) {
        NativeTabView()
        } else {
        NativeTabView()
        }
        }
        
        
        
        
    }
    @ViewBuilder
    func NativeTabView() ->
    some View {
    TabView {
    Tab.init ("Home", systemImage: "chart.line.uptrend.xyaxis") {
        AnalyticsView()
    }
    Tab.init("New", systemImage: "arrow.left.arrow.right") {
        ExchangeView()
    }
    Tab.init("Radio", systemImage: "doc.text") {
        RecordView()
    }
    Tab.init("Library", systemImage: "wallet.pass") {
        WalletView()
    }
        Tab.init("Search", systemImage: "plus", role: .search) {
    }
    }
    }


}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .environmentObject(MainViewModel())
    }
}

