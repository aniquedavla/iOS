//
//  Set_Game.swift
//  Set_Lab_2
//
//  Created by Anique Davla on 9/25/19.
//  Copyright © 2019 Anique. All rights reserved.
//

import Foundation

class SetGame {
    var gameCards = [Card]()
    var score = 0;
    var deselected = 0;
    var canDeal3MoreCards = true
    var cardsSelected = [Int]()

    //choose the Card based on Index of the array of cards
    func chooseCard(at cardNumber: Int) {
        if !gameCards[cardNumber].isMatched {
            let matchIndex = cardNumber
            if(gameCards[matchIndex].identifier == gameCards[cardsSelected[cardNumber]].identifier){
                gameCards[matchIndex].isMatched = true
                gameCards[cardNumber].isMatched = true
                //give points for correct match
               score += Points.matchPoint
            }else {
                score += Points.missMatch
            }
            gameCards[cardNumber].isFaceUp = true
        } else {
            for flipDownIndex in cardsSelected.indices {
                gameCards[flipDownIndex].isFaceUp  = false
            }
            gameCards[cardNumber].isFaceUp = true
        }

    }
    init(numberOfCards: Int) {
        for _ in 1...numberOfCards {
            let card = Card()
            gameCards.append(card)
        }
        gameCards.shuffle()
    }
}
enum Points{
    static let matchPoint = 3
    static let missMatch = -3
    static let deselection = -1
}

extension Array {
    
    mutating func shuffle() {
        
        if count < 2 { return }
        
        for i in indices.dropLast() {
            
            let diff = distance(from: i, to: endIndex)
            
            let j = index(i, offsetBy: diff.arc4random)
            
            swapAt(i, j)
        }
    }
}
