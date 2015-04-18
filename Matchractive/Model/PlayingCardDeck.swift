//
//  PlayingCardDeck.swift
//  Matchractive
//
//  Created by Jason nghe on 4/18/15.
//  Copyright (c) 2015 Jason nghe. All rights reserved.
//

import UIKit

class PlayingCardDeck: Deck {
    override init() {
        super.init()
        for suit in PlayingCard.validSuits() {
            for var rank = 1; rank <= PlayingCard.maxRank(); rank++ {
                var card: PlayingCard = PlayingCard()
                card.rank = rank
                card.suit = suit
                self.addCard(card)
            }
        }
    }
}
