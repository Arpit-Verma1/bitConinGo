//
//  Color.swift
//  bitConinGo
//
//  Created by arpit verma on 11/08/25.
//

import Foundation
import SwiftUI

extension Color {
    static let theme = ColorTheme()
}

struct ColorTheme {
    let accent = Color("AccentColor")
    let background = Color("BackgroundColor")
    let green = Color("GreenColor")
    let red = Color("RedColor")
    let secondaryText = Color("SecondaryTextColor")
    let cardBackground = Color("CardBackgroundColor")
    let blue = Color("BlueColor")
    let black = Color("BlackColor")
    let purple = Color.purple
}
