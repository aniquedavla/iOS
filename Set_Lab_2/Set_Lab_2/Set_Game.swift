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

   
//    //choose the Card based on Index of the array of cards
//    func chooseCard(at cardNumber: Int) {
//        if !gameCards[index].isMatched {
//
//
//        }
//        else {
////            for flipDownIndex in cards.indices {
////                cards[flipDownIndex].isFaceUp  = false
////            }
//            gameCards[index].isFaceUp = true
//            indexOfThreeFaceUpCards! += [index]
//        }
//
//    }
    init(numberOfCards: Int) {
        for _ in 1...numberOfCards {
            let card = Card()
            gameCards.append(card)
        }
    }
}
enum Points{
    static let matchPoint = 3
    static let missMatch = -3
    static let deselection = -1
}
