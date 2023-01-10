//
//  FetchData.swift
//  BroDex
//
//  Created by Fabian Bohn on 02.01.23.
//

import Foundation


var isPaginating = false

func fetchData(paginating:Bool = false, URL Url:String, completion: @escaping (Result<Response, Error>) -> Void) {
    if paginating{
        isPaginating = true
    }
    DispatchQueue.global().asyncAfter(deadline: .now() + (paginating ? 0.05: 1.0), execute: {
        
        let url = URL(string: Url)
        let session = URLSession.shared
        
        let dataTask = session.dataTask(with: url!) { data, response, error in
            do {
                let fetchingData = try JSONDecoder().decode (Response.self, from: data!)
                completion(.success(fetchingData))
                if paginating {
                    isPaginating = false
                }
                
            }catch {
                print("ERROR: \(error)")
            }
            
        }
        dataTask.resume ()
    })
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
