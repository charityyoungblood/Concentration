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
    
    init(identifier: Int) {
        self.identifier = identifier // both the external and internal parameter name is the same - this is usually the case when you are using init
        // to distinguish between the var identifier and parameter identifier in init, use the "self" keyword 
    }
}
