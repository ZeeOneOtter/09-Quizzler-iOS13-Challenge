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
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var choice1Button: UIButton!
    @IBOutlet weak var choice2Button: UIButton!
    @IBOutlet weak var choice3Button: UIButton!
    
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        quizBrain.quiz.shuffle()
    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        //need to change the color back in case the user continues past the first round
//        progressBar.progressTintColor = UIColor(red: 255, green: 117, blue: 168, alpha: 1.0)
        
        //keep track of question Label, and total questions asked
//        updateUI()
        
        let userAnswer = sender.currentTitle!
        let userGotItRight = quizBrain.checkAnswer(userAnswer: userAnswer)
        
        if userGotItRight {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
        
        // quizBrain.checkAnswer(userAnswer: userAnswer)
        // let actualAnswer = quiz[questionNumber].answer /* actual answer variable needs to be stored here. Because questionNumber += 1 will happen, and although the if statement is such that it will continue onto else-part of the statement, the issue arises when the player presses the button another time. The variable questionNumber has now been saved last as something outside the array index by +1, thus if initalized and kept within if-statment then the issue of index error of questionNumber is avoided.*/
        //another way of accomplishing the above:
//            let actualQuestion = quiz[questionNumber]
//            let actualAnswer = actualQuestion.answer
        // need to see if user answer matches response

        quizBrain.nextQuestion()

    }
    
    @objc func updateUI() {
        
        choice2Button.backgroundColor = UIColor.clear
        choice3Button.backgroundColor = UIColor.clear
        progressBar.progress = quizBrain.getProgress()
        scoreLabel.text = "Score: \(quizBrain.getScore())."
        questionLabel.text = quizBrain.getQuestionText()
        
        let answerChoices = quizBrain.getAnswersText()
        choice1Button.setTitle(answerChoices[0], for: .normal)
        choice2Button.setTitle(answerChoices[1], for: .normal)
        choice3Button.setTitle(answerChoices[2], for: .normal)
        
    }
    
    
    
    
}

