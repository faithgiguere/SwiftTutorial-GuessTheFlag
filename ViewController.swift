//
//  ViewController.swift
//  GuessTheFlag
//

import GameplayKit
import UIKit

class ViewController: UIViewController {
    // Correspond to the three buttons containing flag choices
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    
    // Array of all countries available in the game
    var countries = [String]()
    // Correct flag for given country
    var correctAnswer = 0
    // User's total score
    var score = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Create borders for the buttons to make flags with white more visible
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
    
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
        
        
        // Add applicable countries to the array of countries
        countries.append("estonia")
        countries.append("france")
        countries.append("germany")
        countries.append("ireland")
        countries.append("italy")
        countries.append("monaco")
        countries.append("nigeria")
        countries.append("poland")
        countries.append("russia")
        countries.append("spain")
        countries.append("uk")
        countries.append("us")
        
        askQuestion()
    }
    
    func askQuestion () {
        // Randomly generate the three flags to be displayed
        countries = GKRandomSource.sharedRandom().arrayByShufflingObjects(in: countries) as! [String]
        
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        
        // Set one of the three displayed flags to be the "correct answer" flag
        correctAnswer = GKRandomSource.sharedRandom().nextInt(upperBound: 3)
        
        // Display the "correct answer" flag's country name at the top
        // This will be the country that the user is attempting to pick the flag for
        title = countries[correctAnswer].uppercased()
    }
    
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        var title: String
        
        // If user's choice is correct add to score, otherwise subtract from score
        if sender.tag == correctAnswer {
            title = "Correct!"
            score += 1
        }
        else {
            title = "Wrong"
            score -= 1
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

