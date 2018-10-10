//
//  Group.swift
//  Concentrarion
//
//  Created by Dmitrii Kupchenko on 06/10/2018.
//  Copyright © 2018 Dmitrii Kupchenko. All rights reserved.
//

import Foundation

struct Card {
    var id: Int
    var isFaceUp = false
    var isMatched = false
    
    static var idFactory = 0
    
    
    static func getUniqueId() -> Int {
        idFactory += 1
        return idFactory;
    }
    
    init() {
        self.id = Card.getUniqueId()
    }
}
