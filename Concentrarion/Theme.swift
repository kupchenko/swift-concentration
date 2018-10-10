//
//  Theme.swift
//  Concentrarion
//
//  Created by Dmitrii Kupchenko on 07/10/2018.
//  Copyright © 2018 Dmitrii Kupchenko. All rights reserved.
//

import Foundation

struct Theme {
    var title: String
    var emojiList: Array<String>
    
    init(title: String, emojiList: Array<String>) {
        self.title = title
        self.emojiList = emojiList
    }
}
