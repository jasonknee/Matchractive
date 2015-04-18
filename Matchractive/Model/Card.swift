//
//  Card.swift
//  Matchractive
//
//  Created by Jason nghe on 4/18/15.
//  Copyright (c) 2015 Jason nghe. All rights reserved.
//

import UIKit

class Card: NSObject {
    var contents: String { return "" }
    var chosen = false
    var matched = false
    func match(otherCards: [Card]) -> Int
    {
        var score: Int = 0
        for card in otherCards {
            if (card.contents == self.contents) {
                score = 1
            }
        }
        return score
    }
    
    
    
}

