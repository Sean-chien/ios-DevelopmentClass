//
//  QuestionViewController.swift
//  PersonalityQuiz
//
//  Created by Sean Chien on 2019-09-02.
//  Copyright © 2019 Sean Chien. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {
    @IBOutlet var questionLabel: UILabel!
    @IBOutlet var singleStackView: UIStackView!
    
    @IBOutlet var singleButton1: UIButton!
    @IBOutlet var singleButton2: UIButton!
    @IBOutlet var singleButton3: UIButton!
    @IBOutlet var singleButton4: UIButton!
    @IBOutlet var multipleStackView: UIStackView!
    
    @IBOutlet var multiLabel1: UILabel!
    @IBOutlet var multiLabel2: UILabel!
    @IBOutlet var multiLabel3: UILabel!
    @IBOutlet var multiLabel4: UILabel!
    @IBOutlet var multiSwitch1: UISwitch!
    @IBOutlet var multiSwitch2: UISwitch!
    @IBOutlet var multiSwitch3: UISwitch!
    @IBOutlet var multiSwitch4: UISwitch!
    
    @IBOutlet var rangedStackView: UIStackView!
    
    @IBOutlet var rangedSlider: UISlider!
    @IBOutlet var rangedLabel1: UILabel!
    @IBOutlet var rangedLabel2: UILabel!
    @IBOutlet var questionProgressView: UIProgressView!
    var questionIndex = 0
    var answersChosen: [Answer] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    @IBAction func singleAnswerButtonPressed(_ sender: UIButton) {
        let currentAnswers = question[questionIndex].answers
        
        switch sender {
        case singleButton1:
            answersChosen.append(currentAnswers[0])
        case singleButton2:
            answersChosen.append(currentAnswers[1])
        case singleButton3:
            answersChosen.append(currentAnswers[2])
        case singleButton4:
            answersChosen.append(currentAnswers[3])
        default:
            break
        }
        nextQuestion()
    }
    @IBAction func multipleAnswerButtonPressed(_ sender: UISwitch) {
        let currentAnswers = question[questionIndex].answers
        if multiSwitch1.isOn {
            answersChosen.append(currentAnswers[0])
        }
        if multiSwitch2.isOn {
            answersChosen.append(currentAnswers[1])
        }
        if multiSwitch3.isOn {
            answersChosen.append(currentAnswers[2])
        }
        if multiSwitch4.isOn {
            answersChosen.append(currentAnswers[3])
        }
        nextQuestion()
    }
    @IBAction func rangedAnswerButtonPressed(_ sender: UISlider) {
        let currentAnswers = question[questionIndex].answers
        let index = Int(round(rangedSlider.value * Float(currentAnswers.count - 1)))
        answersChosen.append(currentAnswers[index])
        
        nextQuestion()
    }

    func updateUI () {
        singleStackView.isHidden = true
        multipleStackView.isHidden = true
        rangedStackView.isHidden = true
        let currentQuestion = question[questionIndex]
        let currentAnswers = currentQuestion.answers
        let totalProgress = Float(questionIndex) / Float(question.count)
        
        navigationItem.title = "Question #\(questionIndex+1)"
        questionLabel.text = currentQuestion.text
        questionProgressView.setProgress(totalProgress, animated: true)
        switch currentQuestion.type {
        case .single:
            updateSingleStack(using: currentAnswers)
        case .multiple:
            updateMultipleStack(using: currentAnswers)
        case .ranged:
            updaterangedStack(using: currentAnswers)
        }
    }
    
    func updateSingleStack(using answers: [Answer]) {
        singleStackView.isHidden = false
        singleButton1.setTitle(answers[0].text, for: .normal)
        singleButton2.setTitle(answers[1].text, for: .normal)
        singleButton3.setTitle(answers[2].text, for: .normal)
        singleButton4.setTitle(answers[3].text, for: .normal)
    }
    
    func updateMultipleStack(using answers: [Answer]) {
        multipleStackView.isHidden = false
        multiSwitch1.isOn = false
        multiSwitch2.isOn = false
        multiSwitch3.isOn = false
        multiSwitch4.isOn = false
        multiLabel1.text = answers[0].text
        multiLabel2.text = answers[1].text
        multiLabel3.text = answers[2].text
        multiLabel4.text = answers[3].text
    }
    
    func updaterangedStack(using answers: [Answer]) {
        rangedStackView.isHidden = false
        rangedSlider.setValue(0.5, animated: false)
        rangedLabel1.text = answers.first?.text
        rangedLabel2.text = answers.last?.text
    }
    
    func nextQuestion() {
        questionIndex += 1
        
        if questionIndex < question.count {
            updateUI()
        } else {
            performSegue(withIdentifier: "ResultsSegue", sender: nil)
        }
    }
    var question: [Question] = [Question(text: "Which food do you like the most?", type: .single, answers: [Answer(text: "Steak", type: .dog),
                           Answer(text: "Fish", type: .cat),
                           Answer(text: "Carrots", type: .rabbit),
                           Answer(text: "Corn", type: .turle)]),
                               Question(text: "Which activities do you enjoy?", type: .multiple,
                 answers: [Answer(text: "Swimming", type: .turle),
                           Answer(text: "Sleeping", type: .cat),
                           Answer(text: "Cuddling", type: .rabbit),
                           Answer(text: "Eating", type: .dog)]),
                               Question(text: "How much do you enjoy car rides?", type: .ranged,
                 answers: [Answer(text: "I dislike them", type: .cat),
                           Answer(text: "I get a little nervous", type: .rabbit),
                           Answer(text: "I barely notice them", type: .turle),
                           Answer(text: "I love them", type: .dog)])]
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ResultsSegue" {
            let resultsViewController = segue.destination as! ResultaViewController
            resultsViewController.responses = answersChosen
        }
    }
    

}

