//
//  ViewController.swift
//  Apple pie
//
//  Created by Sean Chien on 2019-08-23.
//  Copyright © 2019 Sean Chien. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {
    
    @IBOutlet var letterButtons: [UIButton]!
    
    @IBOutlet var scoreLabel: UILabel!
    @IBOutlet var correctWordLabel: UILabel!
    @IBOutlet var treeImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        newRound()
    }

    @IBAction func buttonTapped(_ sender: UIButton) {
        sender.isEnabled = false
        let letterString = sender.title(for: .normal)!
        let letter = Character(letterString.lowercased())
        currentGame.playGuessed(letter: letter)
        updateGameState()
    }
    
    func updateGameState () {
        if currentGame.incorrecMovesRemaining == 0 {
            totalLosses += 1
        } else if currentGame.word == currentGame.formatteWord{
            totalWins += 1
        } else {
            updateUI()
        }
    }
    
    var listOfWords = ["buccaneer", "swift", "glorious", "incandescent", "bug", "program"]
    
    let incorrecMovesAllowed = 7
    var totalWins = 0 {
        didSet {
            newRound()
        }
    }
    var totalLosses = 0 {
        didSet {
            newRound()
        }
    }
    
    struct Game {
        var word: String
        var incorrecMovesRemaining: Int
        var guessedLetters: [Character]
        
        mutating func playGuessed (letter: Character) {
            guessedLetters.append(letter)
            
            if !word.contains(letter) {
                incorrecMovesRemaining -= 1
            }
            
        }
        var formatteWord: String {
            var guessedWord = ""
            for letter in word {
                if guessedWord.contains(letter) {
                    guessedWord += "\(letter)"
                } else {
                    guessedWord += "_"
                }
            }
            return guessedWord
        }
    }
    
    var currentGame: Game!
    
    func newRound () {
        if !listOfWords.isEmpty {
            let newWord = listOfWords.removeFirst()
            currentGame = Game(word: newWord, incorrecMovesRemaining: incorrecMovesAllowed, guessedLetters: [])
            enableLetterButtons(true)
            updateUI()
        } else {
            enableLetterButtons(false)
        }
    }
    
    func updateUI() {
        var letters = [String]()
        for letter in currentGame.formatteWord {
            letters.append(String(letter))
            
        }
        
        let wordWithSpacing = letters.joined(separator: " ")
        correctWordLabel.text = currentGame.formatteWord
        scoreLabel.text = "Win: \(totalWins), Losses: \(totalLosses)"
        treeImageView.image = UIImage(named: "Tree\(currentGame.incorrecMovesRemaining)")
    }
    
    func enableLetterButtons (_ enable: Bool) {
        for button in letterButtons {
            button.isEnabled = enable
        }
    }
    
    
    
    
}

