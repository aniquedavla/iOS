//
//  Card.swift
//  Set_Lab_2
//
//  Created by Anique Davla on 9/25/19.
//  Copyright © 2019 Anique. All rights reserved.
//

import Foundation

struct Card: Hashable {
    //var shape: String
    var isFaceUp = true
    var isMatched = false
    var isDeselected = false
    var identifier: Int
    
    static var identifierFactory = 0
    
    static func hash(into: Card){
    
    }
    static func getUniqueIdentifier() -> Int {
        identifierFactory += 1
        return identifierFactory
    }
    init() {
        self.identifier = Card.getUniqueIdentifier()
    }

}
