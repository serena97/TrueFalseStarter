//
//  FactModel.swift
//  TrueFalseStarter
//
//  Created by Serena on 18/7/16.
//  Copyright © 2016 Treehouse. All rights reserved.
//

import Foundation


struct FactModel{
    
    let question1 = Question(question: "This was the only US President to serve more than two consecutive terms.", options: ["George Washington","Franklin D. Roosevelt","Woodrow Wilson","Andrew Jackson"], answerIndex: 2)
    
    let question2 = Question(question: "Which of the following countries has the most residents?", options: ["Nigeria", "Russia", "Iran", "Vietnam"], answerIndex: 1)
    
    let question3 = Question(question: "In what year was the United Nations founded?", options: ["1918","1919","1945","1954"], answerIndex: 3)
    
    let question4 = Question(question: "The Titanic departed from the United Kingdom, where was it supposed to arrive?", options: ["Paris","Washington D.C.","New York City","Boston"], answerIndex: 3)
    
    let question5 = Question(question: "Which nation produces the most oil?", options: ["Iran","Iraq","Brazil","Canada"], answerIndex: 4)
    
    let question6 = Question(question: "Which country has most recently won consecutive World Cups in Soccer?", options: ["Italy","Brazil","Argentina","Spain"], answerIndex: 2)
    
    let question7 = Question(question: "Which of the following rivers is longest?", options: ["Yangtze","Mississippi","Congo","Mekong"], answerIndex: 2)
    
    let question8 = Question(question: "Which city is the oldest?", options: ["Mexico City","Cape Town","San Juan","Sydney"], answerIndex: 1)
    
    let question9 = Question(question: "Which country was the first to allow women to vote in national elections?", options: ["Poland","United States","Sweden","Senegal"], answerIndex: 1)
    
    let question10 = Question(question: "Which of these countries won the most medals in the 2012 Summer Games?", options: ["France","Germany","Japan","Great Britian"], answerIndex: 4)
    
    
    var questions: [Question]
    
    var questionsPerRound: Int
    var indexOfSelectedQuestion: Int = 0
    var questionsAsked = 0
    var correctQuestions = 0
    
    init(){
    self.questions = [question1, question2, question3, question4, question5, question6, question7, question8, question9, question10]
    
    self.questionsPerRound = questions.count
        
    print("Hello")
    }
    
    
    
}

