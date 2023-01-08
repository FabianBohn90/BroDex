//
//  Pokemon.swift
//  BroDex
//
//  Created by Fabian Bohn on 03.01.23.
//

import Foundation

struct Pokemon: Decodable {
    let abilities: [abilities]
    let base_experience: Int?
    let height: Int
    let id: Int
    let location_area_encounters: String
    let moves: [moves]
    let name: String
    let sprites: pokeSprites
    let stats: [stats]
    let types: [types]
    let weight: Int
    
}

struct abilities: Decodable {
    let ability: ability
    let is_hidden: Bool
    let slot: Int
}

struct ability: Decodable {
    let name: String
    let url: String
}

struct moves: Decodable {
    let move: move
    let version_group_details: [version_group_details]
}

struct move: Decodable {
    let name: String
    let url: String
}

struct version_group_details: Decodable {
    let level_learned_at: Int
    let version_group: version_group
}

struct version_group: Decodable {
    let name: String
    let url: String
}

struct pokeSprites: Decodable {
    let other: other
}

struct other: Decodable {
    let propertyWithHyphen: propertyWithHyphen
    
    private enum CodingKeys: String, CodingKey {
            case propertyWithHyphen = "official-artwork"
        }
}

struct propertyWithHyphen: Decodable {
    let front_default : String
}

struct stats: Decodable {
    let base_stat : Int
    let effort : Int
    let stat : stat
}

struct stat: Decodable {
    let name : String
    let url : String
}

struct types: Decodable {
    let slot : Int
    let type : type
}

struct type: Decodable {
    let name : String
    let url : String
}




