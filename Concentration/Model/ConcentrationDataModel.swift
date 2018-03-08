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
    
    // **IMPORTANT** For Computed Property Below:
        // We will create a "set" and a "get" for indexOfOneAndOnlyFaceUpCard
        //
    var indexOfOneAndOnlyFaceUpCard: Int? {
        get {// here, we want to GET the index value of indexOfOneAndOnlyFaceUpCard
            var foundIndex: Int? // We create a variable to hold/store the value of the located index - we will look through all the face cards and see if we can FIND one and this variable will hold the one we found
            for index in cards.indices {// We create a "for" loop and go through all of the cards indices - we will look at each card then we will set foundIndex to the index of the located, "face up" card
                if cards[index].isFaceUp {//if that card is face up
                    if foundIndex == nil{ //if foundIndex is nil
                        foundIndex = index
                    }
                    else {// this else statement would be for the "second" face up card you find
                        return nil //we return "nil" because if there are TWO face up cards, then the indexOfOneAndOnlyFaceUpCard is "nil"
                    }
                }
                
            }
                    return foundIndex // this will EITHER be set to the ONE card we found in the for loop, or it will be "nil" from the declaration of foundIndex - as Optionals ALWAYS get set to "nil" or "not set" initially
            }
        
        set { // newValue is a "internal" XCode local variable - that contains the "new value" someone "set" indexOfOneAndOnlyFaceUpCard to
            // usually we don't include an argument for set - if you DON'T put an argument, it will "default" to "newValue"
            // For the "set" case, we will go through all of the cards and turn them ALL face down -- EXCEPT -- for indexOfOneAndOnlyFaceUpCard
            for index in cards.indices {// We will iterate through the card indices
                cards[index].isFaceUp = (index == newValue) // cards[index].isFaceUp is "false" for most cards - BUT in case the index in the cards.indices is EQUAL to the indexOfOneAndOnlyFaceUpCard, remember this is the local variable (newValue - the value that is passed through the indexOfOneAndOnlyFaceUpCard computed property, then we will set the cards[index].isFaceUp expression to "TRUE" by comparing the value of index to newValue
            }
        }
    }
    
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
                if cards[matchIndex].identifier == cards[index].identifier { // we are checking inside the cards array for the identifier and if it is set equal to the cards array index that the player chose, then we are matching the matchIndex (set to true) and matching the card index (set to true)
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
               // Since we have changed indexOfOneAndOnlyFaceUpCard to a "computed property" we NO LONGER need to set indexOfOneAndOnlyFaceUpCard to "nil" - this is the case where we found two cards, that we are trying to "match", since there are  TWO cards, we had to ORIGINALLY set the indexOfOneAndOnlyFaceUpCard to "nil" as after the above operation for matchIndex runs, we would have MORE THAN one card face up
                // Now, EVERY TIME we ask for the value of indexOfOneAndOnlyFaceUpCard, it will be "COMPUTED" so we will not need to "set" the value MANUALLY
            }
         // In the "else" statement below, we are "setting" the index of indexOfOneAndOnlyFaceUpCard to be the "index" - i.e. the value of the argument passed into the chooseCard function
        // As this was the case for when there were ALREADY two cards face up  - since we "set" indexOfOneAndOnlyFaceUpCard in the computed property, we DO NOT need to flip down the cards or check which cards are face up
            else {
                indexOfOneAndOnlyFaceUpCard = index // the only card that is face up is the one you chose, i.e. index
            }
        }
    }
    
    init(numberOfPairsOfCards: Int) { // this is what we need to create our game - the number of pairs of cards will be fed to the ConcentrationDataModel
        for identifier in 1...numberOfPairsOfCards {
            let card = Card(identifier: identifier)
            // generate a random index to place matching card somewhere other than next to original card
            let randomInsert = Int(arc4random_uniform(UInt32(cards.count)))
            let matchingCard = card
            cards.append(card) // here is where card images are added to the array - the original card image + the matching card image are being added so they are right next to each other
            cards.insert(matchingCard, at: randomInsert) // this makes it so the card is not placed right next to the matched card (shuffle)
            // instead of append you could use cards += [card, card]
        }
        // **Shuffle the cards - DONE in line 57 and 60**
        }
    
    }

