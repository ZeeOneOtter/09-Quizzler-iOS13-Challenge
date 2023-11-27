//
//  QuizBrain.swift
//  Quizzler-iOS13
//
//  Created by Zee Thompson on 11/27/23.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import Foundation

struct QuizBrain {
    var quiz = [
        Question(q: "Which is the largest organ in the human body?", a: ["Heart", "Skin", "Large Intestine"], correctAnswer: "Skin"),
        Question(q: "Five dollars is worth how many nickels?", a: ["25", "50", "100"], correctAnswer: "100"),
        Question(q: "What do the letters in the GMT time zone stand for?", a: ["Global Meridian Time", "Greenwich Mean Time", "General Median Time"], correctAnswer: "Greenwich Mean Time"),
        Question(q: "What is the French word for 'hat'?", a: ["Chapeau", "Écharpe", "Bonnet"], correctAnswer: "Chapeau"),
        Question(q: "In past times, what would a gentleman keep in his fob pocket?", a: ["Notebook", "Handkerchief", "Watch"], correctAnswer: "Watch"),
        Question(q: "How would one say goodbye in Spanish?", a: ["Au Revoir", "Adiós", "Salir"], correctAnswer: "Adiós"),
        Question(q: "Which of these colours is NOT featured in the logo for Google?", a: ["Green", "Orange", "Blue"], correctAnswer: "Orange"),
        Question(q: "What alcoholic drink is made from molasses?", a: ["Rum", "Whisky", "Gin"], correctAnswer: "Rum"),
        Question(q: "What type of animal was Harambe?", a: ["Panda", "Gorilla", "Crocodile"], correctAnswer: "Gorilla"),
        Question(q: "Where is Tasmania located?", a: ["Indonesia", "Australia", "Scotland"], correctAnswer: "Australia")
    ]
    
    var questionNumber = 0
    var userScore : Int = 0
    var answerNumber : Int = 0
    
    mutating func checkAnswer(userAnswer : String) -> Bool {
        if userAnswer == quiz[questionNumber].correctA {
            userScore += 1
            return true
        } else {
            return false
        }
    }
    func getQuestionText() -> String {
        return quiz[questionNumber].text
    }
    
    func getAnswersText() -> [String] {
        return quiz[questionNumber].answers
    }
    
    func getProgress() -> Float {
        print("progress")
        //progresBar needs to have float inputs because doing division on integers results in a float but rounding errors. For instance, int(5)/int(2) = 2.0 because the numbers are integers whne the calculation is done, the proper answer of 2.5 is not computed.
        let totalNumberOfQuestions = Float(quiz.count)
        let floatQuestionNumber = Float(questionNumber)
        let percentQuizComplete = floatQuestionNumber/totalNumberOfQuestions
        
        return percentQuizComplete
    }
    
    mutating func nextQuestion() {
        if questionNumber + 1 < quiz.count {
            questionNumber += 1
        } else {
            questionNumber = 0
            quiz.shuffle()
        }
    }
    
    func getScore() -> Int {
        return userScore
    }
    
}
