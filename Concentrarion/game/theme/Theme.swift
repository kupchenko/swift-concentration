//
//  Theme.swift
//  Concentrarion
//
//  Created by Dmitrii Kupchenko on 07/10/2018.
//  Copyright © 2018 Dmitrii Kupchenko. All rights reserved.
//

import Foundation

struct Theme {
    private(set) var title: String
    private(set) var emojiList: Array<String>
    private(set) var themeColor: ThemeColor
    
    init(title: String, emojiList: Array<String>, themeColor: ThemeColor) {
        self.title = title
        self.emojiList = emojiList
        self.themeColor = themeColor
    }
}
