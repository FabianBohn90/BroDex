//
//  Pokemon.swift
//  BroDex
//
//  Created by Fabian Bohn on 03.01.23.
//

import Foundation

struct Pokemon: Decodable {
    let other: Other
}

struct Other: Decodable {
    let propertyWithHyphen: Img
    
    private enum CodingKeys: String, CodingKey {
            case propertyWithHyphen = "official-artwork"
        }
}

struct Img: Decodable {
    let front_default: String
    
}


