//
//  ConcentrationDataModel.swift
//  Concentration
//
//  Created by Charity Youngblood  on 2/23/18.
//  Copyright © 2018 Charity Youngblood . All rights reserved.
//

import Foundation

class ConcentrationDataModel {
    // Whenever you build a class, think about what it's public API is - a list of all the methods and instance variables in that class that you will allow other classes to call (how classes "communicate" with each other)
    // As you are designing your public API, think about the ESSENTIALS of WHAT your application does and how people are going to use it
    // For our Concentration app - what are the ESSENTIALS?
        // - cards
        // - images
    
    var cards = [Card]() // we have to define Card - to do this we need to create a struct 
    
    func chooseCard(at index: Int) {
        
    }
    
    init(numberOfPairsOfCards: Int) { // this is what we need to create our game - the number of pairs of cards will be fed to the ConcentrationDataModel
        for identifier in 1..<numberOfPairsOfCards {
        let card = Card(identifier: identifier)
        let matchingCard = card
        cards.append(card)
        cards.append(matchingCard)
    // instead of append you could use cards += [card, card]
        }
        // **TODO: Shuffle the cards** 
    }
}
