//
//  ViewController.swift
//  Concentration 1.0
//
//  Created by Anique Davla on 9/3/19.
//  Copyright © 2019 Anique. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    lazy var game = Concentration(numberOfPairsOfCards: (cardButtons.count + 1) / 2)
    var flipCount = 0 {
        didSet {
            flipCountLabel.text = "Flips: \(flipCount)"
        }
    }
    
    @IBOutlet weak var flipCountLabel: UILabel!
    
    @IBOutlet var cardButtons: [UIButton]!
    
    
    
    @IBAction func touchCard(_ sender: UIButton) {
        flipCount += 1
        
        if let cardNumber = cardButtons.firstIndex(of: sender) {
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        } else {
            print ("Chosen card was not in cardButton")
        }
    }
    func updateViewFromModel()  {
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: UIControl.State.normal)
                button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            } else {
                button.setTitle("", for: UIControl.State.normal)
                let colorOne = UIColor(red: 1, green: 1, blue: 1, alpha: 0)
                let colorTwo = UIColor(red: 0.1018858344, green: 0.5585195038, blue: 1, alpha: 1)
                button.backgroundColor  = card.isMatched ?  colorOne: colorTwo
            }
        }
    }
    var emojiChoices = ["😀","🚴♂️","🦊","🏄♀️","💀","🤠","🏃♀️","😇","👬"]
    var emoji = [Int:String]()
    func emoji(for card: Card) -> String {
        if emoji[card.identifier] == nil, emojiChoices.count > 0 {
            let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count)))
            emoji[card.identifier] = emojiChoices.remove(at: randomIndex)
        }
        return emoji[card.identifier] ?? "?"
        
    }
    
}
