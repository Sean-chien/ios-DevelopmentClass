//
//  Athlete.swift
//  FavoriteAthlete
//
//  Created by Sean Chien on 2019-08-27.
//

import Foundation

struct Athlete {
    var name: String
    var age: String
    var league: String
    var team: String
    
    var description: String {
        return "\(name) is \(age) years old and plays for the \(team) in the \(league)."
    }
}
