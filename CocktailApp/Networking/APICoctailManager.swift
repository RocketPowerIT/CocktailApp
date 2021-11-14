//
//  APICoctailManager.swift
//  CocktailApp
//
//  Created by mac on 03/11/2021.
//

import Foundation
import UIKit
final class APICoctailManager {
    
    func fetch(url: String,  completion: @escaping (Result<AllCoctail, Error>) -> ()) {
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
                     let result = try decoder.decode(AllCoctail.self, from: data)
                     completion(.success(result))
                     
                 } catch let jsonError {
                     completion(.failure(jsonError))
                 }
             }
         }.resume()
     }
    
    func downloadImage(from baseImageURL: String, completion: @escaping (Result<UIImage, Error>) -> ()) {
        print("Download Started")
        let url = URL(string: baseImageURL)
        URLSession.shared.dataTask(with: url!) { (data, responce, error) in
            
            DispatchQueue.main.async() { [] in
                if let error = error {
                    completion(.failure(error))
                    return
                }
                
                guard let data = data else { return }
                do {
                    guard let image = UIImage(data: data) else { return }
                    completion(.success(image))
                }
            }
        }.resume()
    }
}
