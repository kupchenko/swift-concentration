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
    
    static let defaultTheme = Theme(title: ThemesProvider.defaultThemeName,
                                    emojiList: ["👻", "🎃", "👑", "🐒", "👽", "🤡", "⛄️", "🏀", "❤️", "☂️", "🐳", "💩", "🧠", "🍄", "🎪"],
                                    themeColor: ThemeColor(cardColor: #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1), backgroundColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), choosedCardColor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)))
    
    init() {
        var emojies = ["👻", "🎃", "☠️", "💀", "👺", "🤡", "🌑", "🍪", "🍫", "🍭", "🍬", "🍩", "🧚‍♂️", "🧛🏿‍♂️", "🧝🏽‍♀️"]
        var theme = Theme(title: "halloween", emojiList: emojies, themeColor: ThemeColor(cardColor: #colorLiteral(red: 1, green: 0.01208707165, blue: 0, alpha: 1), backgroundColor: #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1), choosedCardColor: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)))
        themes[theme.title] = theme
        
        emojies = ["⚽️", "🏀", "🏈", "🎾", "🏐", "🎱", "🏓", "🚴🏿‍♂️", "🥌", "⛸", "🏸", "🎣", "🏂", "⛷", "🏋️‍♂️"]
        theme = Theme(title: "sport", emojiList: emojies, themeColor: ThemeColor(cardColor: #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1), backgroundColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), choosedCardColor: #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)))
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
