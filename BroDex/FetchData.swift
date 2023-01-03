//
//  FetchData.swift
//  BroDex
//
//  Created by Fabian Bohn on 02.01.23.
//

import Foundation

func fetchingAPIImages(URL Url:String, completion: @escaping (Response) -> Void) {
    let url = URL(string: Url)
    let session = URLSession.shared
    
    let dataTask = session.dataTask(with: url!) { data, response, error in
        do {
            let fetchingData = try JSONDecoder().decode (Response.self, from: data!)
            completion(fetchingData)
        }catch {
            print("Parsing Error")
        }
    }
    dataTask.resume ()
}
