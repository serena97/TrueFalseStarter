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
        
        //to ensure a new trivia object is created so all the questions will show up again, or add all the Question into the questions[] once game over
        
        
        print("the number of questions in the array = \(trivia.questions.count)")
        trivia.indexOfSelectedQuestion = GKRandomSource.sharedRandom().nextIntWithUpperBound(trivia.questions.count)
        print("index \(trivia.indexOfSelectedQuestion) to check the questions are in random order")

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
        
        
        let actualAnswer = trivia.questions[trivia.indexOfSelectedQuestion].answerIndex
        let stringActualAnswer = trivia.questions[trivia.indexOfSelectedQuestion].options[actualAnswer-1]
        
        switch sender {
        case option1:
            if (sender === option1 &&  actualAnswer == 1){
                trivia.correctQuestions += 1
                questionField.text = "Correct!"
            } else {
                questionField.text = "Sorry, wrong answer! Correct Answer is \(stringActualAnswer)"
            }
        case option2:
            if (sender === option2 &&  actualAnswer == 2){
                trivia.correctQuestions += 1
                questionField.text = "Correct!"
            } else {
                questionField.text = "Sorry, wrong answer! Correct Answer is \(stringActualAnswer)"
            }
        case option3:
            if (sender === option3 &&  actualAnswer == 3){
                trivia.correctQuestions += 1
                questionField.text = "Correct!"
            } else {
                questionField.text = "Sorry, wrong answer! Correct Answer is \(stringActualAnswer)"
            }
        case option4:
            if (sender === option4 &&  actualAnswer == 4){
                trivia.correctQuestions += 1
                questionField.text = "Correct!"
            } else {
                questionField.text = "Sorry, wrong answer! Correct Answer is \(stringActualAnswer)"
            }
        default : break;
            
        }
        
        //no question will be repeated within a single game.
        trivia.questionFinished()
        
        
        //debug
        print("trivia questions asked = \(trivia.questionsAsked) , questions per round = \(trivia.questionsPerRound)");
        
        //
        
        loadNextRoundWithDelay(seconds: 2)
        
        
        
        
    }
    
    func nextRound() {
        if trivia.questionsAsked == trivia.questionsPerRound {
            // Game is over
            displayScore()
            trivia.renewQuestions()
            
        } else {
            // Continue game
            displayQuestion()
        }
    }
    
    @IBAction func playAgain() {
        // Show the answer buttons
        for option in options {
            option.hidden = false
        }

        
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

