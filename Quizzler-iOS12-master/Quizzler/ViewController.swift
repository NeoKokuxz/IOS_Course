//
//  ViewController.swift
//  Quizzler
//
//  Created by Angela Yu on 25/08/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //Place your instance variables here
    var questionNum : Int = 0
    var answerTorF : Bool = true
    var score : Int = 0
    let questionList = questionBank()
    var highestScore = 0;
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    @IBOutlet weak var highScore: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nextQuestion()
        scoreLabel.text = "Score: 0"
    }

    @IBAction func answerPressed(_ sender: AnyObject) {
        if sender.tag == 1{
            //true
            answerTorF = true
        }else if sender.tag == 2{
            //false
            answerTorF = false
        }
        checkAnswer()
    }
    
    func updateUI() {
        scoreLabel.text = "Score: " + String(score)
        questionNum += 1
        nextQuestion()
    // set the question text to the next one in the array
       // questionLabel.text =
        }
    
    func nextQuestion() {
        if(questionNum <= 12){
            progressLabel.text = "\(questionNum + 1) / 13"
            progressBar.frame.size.width = (view.frame.size.width/13) * CGFloat(questionNum+1)
            questionLabel.text = questionList.list[questionNum].questionText
        }
        else{
            let alert = UIAlertController(title: "Awesome", message: "You've finished all the questions,\nYour Score is \(score) \nHighest Score is \(highestScore)", preferredStyle: .alert)
            
            let restartAction = UIAlertAction(title: "Restart", style: .default, handler: { UIAlertAction in
                self.startOver()
            })
            
            alert.addAction(restartAction)
            
            present(alert, animated: true, completion: nil)
        }
        highScore.text = "Highest Score: " + String(highestScore)

    }
    
    func checkAnswer() {
            //Check for the answer if true or false
            //true
            if(answerTorF == questionList.list[questionNum].answer)
            {
                score += 1
                
                //correct UI
                ProgressHUD.showSuccess("Great! \nYou got it right!")
                if(score >= highestScore)
                {
                    highestScore = score
                    print("score \(score)")
                    print("highestScore \(highestScore)")
                }
                updateUI()

            }
            else{
                //false UI
                ProgressHUD.showError("Hmmmm! \n That's not right!")
                updateUI()
            }
    }
    
    func startOver() {
        questionNum = 0
        score = 0
        nextQuestion()
        scoreLabel.text = "Score: " + String(score)
    }
}
