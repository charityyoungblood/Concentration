//
//  ViewController.swift
//  Concentration
//
//  Created by Charity Youngblood  on 2/20/18.
//  Copyright © 2018 Charity Youngblood . All rights reserved.
//

import UIKit

class ConcentrationViewController: UIViewController { //UIViewController is the superclass of ConcentrationViewController - REMEMEBER the superclass is the "main" class that other classes inherit from
    // the class UIViewController is in UIKit - and knows everything about controlling the UI of the application - since our ConcentrationViewController "inherits" everything from the UIViewController superclass, it now has access to everything the UIViewController has access to
    
    // To keep track of the amount of times each card has been flipped over, we wil create an instance variable to track
    // ***REMEMBER: ALL variables and properties have to be INITIALIZED in Swift, i.e. it has to be assigned to some value***
    
    lazy var game = ConcentrationDataModel(numberOfPairsOfCards: (cardButtons.count + 1) / 2) // this is an instance variable of the ConcentrationDataModel class
    
    // When we create our Concentration game, we have to say how many cards there are
    
    
    var flipCount = 0 {
        didSet {
            flipCountLabel.text = "Flips: \(flipCount)"
        }
    }
    
    // to show the user the flipCount - we have to add it to our UI with a text field or a label

    @IBOutlet weak var flipCountLabel: UILabel!
    
    @IBOutlet var cardButtons: [UIButton]! // this is an array of UIButtons
    // We will need to look into the array above and locate which card has been touched
    
    // **TODO: Make a "new game" button to start the game once all cards have been selected 
    
    @IBAction func touchCard(_ sender: UIButton) { // in Swift, ever argument/parameter has a name in front of the data type that you include when you call the method
        // this actually equates to two names: an internal name - the name we use inside of the implementation (inside the curly braces)
        // external name: the name callers use
        flipCount += 1
        if let cardNumber = cardButtons.index(of: sender) { // this looks into the cardButtons array > "if" the optional (index?) is in the set state > cardNumber finds an index of the cardButtons array, it will run the code below
                game.chooseCard(at: cardNumber)
                updateViewFromModel()
        }
        else {
            print("chosen card was not in cardButtons")
        }
        //flipCard(buttonImage: UIImage(named: "Microphone.png")!, on: sender)
    }
    
    func updateViewFromModel() {// this function will look at all of our cards in the cards variable (from ConcentrationDataModel) and make sure all of our cardButtons match
    // this function needs to look up the "index" value IN the card array so we can tell which card it is
        
        // When we invoke the function of chooseCard - the game wil change - in this case, we'll need to update our View from the model 
        for index in cardButtons.indices { // since we want to look up the card index, specifically, we go through the cardButton array by index - using the .indices method
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp { // this is where we set .isFaceUp to "do something"
                button.setImage(cardImage(for: card), for: UIControlState.normal)
                button.backgroundColor = #colorLiteral(red: 0.4816493988, green: 0.6940720677, blue: 0.7372941375, alpha: 1)
            }
            
            else {
                button.setImage(nil, for: UIControlState.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0) : #colorLiteral(red: 0.482870698, green: 0.6930291057, blue: 0.7390365005, alpha: 1)
            }
        }
    }
    
