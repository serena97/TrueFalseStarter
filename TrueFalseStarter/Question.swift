//
//  Question.swift
//  TrueFalseStarter
//
//  Created by Serena on 19/7/16.
//  Copyright © 2016 Treehouse. All rights reserved.
//

import Foundation

struct Question {
    let question : String
    let options : [String]
    let answerIndex : Int
    
    init(question: String, options: [String], answerIndex: Int){
        self.question = question
        self.options = options
        self.answerIndex = answerIndex - 1
    }
    
    func isCorrect(answer: String) -> Bool {
        return answer == self.options[answerIndex]
    }
}