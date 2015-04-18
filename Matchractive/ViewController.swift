//
//  ViewController.swift
//  Matchractive
//
//  Created by Jason nghe on 4/18/15.
//  Copyright (c) 2015 Jason nghe. All rights reserved.
//

import UIKit
// Coolass Game!
class ViewController: UIViewController {
    // Outlets
    @IBOutlet var cardButtons: [UIButton]!
    @IBOutlet weak var scoreLabel: UILabel!
    
    // Var's and Const
    var buttonIsFlipped = Bool()
    lazy var game: CardMatchingGame = CardMatchingGame(cardCount: self.cardButtons.count, deck: PlayingCardDeck())
    
    @IBAction func touchCardButton(sender: UIButton)
    {
        var chosenButtonIndex: Int = 0
        for (i, val) in enumerate(self.cardButtons){
            if sender == val {
                chosenButtonIndex = i
            }
        }
        game.chooseCardAtIndex(chosenButtonIndex)
        self.updateUI()
    }
    
    func updateUI()
    {
        for (i,cardButton) in enumerate(self.cardButtons) {
            var card = game.cards[i]
            cardButton.setTitle(self.titleForCard(card), forState: UIControlState.Normal)
            cardButton.setBackgroundImage(self.backgroundImageforCard(card), forState: UIControlState.Normal)
            cardButton.enabled = !card.matched
            scoreLabel.text = "Score: \(self.game.score)"
            
        }
    }
    
    func titleForCard(card: Card) -> String
    {
        println("Card Contents = \(card.contents)")
        return card.chosen.boolValue ? card.contents : ""
    }
    
    func backgroundImageforCard(card: Card) -> UIImage
    {
        println("Here?")
        return UIImage(named: card.chosen ? "cardfront" : "cardback")!
    }
    
}