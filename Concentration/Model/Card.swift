//
//  Card.swift
//  Concentration
//
//  Created by Charity Youngblood  on 2/23/18.
//  Copyright © 2018 Charity Youngblood . All rights reserved.
//

import Foundation

struct Card {
    var isFaceUp = false
    var isMatched = false
    var identifier: Int // this is a unique identifier to identify the cards
  // we want to create a "unique identifier" in the struct Card
    
    static var identifierFactory = 0
    
    // static func means you can't send it to the "class" or "struct" directly - only to the data type itself
    
    static func getUniqueIdentifier() -> Int { // this function returns an Int that is unique, i.e. changes every time it is called
        Card.identifierFactory += 1
        return Card.identifierFactory
    }
        
    init(identifier: Int) {
        self.identifier = Card.getUniqueIdentifier() // both the external and internal parameter name is the same - this is usually the case when you are using init
        // to distinguish between the var identifier and parameter identifier in init, use the "self" keyword 
    }
}
