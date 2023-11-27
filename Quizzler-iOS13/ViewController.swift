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
        Question(q: "A slug's blood is green.", a: "True"),
        Question(q: "Approximately one quarter of human bones are in the feet.", a: "True"),
        Question(q: "The total surface area of two human lungs is approximately 70 square metres.", a: "True"),
        Question(q: "In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.", a: "True"),
        Question(q: "In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.", a: "False"),
        Question(q: "It is illegal to pee in the Ocean in Portugal.", a: "True"),
        Question(q: "You can lead a cow down stairs but not up stairs.", a: "False"),
        Question(q: "Google was originally called 'Backrub'.", a: "True"),
        Question(q: "Buzz Aldrin's mother's maiden name was 'Moon'.", a: "True"),
        Question(q: "The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.", a: "False"),
        Question(q: "No piece of square dry paper can be folded in half more than 7 times.", a: "False"),
        Question(q: "Chocolate affects a dog's heart and nervous system; a few ounces are enough to kill a small dog.", a: "True")

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
        
        //keep track of question Label, and total questions asked
//        updateUI()
        
        let userAnswer = sender.currentTitle
        
        if questionNumber + 1 < quiz.count {
            
            let actualAnswer = quiz[questionNumber].answer /* actual answer variable needs to be stored here. Because questionNumber += 1 will happen, and although the if statement is such that it will continue onto else-part of the statement, the issue arises when the player presses the button another time. The variable questionNumber has now been saved last as something outside the array index by +1, thus if initalized and kept within if-statment then the issue of index error of questionNumber is avoided.*/
            //another way of accomplishing the above:
//            let actualQuestion = quiz[questionNumber]
//            let actualAnswer = actualQuestion.answer
            
            // need to see if user answer matches response
            if userAnswer == actualAnswer {
                userScore += 1
                updateUI()
                sender.backgroundColor = UIColor.green
                //Code should execute after 0.2 second delay.
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                    //Bring's sender's opacity back up to fully opaque.
                    sender.backgroundColor = UIColor.clear
                }
            } else {
                sender.backgroundColor = UIColor.red
            }
            
            //needs to be the last thing to do as we need to record user answer to correct array question/answer pairing.
            questionNumber += 1
            updateUI()
        } else {
            questionLabel.text = "Yay! You've completed the quiz. \nYour Score is: \(userScore) of \(quiz.count).\nPress any button to restart the quiz."
            quiz.shuffle()
            progressBar.progress = 1.0
            progressBar.progressTintColor = UIColor.yellow
            questionNumber = 0
            userScore = 0
            
        }

    }
    
    func updateUI() {
        
        //progresBar needs to have float inputs because doing division on integers results in a float but rounding errors. For instance, int(5)/int(2) = 2.0 because the numbers are integers whne the calculation is done, the proper answer of 2.5 is not computed.
        let totalNumberOfQuestions = Float(quiz.count)
        let floatQuestionNumber = Float(questionNumber)
        let percentQuizComplete = floatQuestionNumber/totalNumberOfQuestions
        progressBar.progress = percentQuizComplete
        

        questionLabel.text = quiz[questionNumber].text
        
    }
    
    
    
    
}

