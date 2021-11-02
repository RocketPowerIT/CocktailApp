//
//  NetworkService.swift
//  CocktailApp
//
//  Created by mac on 02/11/2021.
//

import Foundation

typealias JSONCompletionHandler = ([String: AnyObject]?, HTTPURLResponse?, Error?) -> Void
typealias JSONTask = URLSessionTask

enum APIResult<T> {
    case Success(T)
    case Failure(Error)
}

protocol JSONDecodable {
    init?(JSON: [String: AnyObject])
}

protocol NetworkService {
    
    var sessionConfiguration: URLSessionConfiguration { get }
    var session: URLSession { get }
    
    func JSONTaskWith( request: URLRequest,
                       completionHandler: @escaping JSONCompletionHandler) -> JSONTask
    func fetch<T: JSONDecodable>(request: URLRequest,
                                 parse: @escaping ([String: AnyObject]?) -> T?,
                                 completionHandler: @escaping (APIResult<T>)-> Void )
}

extension NetworkService {
    
    func JSONTaskWith( request: URLRequest, completionHandler: @escaping JSONCompletionHandler) -> JSONTask {
        
        let dataTask = session.dataTask(with: request) { (data, responce, error) in
            
            guard let HTTPResponce  = responce as? HTTPURLResponse else {
                let userInfo = [ NSLocalizedDescriptionKey: NSLocalizedString("Missing HTTP Response", comment: "")]
                let error = NSError(domain: WTNetworkingErrorDomain, code: MissingHTTPResponceError, userInfo: userInfo)
                completionHandler(nil, nil, error)
                return
            }
            if data == nil{
                if let error = error {
                    completionHandler(nil, HTTPResponce, error)
                }
            }else {
                switch HTTPResponce.statusCode {
                case 200:
                    do {
                        let json = try JSONSerialization.jsonObject(with: data!, options: []) as? [String: AnyObject]
                        completionHandler(json, HTTPResponce, nil)
                    } catch let error as NSError {
                        completionHandler(nil, HTTPResponce, error)
                    }
                default:
                    print("Response status \(HTTPResponce.statusCode)")
                }
            }
        }
        
        return dataTask
    }
    
    func fetch<T>(request: URLRequest, parse: @escaping ([String: AnyObject]?) -> T?, completionHandler: @escaping (APIResult<T>)-> Void ) {
        
        let dataTask = JSONTaskWith(request: request) { (json, response, error) in
            guard let json = json else {
                if let error = error {
                    completionHandler(.Failure(error))
                }
                return
            }
            
            if let value = parse(json) {
                completionHandler(.Success(value))
            } else {
                let error = NSError(domain: WTNetworkingErrorDomain, code: 200, userInfo: nil)
                completionHandler(.Failure(error))
            }
        }
        dataTask.resume()
    }
//    func weatherFetch(url: String,  completion: @escaping (Result<<T>, Error>) -> ()) {
//          guard let url = URL(string: url) else { return }
//
//          URLSession.shared.dataTask(with: url) { (data, responce, error) in
//              DispatchQueue.main.async {
//                  if let error = error {
//                      completion(.failure(error))
//                      return
//                  }
//                  guard let data = data else { return }
//                  do {
//                      let result = try JSONDecoder().decode(WeatherModel.self, from: data)
//                      completion(.success(result))
//
//                  } catch let jsonError {
//                      completion(.failure(jsonError))
//                  }
//              }
//          }.resume()
//      }

}

