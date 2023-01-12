//
//  SearchData.swift
//  BroDex
//
//  Created by Fabian Bohn on 11.01.23.
//

import Foundation

func searchPokemon(searchTerm: String, completion: @escaping (Result<[Results], Error>) -> Void) {
    let endpoint = "https://pokeapi.co/api/v2/pokemon?limit=800&offset=0&search=\(searchTerm.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "")"
    guard let url = URL(string: endpoint) else {
        completion(.failure(Error.self as! Error))
        return
    }
    URLSession.shared.dataTask(with: url) { data, response, error in
        if let error = error {
            completion(.failure(error))
            return
        }
        guard let data = data else {
            completion(.failure(Error.self as! Error))
            return
        }
        do {
            let searchResults = try JSONDecoder().decode(Response.self, from: data)
            completion(.success(searchResults.results))
        } catch {
            completion(.failure(error))
        }
    }.resume()
}
