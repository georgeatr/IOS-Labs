//
//  ViewController.swift
//  myLab1
//
//  Created by Jorge Torres on 2022-02-15.
//

import UIKit

class ViewController: UIViewController {
    
    //Declaring Variables for different UI Elements
    @IBOutlet weak var titleText1880: UILabel!
    @IBOutlet weak var hitMeButton1880: UIButton!
    @IBOutlet weak var scoreText1880: UILabel!
    @IBOutlet weak var roundText1880: UILabel!
    @IBOutlet weak var slider: UISlider!
    
    //Random Number for the top number
    var randomNum = Int.random(in: 1...100)
    //Declaring both values that go on the score and round texts
    var currentRound = 0
    var currentScore = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Selecting the start values when app starts and changing texts of the labels
        self.titleText1880.text = "Put the Bull's Eye as close as you can to: " + String(randomNum)
        self.scoreText1880.text = "Score: " + String(currentScore)
        self.roundText1880.text = "Round: " + String(currentRound)
        self.slider.minimumValue = 1
        self.slider.maximumValue = 100
        // Do any additional setup after loading the view.
    }
    
    //When pressing the hit me button, both values will be updated, the current score will be 100 - absolute value of the slider value - the random number. Text wll be updated after same as both score and round values
    @IBAction func onPressHitMe(_ sender: Any) {
        currentRound += 1
        roundText1880.text = "Round: " + String(currentRound)
        currentScore += 100 - abs(randomNum - Int(round(slider.value)))
        scoreText1880.text = "Score: " + String(currentScore)
        randomNum = Int.random(in: 1...100)
        titleText1880.text = "Put the Bull's Eye as close as you can to: " + String(randomNum)
    }
    
    //when pressing the start over button both round and score values will be reset to 0, the text will be updated and the title text will get a new value while being updated.
    @IBAction func onPressStartOver(_ sender: Any) {
        currentScore = 0
        currentRound = 0
        roundText1880.text = "Round: " + String(currentRound)
        scoreText1880.text = "Score: " + String(currentScore)
        randomNum = Int.random(in: 1...100)
        titleText1880.text = "Put the Bull's Eye as close as you can to: " + String(randomNum)
    }
}

