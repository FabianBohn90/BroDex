//
//  Items.swift
//  BroDex
//
//  Created by Fabian Bohn on 08.01.23.
//

import Foundation

struct Item : Decodable {
    let attributes: [attributes]
    let category: category
    let cost: Int
    let effect_entries: [effect_entries]
    let flavor_text_entries: [flavor_text_entries]
    let fling_effect: fling_effect?
    let fling_power: Int?
    let id : Int
    let name: String
    let names : [names]
    let sprites: itemSprites
    
}

struct attributes: Decodable {
    let name: String
    let url: String
}

struct category: Decodable {
    let name: String
    let url: String
}

struct effect_entries: Decodable {
    let effect: String
}

struct flavor_text_entries: Decodable {
    let flavor_text: String?
    let language: language?
    let text: String?
    
}

struct fling_effect: Decodable {
    let name: String
    let url: String
    
}

struct names: Decodable {
    let language: language
    let name: String
    
}

struct language: Decodable {
    let name: String
    let url: String
    
}

struct itemSprites: Decodable {
    let `default`: String?
    
}
