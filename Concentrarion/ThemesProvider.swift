//
//  ThemesProvider.swift
//  Concentrarion
//
//  Created by Dmitrii Kupchenko on 07/10/2018.
//  Copyright © 2018 Dmitrii Kupchenko. All rights reserved.
//

import Foundation

struct ThemesProvider {
    var themes = Dictionary<String, Theme>()

    static let defaultThemeName = "other"
    
    static let defaultThemeEmojies = ["👻", "🎃", "👑", "🐒", "👽", "🤡", "⛄️", "🏀", "❤️", "☂️", "🐳", "💩", "🧠", "🍄", "🎪"]
    static let defaultTheme = Theme(title: ThemesProvider.defaultThemeName, emojiList: defaultThemeEmojies)
    
    init() {
        var emojies = ["👻", "🎃", "☠️", "💀", "👺", "🤡", "🌑", "🍪", "🍫", "🍭", "🍬", "🍩", "🧚‍♂️", "🧛🏿‍♂️", "🧝🏽‍♀️"]
        var theme = Theme(title: "halloween", emojiList: emojies)
        themes[theme.title] = theme
        
        emojies = ["⚽️", "🏀", "🏈", "🎾", "🏐", "🎱", "🏓", "🚴🏿‍♂️", "🥌", "⛸", "🏸", "🎣", "🏂", "⛷", "🏋️‍♂️"]
        theme = Theme(title: "sport", emojiList: emojies)
        themes[theme.title] = theme
        
        themes[ThemesProvider.defaultThemeName] = ThemesProvider.defaultTheme

    }
    
    mutating func addTheme(theme: Theme) {
        self.themes[theme.title] = theme
    }
    
    func provide(forName name: String) -> Theme {
        if let theme = themes[name] {
            return theme
        }
        return ThemesProvider.defaultTheme
    }
}
