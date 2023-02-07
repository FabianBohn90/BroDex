//
//  PokemonSpecies.swift
//  BroDex
//
//  Created by Fabian Bohn on 25.01.23.
//

import Foundation


struct PokemonSpecies: Decodable {
    let base_happiness: Int
    let capture_rate: Int
    let egg_groups: [egg_groups]
    let evolution_chain: evolution_chain
    let flavor_text_entries: [flavor_text_entries]
    let grow_rate: grow_rate?
    let is_baby: Bool
    let is_legendary: Bool
    let is_mythical: Bool
    let verieties: [verieties]?
}

struct egg_groups: Decodable {
    let name : String?
    let url : String?
}

struct grow_rate: Decodable {
    let name : String?
    let url : String?
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
