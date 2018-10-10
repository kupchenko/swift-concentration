//
//  Concentration.swift
//  Concentrarion
//
//  Created by Dmitrii Kupchenko on 06/10/2018.
//  Copyright © 2018 Dmitrii Kupchenko. All rights reserved.
//

import Foundation

class Concentration {
    var cards = Array<Card>()
    var indexOfOneAreOnlyFaceUpCard: Int?
    var score:Int = 0
    var isGameOver = false
    
    
    init(numberOfPairsOfCars: Int) {
        for _ in 1...numberOfPairsOfCars {
            let card = Card()
            cards.append(card)
            cards.append(card) // puts a copy into array
            
            //or
            //this way
            // cards += [card, card]
        }
        cards.shuffle()
    }
    
    func chooseCard(at index:Int) {
        if !cards[index].isMatched {
            if let matchIndex = indexOfOneAreOnlyFaceUpCard, matchIndex != index {
                if cards[matchIndex].id == cards[index].id {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                    score += 2
                    if isAllCardsAreMached() {
                        print("Game is over")
                        isGameOver = true
                    }
                } else {
                    score -= 1
                }
                cards[index].isFaceUp = true
                indexOfOneAreOnlyFaceUpCard = nil
            } else {
                for flipDownIndex in cards.indices {
                    cards[flipDownIndex].isFaceUp = false
                }
                cards[index].isFaceUp = true
                indexOfOneAreOnlyFaceUpCard = index
            }
        }
    }

    func isAllCardsAreMached() -> Bool{
        var count = 0
        for card in cards {
            if (!card.isMatched) {
                count += 1
            }
        }
        return count == 0
    }
    
    //        for i in cards.indices {
    //            if cards[i].isFaceUp {
    //
    //            }
    //        }
    //        if cards[index].isFaceUp {
    //            cards[index].isFaceUp = false
    //        } else {
    //            cards[index].isFaceUp = true
    //        }
    
}
