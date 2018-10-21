//
//  EmojiService.swift
//  Concentrarion
//
//  Created by Dmitrii Kupchenko on 14/10/2018.
//  Copyright © 2018 Dmitrii Kupchenko. All rights reserved.
//

import Foundation

struct EmojiService {
    
    var cardEmojies = Dictionary<Int, String>()
    var availableEmojies: Array<String>!
    
    init(with theme: Theme) {
        reset(for: theme)
    }
    
    mutating func reset(for theme: Theme) {
        self.cardEmojies.removeAll()
        self.availableEmojies = theme.emojiList
    }
    
    mutating func emoji(for card:Card) -> String {
        if cardEmojies[card.id] == nil, availableEmojies.count > 0  {
            let number = Int(arc4random_uniform(UInt32(availableEmojies.count)))
            cardEmojies[card.id] = availableEmojies.remove(at: number)
        }
        return cardEmojies[card.id] ?? "?"
        
        /*
         
         if let emoji = cardEmojies[card.id] {
         return emoji
         } else {
         return "?"
         }
         
         OR
         
         if cardEmojies[card.id] != nil {
         return cardEmojies[card.id]!
         } else {
         return "?"
         }
         
         */
    }
}
