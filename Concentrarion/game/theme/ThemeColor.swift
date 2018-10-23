//
//  ThemeColor.swift
//  Concentrarion
//
//  Created by Dmitrii Kupchenko on 21/10/2018.
//  Copyright © 2018 Dmitrii Kupchenko. All rights reserved.
//

import UIKit

struct ThemeColor {
    private(set) var cardColor: UIColor
    private(set) var backgroundColor: UIColor
    private(set) var choosedCardColor: UIColor
    
    init(cardColor: UIColor, backgroundColor: UIColor, choosedCardColor: UIColor) {
        self.cardColor = cardColor
        self.backgroundColor = backgroundColor
        self.choosedCardColor = choosedCardColor
    }
}
