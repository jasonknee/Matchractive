//
//  CardMatchingGame.swift
//  Matchractive
//
//  Created by Jason nghe on 4/18/15.
//  Copyright (c) 2015 Jason nghe. All rights reserved.
//

import UIKit

class CardMatchingGame: NSObject {
    
    let MISMATCH_PENALTY = 2
    let MATCH_BONUS = 4
    let COST_TO_CHOOSE = 1
    
    var score = Int()
    var cards: Array<Card> = Array()
    
    convenience init(cardCount: Int, deck: Deck)
        
    {
        self.init()
        for i in 0...cardCount {
            var card = deck.drawRandomCard()
            cards.append(card)
        }
    }
    
    func chooseCardAtIndex(index: Int)
    {
        var card:Card = cardAtIndex(index)!
        if (!card.matched) {
            if (card.chosen) {
                println("Here?")
                card.chosen = false
            } else {
                for otherCard in cards {
                    if (otherCard.chosen && !otherCard.matched) {
                        var matchScore = card.match([otherCard])
                        if (matchScore > 0) {
                            score += matchScore * MATCH_BONUS
                            otherCard.matched = true
                            card.matched = true
                        } else {
                            score -= MISMATCH_PENALTY
                            otherCard.chosen = false
                        }
                        break
                    }
                }
                
                score -= COST_TO_CHOOSE
                card.chosen = true
            }
        }
    }
    
    func cardAtIndex(index: Int) -> Card?
    {
        if (index > cards.count - 1) {
            return self.cards[self.cards.endIndex]
        }
        return self.cards[index]
    }
}
