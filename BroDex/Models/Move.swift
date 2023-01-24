//
//  Move.swift
//  BroDex
//
//  Created by Fabian Bohn on 24.01.23.
//

import Foundation

struct Move : Decodable {
    let accuracy: Int?
    let damage_class: damage_class
    let effect_chance: Int?
    let effect_changes: [effect_changes]?
    let effect_entries: [effect_entries]?
    let flavor_text_entries: [flavor_text_entries]?
    let machines: [machines]
    let name: String
    let names: [names]
    let power: Int?
    let pp: Int?
    let priority: Int?
    let stat_changes: [stat_changes]?
    let target: target
    let type: type
}

struct damage_class: Decodable {
    let name: String
    let url: String
}

struct machines: Decodable {
    let machine: machine
    let version_group: version_group
}

struct machine: Decodable {
    let url: String
}

struct stat_changes: Decodable {
    let name: String?
    let url: String?
}

struct target: Decodable {
    let name: String
    let url: String
}

