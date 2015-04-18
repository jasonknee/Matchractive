//
//  PlayingCard.swift
//  Matchractive
//
//  Created by Jason nghe on 4/18/15.
//  Copyright (c) 2015 Jason nghe. All rights reserved.
//

import UIKit

class PlayingCard: Card
{
    

    class func validSuits() -> [String]
    {
        return ["♦︎","♥︎","♣︎","♠︎"]
    }
    
    var suit: String = "?"  {
        didSet(oldSuit) {
            if !(find(PlayingCard.validSuits(), suit) != nil) {
                suit = oldSuit
            }
        }
    }
    
    var rank: Int = 0 {
        didSet(oldRank) {
            if rank > PlayingCard.maxRank() {
                rank = oldRank
            }
        }
    }


/*
    var rank: Int {
        get {
            return self.rank
        }
        set(newValue){
            self.rank = newValue <= PlayingCard.maxRank() ? newValue: self.rank
        }
    }
    
    var suit: String {
        get {
            return self.suit.isEmpty ? self.suit: "?"
        }
        set(newValue){
            if !(find(PlayingCard.validSuits(), suit) != nil) {
                self.suit = newValue
            }
        }
    }
    override var contents: String {
        get{
            var rankString = PlayingCard.rankStrings()
            return rankString[self.rank] + self.suit
        }
        set(newValue) {
            super.contents = newValue
        }
    }
    
*/
    
    override var contents: String {
        return "\(PlayingCard.rankStrings()[self.rank])\(self.suit)"
    }
    
    override func match(otherCards: [Card]) -> Int {
        var score = Int()
        if otherCards.count == 1 {
            var otherCard = otherCards.first! as! PlayingCard
            if suit == otherCard.suit {
                score = 1
            } else if rank == otherCard.rank {
                score = 4
            }
        }
        return score
    }

    class func maxRank() -> Int {
        return PlayingCard.rankStrings().count - 1
    }
    
    class func rankStrings() -> [String]! {
        return ["?","A","2","3","4","5","6","7","8","9","10","J","Q","K"]
    }

}