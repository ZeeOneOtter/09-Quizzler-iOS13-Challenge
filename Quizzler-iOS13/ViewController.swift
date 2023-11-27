//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    
    var quiz = [
        ["Four + Two = Six", "True"],
        ["Five - Three > One", "True"],
        ["Three + Eight < Ten", "False"]
    ]
    
    var questionNumber = 0
    var userScore = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        progressBar.progress = 0.0
        quiz.shuffle()
        updateUI()
    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        let userAnswer = sender.currentTitle
        
        if questionNumber < quiz.count {
            //keep track of question Label, and total questions asked
            updateUI()
            /* actual answer variable needs to be stored here. Because questionNumber += 1 will happen, and although the if statement is such that it will continue onto else-part of the statement, the issue arises when the player presses the button another time. The variable questionNumber has now been saved last as something outside the array index by +1, thus if initalized and kept within if-statment then the issue of index error of questionNumber is avoided.
             */
            let actualAnswer = quiz[questionNumber][1]
            
            // need to see if user answer matches response
            if userAnswer == actualAnswer {
                userScore += 1
            }
                        
            //needs to be the last thing to do as we need to record user answer to correct array question/answer pairing.
            questionNumber += 1
            print("\(actualAnswer)")
        } else {
            questionLabel.text = "Yay! You've completed the quiz. \nYour Score is: \(userScore) of \(quiz.count).\nPress any button to restart the quiz."
            quiz.shuffle()
            progressBar.progress = 0.0
            questionNumber = 0
            userScore = 0
            
        }

    }
    
    func updateUI() {
        questionLabel.text = quiz[questionNumber][0]
        
        //progresBar needs to have float inputs becasue doing division on integers results in a float but rounding errors. For instance, int(5)/int(2) = 2.0 because the numbers are integers whne the calculation is done, the proper answer of 2.5 is not computed.
        let totalNumberOfQuestions = Float(quiz.count)
        let floatQuestionNumber = Float(questionNumber + 1)
        var percentQuizComplete = floatQuestionNumber/totalNumberOfQuestions
        progressBar.progress = percentQuizComplete

    }
    
    
    
    
}

