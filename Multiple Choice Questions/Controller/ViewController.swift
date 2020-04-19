//
//  ViewController.swift
//  Multiple Choice Questions
//
//  Created by Johnny on 15/4/20.
//  Copyright © 2020 Johnny. All rights reserved.
//

import UIKit
import GameKit

class ViewController: UIViewController {
    // MARK: IBOUTLET
    @IBOutlet weak var questionsLabel: UILabel!
    @IBOutlet var choicesLabel: [UIButton]!
    @IBOutlet weak var againButton: UIButton!
    
    @IBOutlet weak var correctLabelNumber: UILabel!
    var correctCount: Int = 0
    let trueColor: UIColor = #colorLiteral(red: 0, green: 0.975577414, blue: 0, alpha: 1)
    
    @IBOutlet weak var falseLabelNumber: UILabel!
    var falseCount: Int = 0
    let falseColor: UIColor = #colorLiteral(red: 0.9265916348, green: 0.2341234982, blue: 0.102768369, alpha: 1)
    
    @IBOutlet weak var answer1: UIButton!
    @IBOutlet weak var answer2: UIButton!
    @IBOutlet weak var answer3: UIButton!
    @IBOutlet weak var answer4: UIButton!
    

    // MARK: VARIABLES AND DATA
    var presentQuestion: QuestionAnswer!
    var presentAnswers: [String]!
 
    var questionAnswer: [QuestionAnswer] = []

    func createArray() -> [QuestionAnswer] {
        
        var tempArray: [QuestionAnswer] = []
        
        let number1 = QuestionAnswer(question: "How old are you", answer1: "I'm fine, thank you.", answer2: "Hi", answer3: "Nice to meet you", answer4: "I'm 16", correctAnswer: .answer4)
        let number2 = QuestionAnswer(question: "Wassup bro", answer1: "Wassuppp", answer2: "Today is my birthday", answer3: "I'm 18 already", answer4: "I'm suck at this game", correctAnswer: .answer1)
        let number3 = QuestionAnswer(question: "1+1=", answer1: "3", answer2: "1", answer3: "2", answer4: "4", correctAnswer: .answer3)
        
        tempArray.append(number1)
        tempArray.append(number2)
        tempArray.append(number3)
        
        return tempArray
    }


  
    
    // MARK: DISPLAY QUESTION AND FOLLOWING ANSWER
  
    // MARK: SYSTEM
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        questionAnswer = createArray()
        displayQuestionAnswer(questionAnswer[random(questionAnswer.count)])
        
    }

    // MARK: FUNCTIONS
    //To Display Question and Following Answers
    func displayQuestionAnswer(_ questionAnswer: QuestionAnswer) {
        presentQuestion = questionAnswer
        presentAnswers = presentQuestion.arrayOfAnswer()
        questionsLabel.text = questionAnswer.question
        answer1.setTitle(presentAnswers[0], for: .normal)
        answer2.setTitle(presentAnswers[1], for: .normal)
        answer3.setTitle(presentAnswers[2], for: .normal)
        answer4.setTitle(presentAnswers[3], for: .normal)
    }
    
   // To return the UIButton so that we could change the button color or disable it
    func answerAt(_ number: Int) -> UIButton {
        switch number {
        case 0:
            return answer1
        case 1:
            return answer2
        case 2:
            return answer3
        default:
            return answer4
        }
    }

    //Set Button Back To Normal Or Set Button All Disabled
    func setButton(backToNormal: Bool) {
        if backToNormal {
            answer1.backgroundColor = #colorLiteral(red: 0.3068953156, green: 0.3068953156, blue: 0.3068953156, alpha: 1)
            answer2.backgroundColor = #colorLiteral(red: 0.3068953156, green: 0.3068953156, blue: 0.3068953156, alpha: 1)
            answer3.backgroundColor = #colorLiteral(red: 0.3068953156, green: 0.3068953156, blue: 0.3068953156, alpha: 1)
            answer4.backgroundColor = #colorLiteral(red: 0.3068953156, green: 0.3068953156, blue: 0.3068953156, alpha: 1)
            for indexOfNAnswer in 0...3 {
                answerAt(indexOfNAnswer).isEnabled = true
            }
            againButton.isHidden = true
        } else {
            for indexOfAnswer in 0...3 {
                
                answerAt(indexOfAnswer).isEnabled = false
                
            }
        }
    }

    // MARK: ANSWERS PRESSED
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        if let positionOfAnswer = choicesLabel.index(of: sender) {
            let answerPressed = presentAnswers[positionOfAnswer]
            let correctAnswer = presentQuestion.correctAnswerFrom(presentQuestion.correctAnswer)
            if answerPressed == correctAnswer {
                //SET COLOR OF THE RIGHT ANSWER
                    sender.backgroundColor = trueColor
                //ADDING TO CORRECT BOARD
                    correctCount += 1
                    correctLabelNumber.text = String(correctCount)
                // MAKE ALL THE BUTTONS DISABLE
                    setButton(backToNormal: false)
            } else {
                //SET COLOR OF THE WRONG ANSWER
                    sender.backgroundColor = falseColor
                //ADDING TO WRONG BOARD
                    falseCount += 1
                    falseLabelNumber.text = String(falseCount)
                //MAKE ALL THE BUTTON DISABLED
                    setButton(backToNormal: false)
                //WHEN USERS PRESS WRONG ANSWER, THEY CAN RESET AND DO AGAIN
                    againButton.isHidden = false
        }
}
}
    // MARK: OTHER BUTTONS PRESSED

    
    @IBAction func againButtonPressed(_ sender: Any) {
        setButton(backToNormal: true)
    }
    @IBAction func nextButtonPressed() {
        
         setButton(backToNormal: true)

        displayQuestionAnswer(questionAnswer[random(questionAnswer.count)])
        
    }
}
