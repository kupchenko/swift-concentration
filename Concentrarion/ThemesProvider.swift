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

    init() {
        var emojies = ["👻", "🎃", "☠️", "💀", "👺", "🤡", "🌑", "🍪", "🍫", "🍭", "🍬", "🍩", "🧚‍♂️", "🧛🏿‍♂️", "🧝🏽‍♀️"]
        var theme = Theme(title: "halloween", emojiList: emojies)
        themes[theme.title] = theme
        
        emojies = ["⚽️", "🏀", "🏈", "🎾", "🏐", "🎱", "🏓", "🚴🏿‍♂️", "🥌", "⛸", "🏸", "🎣", "🏂", "⛷", "🏋️‍♂️"]
        theme = Theme(title: "sport", emojiList: emojies)
        themes[theme.title] = theme
        
        emojies = ["👻", "🎃", "👑", "🐒", "👽", "🤡", "⛄️", "🏀", "❤️", "☂️", "🐳", "💩", "🧠", "🍄", "🎪"]
        theme = Theme(title: "other", emojiList: emojies)
        themes[theme.title] = theme

    }
    
    mutating func addTheme(theme: Theme) {
        self.themes[theme.title] = theme
    }
    
    func provide(forName name: String) -> Theme? {
        if let theme = themes[name] {
            return theme
        }
        return themes["other"]
    }
}
