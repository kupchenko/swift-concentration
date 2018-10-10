//
//  EmojiProvider.swift
//  Concentrarion
//
//  Created by Dmitrii Kupchenko on 06/10/2018.
//  Copyright © 2018 Dmitrii Kupchenko. All rights reserved.
//

import UIKit

class EmojiProvider {

    let availableEmojies: Array<String> = ["👻", "🎃", "👑", "🐒", "👽", "🤡", "⛄️", "🏀", "❤️", "☂️", "🐳", "💩", "🧠", "🍄", "🎪"]
    var cardEmojies: Array<String> = []
    
    init() {
        randomFillEmojiList()
    }
    
    func randomFillEmojiList() {
        print("shuffle the array")
        for emoji in availableEmojies {
            cardEmojies.append(emoji)
            cardEmojies.append(emoji)
        }
        cardEmojies.shuffle()
        print("Array size \(cardEmojies.count)")
    }
}
