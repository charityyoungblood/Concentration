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
    
    var flipCount = 0 {
        didSet {
            flipCountLabel.text = "Flips: \(flipCount)"
        }
    }
    
    // to show the user the flipCount - we have to add it to our UI with a text field or a label

    @IBOutlet weak var flipCountLabel: UILabel!
    
    @IBOutlet var cardButtons: [UIButton]! // this is an array of UIButtons
    // We will need to look into the array above and locate which card has been touched
    
    var cardImageChoices: [UIImage] = [#imageLiteral(resourceName: "Microphone"), #imageLiteral(resourceName: "Microphone"), #imageLiteral(resourceName: "Microphone"), #imageLiteral(resourceName: "Microphone"), #imageLiteral(resourceName: "Microphone"), #imageLiteral(resourceName: "Microphone"), #imageLiteral(resourceName: "Microphone"), #imageLiteral(resourceName: "Microphone")]
    
    @IBAction func touchCard(_ sender: UIButton) { // in Swift, ever argument/parameter has a name in front of the data type that you include when you call the method
        // this actually equates to two names: an internal name - the name we use inside of the implementation (inside the curly braces)
        // external name: the name callers use
        flipCount += 1
        if let cardNumber = cardButtons.index(of: sender) { // this looks into the cardButtons array > "if" the optional (index?) is in the set state > cardNumber finds an index of the cardButtons array, it will run the code below
                flipCard(withImage: cardImageChoices[cardNumber], on: sender)
        }
        else {
            print("chosen card was not in cardButtons")
        }
        //flipCard(buttonImage: UIImage(named: "Microphone.png")!, on: sender)
    }
    
// **Our code won't be DRY if we have to of the EXACT SAME METHODS - so we delete the method for second card and create a method that all of our cards get called on **
// To do this effectively, we need to create an array (a collection) of all the cards
    
            // @IBAction func touchSecondCard(_ sender: UIButton) {
                //  flipCount += 1 // each time a card is touched, we will increase the flipCount by 1
                //  flipCard(buttonImage: "Microphone.png", on: sender) // this is the card on the left - you need to add more images
                //    }
    
     func flipCard(withImage buttonImage: UIImage, on button: UIButton) { // ***REMEMBER: when picking function argument names, they should read like English***
    // this function should check to see if there is an image on the card currently
        // if there is an image, it should "turn the card over" and display the front of the card (solid color)
        // if there is not currently an image showing, it should "turn the card over" and display the image side of the card
        // ***NOTE ON DOCUMENTATION: when you see a description that reads static var highlighted: UIControlState, you'll place it in the code as nameOfClass.nameOfProperty
        // Ex: button.setTitle("", UIControlState.highlighted)
     
        // button.setImage(nil, for: UIControlState.normal)
// **Once we create the array, you can pull the index number and use to display the image (for the if statement below)**
        let cardImage = cardButtons.index(of: button)
        
        if (button.currentImage != nil) { // this checks the current image on the card. If the array of cardImageChoices contains the current button image, it's button background to the "front - solid color" side of the card
            button.setImage(nil, for: UIControlState.normal)
             button.backgroundColor = #colorLiteral(red: 0.4816493988, green: 0.6940720677, blue: 0.7372941375, alpha: 1)
        }
        
        else { // this sets the button background color to the "image side" color
            button.setImage(cardImageChoices[cardImage!], for: UIControlState.normal)
            button.backgroundColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        }
    }
    
    
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

