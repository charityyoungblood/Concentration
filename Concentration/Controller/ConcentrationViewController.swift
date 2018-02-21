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

    @IBAction func touchCard(_ sender: UIButton) { // in Swift, ever argument/parameter has a name in front of the data type that you include when you call the method
        // this actually equates to two names: an internal name - the name we use inside of the implementation (inside the curly braces)
        // external name: the name callers use
        
        flipCard(buttonImage: "Microphone.png", on: sender)
    }
    
    //let image = #imageLiteral(resourceName: "Microphone")
    
     func flipCard(buttonImage: String, on Button: UIButton) { // ***REMEMBER: when picking function argument names, they should read like English***
    // this function should check to see if there is an image on the card currently
        // if there is an image, it should "turn the card over" and display the back of the card (solid color)
        // if there is not currently an image showing, it should "turn the card over" and display the image side of the card
        // ***NOTE ON DOCUMENTATION: when you see a description that reads static var highlighted: UIControlState, you'll place it in the code as nameOfClass.nameOfProperty
        // Ex: button.setTitle("", UIControlState.highlighted)
        if Button.currentImage == UIImage(named: "Microphone.png") {
            print("the image is a mic")
        }
        
        else { // set button background color to the "back of card" color
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

