//
//  Deck.swift
//  Matchractive
//
//  Created by Jason nghe on 4/18/15.
//  Copyright (c) 2015 Jason nghe. All rights reserved.
//

import UIKit

class Deck: NSObject {
    var cards = [Card]()
    
    
    func addCard(card: Card, atTop: Bool){
        if atTop {
            self.cards.insert(card, atIndex:0)
        } else {
            self.cards.append(card)
        }
    }
    
    func addCard(card: Card) {
        self.addCard(card, atTop: false)
    }
    

    func drawRandomCard() -> Card {
        var randomCard = Card()
        if !self.cards.isEmpty {
            var index = Int(arc4random()) % self.cards.count
            randomCard = self.cards[index]
            self.cards.removeAtIndex(index)
        }
        return randomCard
        
    }
}
