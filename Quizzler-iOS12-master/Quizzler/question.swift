//
//  question.swift
//  Quizzler
//
//  Created by Naoki on 8/29/19.
//  Copyright © 2019 London App Brewery. All rights reserved.
//
import UIKit
import Foundation

class Question {

    let answer : Bool
    let questionText : String
    
    init(text : String, correctAnswer : Bool) {
        questionText = text
        answer = correctAnswer
    }
}
