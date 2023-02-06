//
//  Types.swift
//  BroDex
//
//  Created by Fabian Bohn on 06.02.23.
//

import Foundation

struct Types : Decodable {
    let damage_relations: damage_relations
   
}

struct damage_relations : Decodable {
    let double_damage_from: [double_damage_from]?
    let double_damage_to: [double_damage_to]?
    let half_damage_from: [half_damage_from]?
    let half_damage_to: [half_damage_to]?
    let no_damage_from: [no_damage_from]?
    let no_damage_to: [no_damage_to]?
}

struct double_damage_from : Decodable {
    let name: String
    let url: String
}

struct double_damage_to : Decodable {
    let name: String
    let url: String
}

struct half_damage_from : Decodable {
    let name: String
    let url: String
}

struct half_damage_to : Decodable {
    let name: String
    let url: String
}

struct no_damage_from : Decodable {
    let name: String
    let url: String
}

struct no_damage_to : Decodable {
    let name: String
    let url: String
}
