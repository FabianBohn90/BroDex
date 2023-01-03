//
//  Pokemon.swift
//  BroDex
//
//  Created by Fabian Bohn on 02.01.23.
//

import Foundation

struct Response: Decodable {
    let next: String
    let results: [Results]
}

struct Results: Decodable {
    let name: String
    let url: String
}
