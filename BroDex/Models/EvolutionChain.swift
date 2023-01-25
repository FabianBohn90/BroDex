//
//  EvolutionChain.swift
//  BroDex
//
//  Created by Fabian Bohn on 25.01.23.
//

import Foundation


struct EvolutionChain : Decodable {
    let baby_trigger_item: baby_trigger_item?
    let chain: chain
}

struct chain : Decodable {
    let species: species
    let evolves_to: [evolves_to]?
}

struct baby_trigger_item : Decodable {
    let name: String?
    let url: String?
    
}

struct evolves_to : Decodable {
    let evolution_details: [evolution_details]
    let evolves_to: [evolves_to]?
    let species: species
}

struct evolution_details : Decodable {
    let min_level: Int?
    let trigger: trigger?
    
}

struct trigger : Decodable {
    let name: String?
    let url: String?
    
}


