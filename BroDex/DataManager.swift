//
//  DataManager.swift
//  BroDex
//
//  Created by Fabian Bohn on 24.01.23.
//

import Foundation

class DataManager {
    static let shared = DataManager()
    private init() {}
    
    var pokeData: Pokemon?
    var pokemon: Results?
    
}
