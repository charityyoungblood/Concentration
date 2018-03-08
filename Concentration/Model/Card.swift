//
//  Card.swift
//  Concentration
//
//  Created by Charity Youngblood  on 2/23/18.
//  Copyright © 2018 Charity Youngblood . All rights reserved.
//

import Foundation

// **MARK: (For Access Control) Should we make our struct Card or it's vars "private"?
struct Card {
    var isFaceUp = false // We need to know if a card is "face up", so we will NOT set this to "private"
    var isMatched = false // We need to know if a card is "face down", so we will NOT set this to "private"
    var identifier: Int // We need to know if the identifier of a card, so we will NOT set this to "private"
    // this is a unique identifier to identify the cards
  // we want to create a "unique identifier" in the struct Card
    
    // **MARK: (For Access Control) Should we make our static var identifierFactory "private"?
        // YES, as this is internal implementation
    static var identifierFactory = 0
    
    // **MARK: (For Access Control) Should we make our static func getUniqueIdentifier "private"?
        // YES, as this is internal implementation
    
    // static func means you can't send it to the "class" or "struct" directly - only to the data type itself
    static func getUniqueIdentifier() -> Int { // this function returns an Int that is unique, i.e. changes every time it is called
        Card.identifierFactory += 1
        return Card.identifierFactory
        // Since you are in the "static func", which is referring to the "Card" you can also use the following syntax:
            // identifierFactory +=1
            // return identifierFactory
    }
        
    init(identifier: Int) {
        self.identifier = Card.getUniqueIdentifier() // both the external and internal parameter name is the same - this is usually the case when you are using init
        // to distinguish between the var identifier and parameter identifier in init, use the "self" keyword 
    }
}
