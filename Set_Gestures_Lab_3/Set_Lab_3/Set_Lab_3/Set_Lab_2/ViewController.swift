//
//  ViewController.swift
//  Set_Lab_2
//
//  Created by Anique Davla on 9/10/19.
//  Copyright © 2019 Anique. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var game = SetGame(numberOfCards: numberOfCards)
    
    var numberOfCards: Int {
        return cardButtons.count
    }
    @IBOutlet var cardButtons: [UIButton]!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    var cardsSelected =  [Int]() {
        didSet{
            gameStatusLabel.text = "\(cardsSelected.count)/3 Cards";
        }
    }
    
    @IBOutlet weak var gameStatusLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViewFromModel()
    }
    @IBAction func touchCard(_ sender: UIButton) {
        if let cardNumber = cardButtons.firstIndex(of: sender){
            let button = cardButtons[cardNumber];
            var card = game.gameCards[cardNumber]
            //
            if(!game.cardsSelected.contains(cardNumber)){
                cardsSelected.append(cardNumber)
                game.cardsSelected.append(cardNumber)
                //show selected card
                button.layer.borderWidth = 3.0
                button.layer.borderColor = UIColor.orange.cgColor
                button.layer.cornerRadius = 8.0
                game.chooseCard(at:cardNumber)
                updateViewFromModel()
            } else{
                gameStatusLabel.text = "Card Deselected!"
                cardsSelected.remove(at:cardNumber)
                game.cardsSelected.remove(at: cardNumber)
                //show deselected card
                button.layer.borderWidth =  0
                button.layer.borderColor = nil
                button.layer.cornerRadius = 0
            }
            
            //when 3 cards are selected
            if(game.cardsSelected.count == 3){
                //let cardsMatched = matchCards(card1Str,card2Str,card3Str)
                
            }
        }
    }
    
    func updateViewFromModel(){
        for index in cardButtons.indices {
            let button = cardButtons[index]
            var card = game.gameCards[index]
            if card.isFaceUp{
                button.setAttributedTitle(aPattern(for: card), for: UIControl.State.normal)
                button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
                
            } else {
                //card.isFaceUp = true
//                button.setTitle("", for: UIControl.State.normal)
//                let hideCardColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
//                let cardNotMatchedColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
//                button.backgroundColor = card.isMatched ? hideCardColor : cardNotMatchedColor
            }
        }
        scoreLabel.text = "Score: \(game.score)"
    }
    
    // from stackover flow to concatenate attributed strings
    /* https://stackoverflow.com/questions/18518222/how-can-i-concatenate-nsattributedstrings

     */
    func addAttributedStrings (left: NSAttributedString, right: NSAttributedString) -> NSAttributedString{
        let result = NSMutableAttributedString()
        result.append(left)
        result.append(right)
        return NSAttributedString(attributedString: result)
    }
    var patternString = [Int:NSAttributedString]()
    func aPattern(for card:Card) -> NSAttributedString {
        let features = 3
        let randomIndex = Int(arc4random_uniform(UInt32 (features)))
        let unicodeSquare = "\u{25A2}"
        let unicodeCircle = "\u{25CB}"
        let unicodeTriangle = "\u{25B3}"
        let shades = ["fill","solid","clear"]
        let colors = [ #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1), #colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 1),#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1) ]
        let shapes = [unicodeTriangle, unicodeCircle,unicodeSquare]
        let optionalStr = NSAttributedString(string:"?")
        if (patternString[card.identifier] == nil) {
            var entireStr: NSAttributedString = NSAttributedString(string: "")
            //loop for the number of shape combinations
            //let font = UIFont.systemFont(ofSize: 12)
            for _ in 0...randomIndex{
                let features = 3
                var randomNumber = Int(arc4random_uniform(UInt32 (features)))
                //filled look
                var strokedAttributes:[NSAttributedString.Key: Any] = [:]
                if(randomNumber == 2){
                    //filled look
                    strokedAttributes = [
                        .foregroundColor: colors[randomIndex].withAlphaComponent(100),
                        .strokeWidth : -18,
                    ]
                }
                else if (randomNumber == 1){
                    //striped look
                    strokedAttributes = [
                        .strokeColor:colors[randomIndex],
                        .foregroundColor:colors[randomIndex].withAlphaComponent(10)
                    ]
                }
                else{
                    //outline
                    strokedAttributes = [
                        .strokeWidth : 5.0,
                        .strokeColor:colors[randomIndex]
                    ]
                }
            let attributedStr = NSAttributedString(string:shapes[randomNumber],attributes: strokedAttributes)
                entireStr = addAttributedStrings(left:entireStr, right:attributedStr)
                entireStr = addAttributedStrings(left: entireStr, right: NSAttributedString(string: " "))
            }
            patternString[card.identifier] = entireStr
        }
        return patternString[card.identifier] ?? optionalStr
    }
    
    func matchCards(_ card1Sr: String,_ card2Str: String,_ card3Str: String) -> Bool {
        return true
    }
}

extension Int {
    var arc4random: Int {
        if self > 0 {
            return Int(arc4random_uniform(UInt32(self))) }
        else if self < 0 {
            return -Int(arc4random_uniform(UInt32(abs(self))))
        } else {
            return 0
        }
    }
}
