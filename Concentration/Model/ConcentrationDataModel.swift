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
    
    var indexOfOneAndOnlyFaceUpCard: Int?
    
    // for our chooseCard function - there are three cases we need to look at
        // No cards are face up - if no cards are face up, when I choose a card, it will flip that card over
        // Two cards are face up - either matching or not matching - if this case is true, when you choose another card, the program needs to flip the original two cards face down
        // One card face up - then I choose another card, I need to see if that card matches the other card
    
// We'll need to keep track of when there is ONLY ONE card face up - as we will need to check it, and see if it matches the other card
    func chooseCard(at index: Int) {
        // first - we will ignore a card that has already been matched
        if !cards[index].isMatched {
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index { // if we let matchIndex equal the indexOfOneAndOnlyFaceUpCard AND matchIndex is NOT equal to the index of the card you chose, i.e. the SAME card
                // check if cards match
                if cards[matchIndex].identifier == cards[index] { // we are checking inside the cards array for the identifier and if it is set equal to the cards array index that the player chose, then we are matching the matchIndex (set to true) and matching the card index (set to true) 
                   cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = nil
            }
            
            else {
                // either no cards or 2 cards are face up
            }
        }
        if cards[index].isFaceUp {
            cards[index].isFaceUp = false
        }
        
        else {
            cards[index].isFaceUp = true
        }
        
    }
    
    init(numberOfPairsOfCards: Int) { // this is what we need to create our game - the number of pairs of cards will be fed to the ConcentrationDataModel
        for identifier in 1...numberOfPairsOfCards {
        let card = Card(identifier: identifier)
        let matchingCard = card
        cards.append(card)
        cards.append(matchingCard)
    // instead of append you could use cards += [card, card]
        }
        // **TODO: Shuffle the cards** 
    }
}
