//
//  APICoctailManager.swift
//  CocktailApp
//
//  Created by mac on 03/11/2021.
//

import Foundation

final class APICoctailManager {
    
    func fetch(url: String,  completion: @escaping (Result<CurrentCoctail, Error>) -> ()) {
         guard let url = URL(string: url) else { return }
        let decoder = JSONDecoder()
         URLSession.shared.dataTask(with: url) { (data, responce, error) in
             DispatchQueue.main.async {
                 if let error = error {
                     completion(.failure(error))
                     return
                 }
                 guard let data = data else { return }
                 do {
                     let result = try decoder.decode(CurrentCoctail.self, from: data)
                     completion(.success(result))
                     
                 } catch let jsonError {
                     completion(.failure(jsonError))
                 }
             }
         }.resume()
     }
 
    
}
