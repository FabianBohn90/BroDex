//
//  FetchData.swift
//  BroDex
//
//  Created by Fabian Bohn on 02.01.23.
//

import Foundation


func fetchData(URL Url:String, completion: @escaping (Result<Response, Error>) -> Void) {
    
        let url = URL(string: Url)
        let session = URLSession.shared
        
        let dataTask = session.dataTask(with: url!) { data, response, error in
            do {
                let fetchingData = try JSONDecoder().decode (Response.self, from: data!)
                completion(.success(fetchingData))
            }catch {
                print("ERROR: \(error)")
            }
            
        }
        dataTask.resume ()
}
      

func fetchPokemon( URL Url:String, completion: @escaping (Pokemon) -> Void) {
   
        let url = URL(string: Url)
        let session = URLSession.shared
        let dataTask = session.dataTask(with: url!) { data, response, error in
            do {
                let fetchingData = try JSONDecoder().decode (Pokemon.self, from: data!)
                completion(fetchingData)
            }catch {
                print("ERROR: \(error)")
            }
        }
        dataTask.resume ()
}

func fetchItem( URL Url:String, completion: @escaping (Item) -> Void) {
   
        let url = URL(string: Url)
        let session = URLSession.shared
        let dataTask = session.dataTask(with: url!) { data, response, error in
            do {
                let fetchingData = try JSONDecoder().decode (Item.self, from: data!)
                completion(fetchingData)
            }catch {
                print("ERROR: \(error)")
            }
        }
        dataTask.resume ()
}

func fetchAbilities( URL Url:String, completion: @escaping (Abilities) -> Void) {
   
        let url = URL(string: Url)
        let session = URLSession.shared
        let dataTask = session.dataTask(with: url!) { data, response, error in
            do {
                let fetchingData = try JSONDecoder().decode (Abilities.self, from: data!)
                completion(fetchingData)
            }catch {
                print("ERROR: \(error)")
            }
        }
        dataTask.resume ()
}

func fetchMove( URL Url:String, completion: @escaping (Move) -> Void) {
   
        let url = URL(string: Url)
        let session = URLSession.shared
        let dataTask = session.dataTask(with: url!) { data, response, error in
            do {
                let fetchingData = try JSONDecoder().decode (Move.self, from: data!)
                completion(fetchingData)
            }catch {
                print("ERROR: \(error)")
            }
        }
        dataTask.resume ()
}
