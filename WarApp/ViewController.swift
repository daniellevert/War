//
//  ViewController.swift
//  WarApp
//
//  Created by Daniel LeVert on 8/4/19.
//  Copyright © 2019 Daniel LeVert. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var leftImageView: UIImageView!
    
    @IBOutlet weak var rightImageView: UIImageView!
    
    @IBOutlet weak var leftScoreLabel: UILabel!
    
    @IBOutlet weak var rightScoreLabel: UILabel!
    
    @IBOutlet weak var phraseLabel: UILabel!
    
    var leftScore = 0
    var rightScore = 0
    
    let losingPhrases = ["I guess you're not very good at this...", "I can't believe the computer is beating you!", "I know you have no control over this, but are you really trying your best?"]
    let winningPhrases = ["You're winning for once. That's the spirit!", "Keep up this lucky streak", "Charlie Sheen would be proud of this winning"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    @IBAction func dealTapped(_ sender: Any) {
        
        let leftRandomNumber = arc4random_uniform(13) + 2
        // print("Left random number is: \(leftRandomNumber)")
        
        let rightRandomNumber = arc4random_uniform(13) + 2
         // print("Right random number is: \(rightRandomNumber)")
            
        leftImageView.image = UIImage(named: "card\(leftRandomNumber)")
        
        rightImageView.image = UIImage(named: "card\(rightRandomNumber)")
        
        // Checks card numbers and updates labels and scores appropriately
        if leftRandomNumber > rightRandomNumber {
            // Update score
            leftScore += 1
            
            // Update label with new score
            leftScoreLabel.text = String(leftScore)
        }
        else if rightRandomNumber > leftRandomNumber {
            // Update score
            rightScore += 1
            
            // Update label with new score
            rightScoreLabel.text = String(rightScore)
        }
        else if leftRandomNumber == rightRandomNumber {
            // do something
        }
        
        var randArrayNumber = 0
        // Display phrase depending on score
        if (leftScore > rightScore) {
            randArrayNumber = Int(arc4random_uniform(3))
            
            phraseLabel.text = winningPhrases[randArrayNumber]
            
        }
        else if (rightScore > leftScore) {
            randArrayNumber = Int(arc4random_uniform(3))
            
            phraseLabel.text = losingPhrases[randArrayNumber]
        }
        else {
            phraseLabel.text = "Tied."
        }
    }
    
}

