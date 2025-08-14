//
//  bitConinGoApp.swift
//  bitConinGo
//
//  Created by arpit verma on 11/08/25.
//

import SwiftUI

@main
struct bitConinGoApp: App {
    
    @StateObject private var mainViewModel = MainViewModel()
    
    init() {
    
        let appearance = UINavigationBarAppearance()
        appearance.configureWithTransparentBackground()
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().compactAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
        UINavigationBar.appearance().tintColor = UIColor.white
        

        UITableView.appearance().backgroundColor = UIColor.clear
    }
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(mainViewModel)
        }
    }
}
