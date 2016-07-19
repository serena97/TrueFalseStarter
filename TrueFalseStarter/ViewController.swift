//
//  ViewController.swift
//  TrueFalseStarter
//
//  Created by Pasan Premaratne on 3/9/16.
//  Copyright © 2016 Treehouse. All rights reserved.
//

import UIKit
import GameKit
import AudioToolbox

class ViewController: UIViewController {
    
    

    
    var gameSound: SystemSoundID = 0//initial commit test
    
    var trivia = FactModel()
    
    @IBOutlet weak var option1: UIButton!
    
    @IBOutlet weak var option2: UIButton!
    @IBOutlet weak var questionField: UILabel!
    @IBOutlet weak var option3: UIButton!
    @IBOutlet weak var option4: UIButton!
    @IBOutlet weak var playAgainButton: UIButton!
 

    var options: [UIButton] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        loadGameStartSound()
        // Start game
        playGameStartSound()
        
        options = [option1, option2, option3, option4]
        
        displayQuestion()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func displayQuestion() {
        
        trivia.indexOfSelectedQuestion = GKRandomSource.sharedRandom().nextIntWithUpperBound(trivia.questions.count)
        print("index \(trivia.indexOfSelectedQuestion)")

        let questionObject = trivia.questions[trivia.indexOfSelectedQuestion]
        questionField.text = questionObject.question
        
        questionField.text = questionObject.question
        playAgainButton.hidden = true
        
        var optionIndex = 0
        for option in options {
            let optionString = questionObject.options[optionIndex]
            option.setTitle(optionString, forState: UIControlState.Normal)
            optionIndex += 1
        }
        
    }
    
    func displayScore() {
        // Hide the answer buttons
        for option in options {
            option.hidden = true
        }
        
        // Display play again button
        playAgainButton.hidden = false
        
        questionField.text = "Way to go!\nYou got \(trivia.correctQuestions) out of \(trivia.questionsPerRound) correct!"
        
    }
    
    @IBAction func checkAnswer(sender: UIButton) {
        // Increment the questions asked counter
        trivia.questionsAsked += 1
        
        let actualAnswer = trivia.questions[trivia.indexOfSelectedQuestion].answerIndex
       
        
        switch sender {
        case option1:
            if (sender === option1 &&  actualAnswer == 1){
                trivia.correctQuestions += 1
                questionField.text = "Correct!"
            } else {
                questionField.text = "Sorry, wrong answer!"
            }
        case option2:
            if (sender === option2 &&  actualAnswer == 2){
                trivia.correctQuestions += 1
                questionField.text = "Correct!"
            } else {
                questionField.text = "Sorry, wrong answer!"
            }
        case option3:
            if (sender === option3 &&  actualAnswer == 3){
                trivia.correctQuestions += 1
                questionField.text = "Correct!"
            } else {
                questionField.text = "Sorry, wrong answer!"
            }
        case option4:
            if (sender === option4 &&  actualAnswer == 4){
                trivia.correctQuestions += 1
                questionField.text = "Correct!"
            } else {
                questionField.text = "Sorry, wrong answer!"
            }
        default : break;
            
        }
    
    
        
        loadNextRoundWithDelay(seconds: 2)
    }
    
    func nextRound() {
        if trivia.questionsAsked == trivia.questionsPerRound {
            // Game is over
            displayScore()
        } else {
            // Continue game
            displayQuestion()
        }
    }
    
    @IBAction func playAgain() {
        // Show the answer buttons

        
        trivia.questionsAsked = 0
        trivia.correctQuestions = 0
        nextRound()
    }
    

    
    // MARK: Helper Methods
    
    func loadNextRoundWithDelay(seconds seconds: Int) {
        // Converts a delay in seconds to nanoseconds as signed 64 bit integer
        let delay = Int64(NSEC_PER_SEC * UInt64(seconds))
        // Calculates a time value to execute the method given current time and delay
        let dispatchTime = dispatch_time(DISPATCH_TIME_NOW, delay)
        
        // Executes the nextRound method at the dispatch time on the main queue
        dispatch_after(dispatchTime, dispatch_get_main_queue()) {
            self.nextRound()
        }
    }
    
    func loadGameStartSound() {
        let pathToSoundFile = NSBundle.mainBundle().pathForResource("GameSound", ofType: "wav")
        let soundURL = NSURL(fileURLWithPath: pathToSoundFile!)
        AudioServicesCreateSystemSoundID(soundURL, &gameSound)
    }
    
    func playGameStartSound() {
        AudioServicesPlaySystemSound(gameSound)
    }
}