    var cardImageChoices: [UIImage] = [#imageLiteral(resourceName: "CherryCake"), #imageLiteral(resourceName: "ChocolateCake"), #imageLiteral(resourceName: "WhiteCake"), #imageLiteral(resourceName: "GreenCake"), #imageLiteral(resourceName: "StrawberryShortcake"), #imageLiteral(resourceName: "FruitTart"), #imageLiteral(resourceName: "ApplePie"), #imageLiteral(resourceName: "Cupcake"), #imageLiteral(resourceName: "RedCake"), #imageLiteral(resourceName: "Truffles")] //need to change these to different images -- add in assets folder
    // When we use one of the cardImageChoices in our cardImage function - we will remove it, so that there are not two identifiers that use the same image
    // Once we use one of the images, we will remove it, so we don't use it again
    
    var imageOnCard = Dictionary<Int, UIImage>() // this is the same syntax as var imageOnCard = [Int:UIImage]
    // we create this variable because we need to use a Dictionary to access our key:value pairs
    // A Dictionary is a way to store and retrieve information
    // ***WHEN ACCESSING VALUES FROM A DICTIONARY: Remember that what we are "looking up" in the Dictionary, MIGHT NOT be included in the Dictionary - this means the Dictionary call will return an Optional
    // In order to deal with the Optional in our func cardImage - we check to see "if" the imageOnCard does NOT equal nil, then we can unwrap the Optional
    func cardImage(for card: Card) -> UIImage {// How do we ADD items to our Dictionary? We will add these ON DEMAND
        // Everytime someone asks for the emoji on the card, we will check if the image for that card is currently "nil", then we will PUT an image into the Dictionary for that card
        // We will add the images "at random"
        if imageOnCard[card.identifier] == nil, cardImageChoices.count > 0  { // you can place two if statements next to each other, separated by a comma
            let randomIndex = Int(arc4random_uniform(UInt32(cardImageChoices.count))) // arc4random_uniform is a "random number generator" - will create a random number from 0 to the value you enter in the upper_bound
                // the "upper_bound" number has to be converted to a UInt32 "type" - which is why we surround the cardImageChoices.count with parenthese and UInt32
            // the randomIndex type is Int - so we have to wrap everything to the right of the equal in () and convert to Int
            imageOnCard[card.identifier] = cardImageChoices.remove(at: randomIndex)
        }
        return imageOnCard[card.identifier] ?? #imageLiteral(resourceName: "ChocolateCake")
        //if imageOnCard[card.identifier] != nil {
          //  return imageOnCard[card.identifier]!
        // }
        //else {
          //  return #imageLiteral(resourceName: "ChocolateCake")
    }
        // another way to write our if/else statement is: return imageOnCard[card.identifier] ?? chocolate cake
        // The above alternate code means: if the image on the card is set equal to nil, return imageOnCard[card.identifier] and if not, return chocolate cake image
    
// **Our code won't be DRY if we have to of the EXACT SAME METHODS - so we delete the method for second card and create a method that all of our cards get called on **
// To do this effectively, we need to create an array (a collection) of all the cards
    
            // @IBAction func touchSecondCard(_ sender: UIButton) {
                //  flipCount += 1 // each time a card is touched, we will increase the flipCount by 1
                //  flipCard(buttonImage: "Microphone.png", on: sender) // this is the card on the left - you need to add more images
                //    }
    
//     func flipCard(withImage buttonImage: UIImage, on button: UIButton) { // ***REMEMBER: when picking function argument names, they should read like English***
//    // this function should check to see if there is an image on the card currently
//        // if there is an image, it should "turn the card over" and display the front of the card (solid color)
//        // if there is not currently an image showing, it should "turn the card over" and display the image side of the card
//        // ***NOTE ON DOCUMENTATION: when you see a description that reads static var highlighted: UIControlState, you'll place it in the code as nameOfClass.nameOfProperty
//        // Ex: button.setTitle("", UIControlState.highlighted)
//
//        // button.setImage(nil, for: UIControlState.normal)
// **Once we create the array, you can pull the index number and use to display the image (for the if statement below)**
//        let cardImage = cardButtons.index(of: button)
//
//        if (button.currentImage != nil) { // this checks the current image on the card. If the array of cardImageChoices contains the current button image, it's button background to the "front - solid color" side of the card
//            button.setImage(nil, for: UIControlState.normal)
//             button.backgroundColor = #colorLiteral(red: 0.4816493988, green: 0.6940720677, blue: 0.7372941375, alpha: 1)
//        }
//
//        else { // this sets the button background color to the "image side" color
//            button.setImage(cardImageChoices[cardImage!], for: UIControlState.normal)
//            button.backgroundColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
//        }
//    }
//
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        let button = UIButton() // trying to change the button background color to teal upon loading
//        changeBackgroundColor(on: button)
//        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

