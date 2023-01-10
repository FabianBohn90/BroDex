//
//  Abilities.swift
//  BroDex
//
//  Created by Fabian Bohn on 10.01.23.
//

import Foundation

struct Abilities : Decodable {
    let effect_changes: [effect_changes]
    let effect_entries: [effect_entries]
    let id : Int
    let name: String
    let names : [names]
    
}

struct effect_changes : Decodable {
    let effect_entries : [effect_entries]
}

