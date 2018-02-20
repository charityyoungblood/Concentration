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
        
        print("the card is being touched")
    }
    
    // func flipCard(the image you want to display on the card: String, on Button: UIButton) { // ***REMEMBER: when picking function argument names, they should read like English***
    // this function should check to see if there is an image on the card currently
        // if there is an image, it should "turn the card over" and display the back of the card (solid color)
        // if there is not currently an image showing, it should "turn the card over" and display the image side of the card 
        //}
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

