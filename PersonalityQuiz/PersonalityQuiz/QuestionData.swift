//
//  QuestionData.swift
//  PersonalityQuiz
//
//  Created by Sean Chien on 2019-09-02.
//  Copyright © 2019 Sean Chien. All rights reserved.
//

import Foundation

struct Question {
    var text: String
    var type: ResponseType
    var answers: [Answer]
}

enum ResponseType {
    case single, multiple, ranged
}

struct Answer {
    var text: String
    var type: AnimalType
}

enum AnimalType: Character {
    case dog = "🐶", cat = "🐱", rabbit = "🐰", turle = "🐢"

    var defintion: String {
        switch self {
        case .dog:
            return "You are incredibly outgoing. You surround yourself with the people you love and enjoy activites with your friends."
        case .cat:
            return "Mischievious, yet mil-tempered, you enjoy doing things on your own teams."
        case .rabbit:
            return "You love everying that's soft. You are healthy and full of energy."
        case .turle:
            return "You are wise beyond your years, and you focus on the details. slow and steady wins and race."
        }
    }
}

