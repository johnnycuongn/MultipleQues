//
//  QuestionAnswer.swift
//  Multiple Choice Questions
//
//  Created by Johnny on 15/4/20.
//  Copyright © 2020 Johnny. All rights reserved.
//

import Foundation

//
//  QuestionAnswer.swift
//  MutipleQues
//
//  Created by Johnny on 17/9/18.
//  Copyright © 2018 Johnny Company. All rights reserved.
//

import Foundation
import GameKit

enum correctAnswer {
    case answer1
    case answer2
    case answer3
    case answer4
}


class QuestionAnswer {
    private var _question: String!
    private var _answer1: String!
    private var _answer2: String!
    private var _answer3: String!
    private var _answer4: String!
    private var _correctAnswer: correctAnswer!
    
    var question: String {
        return _question
    }
    
    var answer1: String {
        return _answer1
    }
    
    var answer2: String {
        return _answer2
    }
    
    var answer3: String {
        return _answer3
    }
    
    var answer4: String {
        return _answer4
    }
    
    var correctAnswer: correctAnswer {
        return _correctAnswer
    }
    
    init(question: String, answer1: String, answer2: String, answer3: String, answer4: String, correctAnswer: correctAnswer) {
        self._question = question
        self._answer1 = answer1
        self._answer2 = answer2
        self._answer3 = answer3
        self._answer4 = answer4
        self._correctAnswer = correctAnswer
    }
    
    func arrayOfAnswer() -> [String] {
        

            let array = [answer1,answer2,answer3,answer4]
            var shuffledArray: [String] = []
            var tempArray = array
            
            for _ in 0...array.count-1 {
                let numberChosen = random(tempArray.count)
                shuffledArray.append(tempArray[numberChosen])
                tempArray.remove(at: numberChosen)
            }
            
            return shuffledArray
    }
    
    func correctAnswerFrom(_ answer: correctAnswer) -> String {
        switch answer {
        case .answer1:
            return answer1
        case .answer2:
            return answer2
        case .answer3:
            return answer3
        case .answer4:
            return answer4
        }
    }
    

    
    
}

func random(_ n:Int) -> Int
{
    return Int(arc4random_uniform(UInt32(n)))
}





