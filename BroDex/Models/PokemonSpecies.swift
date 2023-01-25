//
//  PokemonSpecies.swift
//  BroDex
//
//  Created by Fabian Bohn on 25.01.23.
//

import Foundation


struct PokemonSpecies: Decodable {
    let evolution_chain : evolution_chain
    let is_baby: Bool
    let is_legendary: Bool
    let is_mythical: Bool
    let verieties: [verieties]?
}

struct evolution_chain: Decodable {
    let url : String?
}

struct verieties: Decodable {
    let pokemon: pokemon
}

struct pokemon: Decodable {
    let name : String?
    let url : String?
}
