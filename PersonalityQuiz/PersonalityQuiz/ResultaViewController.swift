//
//  ResultaViewController.swift
//  PersonalityQuiz
//
//  Created by Sean Chien on 2019-09-02.
//  Copyright © 2019 Sean Chien. All rights reserved.
//

import UIKit

class ResultaViewController: UIViewController {

    @IBOutlet var resultAnswerLabel: UILabel!
    @IBOutlet var resultDefinitionLabel: UILabel!
    var responses: [Answer]!
    override func viewDidLoad() {
        super.viewDidLoad()
        calculatePersonalityResult()

    }
    
    func calculatePersonalityResult() {
        let responseTypes = responses.map { $0.type}
        var frequencyOfAnswers: [AnimalType: Int] = [:]
        
        for response in responseTypes {
            let newCount: Int
            
            if let oldCount = frequencyOfAnswers[response] {
                newCount = oldCount + 1
            } else {
                newCount = 1
            }
            frequencyOfAnswers[response] = newCount
        }
        
        let mostCommonAnswer = frequencyOfAnswers.sorted{$0.1 > $1.1}.first!.key
        
        resultAnswerLabel.text = "You are a \(mostCommonAnswer.rawValue)!"
        resultDefinitionLabel.text = mostCommonAnswer.defintion

    }
    
}
