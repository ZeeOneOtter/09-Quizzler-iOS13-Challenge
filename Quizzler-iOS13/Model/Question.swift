//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by Zee Thompson on 11/26/23.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import Foundation

struct Question {
    let text: String
    let answers: [String]
    let correctA: String
    
    init(q: String, a: [String], correctAnswer: String) {
        text = q
        answers = a
        correctA = correctAnswer
    }
}
