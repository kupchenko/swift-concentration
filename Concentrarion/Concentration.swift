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
    var seenIndexes = Set<Int>()
    
    
    init(numberOfPairsOfCards: Int) {
        resetGame(numberOfPairsOfCards: numberOfPairsOfCards)
    }
    
    func chooseCard(at index:Int) {
        if !cards[index].isMatched {
            if let matchIndex = indexOfOneAreOnlyFaceUpCard, matchIndex != index {
                if cards[matchIndex].id == cards[index].id {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                    score += 2
                    print("Found match for cards with id=\(cards[index].id)")
                    if isAllCardsAreMached() {
                        print("Game is over")
                        isGameOver = true
                    }
                } else {
                    if isAlreadySeenIndex(for: index) {
                        score -= 1
                    }
                    if isAlreadySeenIndex(for: matchIndex) {
                        score -= 1
                    }
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
        seenIndexes.insert(index)
    }
    
    func isAlreadySeenIndex(for index: Int) -> Bool {
        return seenIndexes.contains(index)
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
    
    func resetGame(numberOfPairsOfCards: Int) {
        indexOfOneAreOnlyFaceUpCard = nil
        isGameOver = false
        score = 0
        
        seenIndexes.removeAll()
        cards.removeAll()
        createCards(numberOfPairsOfCards: numberOfPairsOfCards)
    }
    
    func createCards(numberOfPairsOfCards: Int) {
        for _ in 1...numberOfPairsOfCards {
            let card = Card()
            cards.append(card)
            cards.append(card) // puts a copy into array
            
            //or
            //this way
            // cards += [card, card]
        }
        cards.shuffle()
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
