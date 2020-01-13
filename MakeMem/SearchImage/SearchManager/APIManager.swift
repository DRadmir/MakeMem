//
//  APIManager.swift
//  MakeMem
//
//  Created by Radmir Dzhurabaev on 13.01.2020.
//  Copyright © 2020 Radmir Dzhurabaev. All rights reserved.
//

import Foundation

typealias JSONTask = URLSessionDataTask
typealias JSONComplitionHandler = (Data?, HTTPURLResponse?, Error?) -> Void


protocol JSONDecodable {
    init?(JSON: [GoogleResponse])
}

protocol FinalURLPoint {
    var baseURL: URL { get }
    var path: String { get }
    var request: URLRequest { get }
}

protocol APIManager {
    
    var sessionConfiguration: URLSessionConfiguration { get }
    var session: URLSession { get }
    
    func JSONTaskWith(request: URLRequest, complitionHandler: @escaping JSONComplitionHandler) -> JSONTask
    func fetchData(request: URLRequest, result: @escaping (GoogleResponse) -> (), completion: @escaping (GoogleResponse) -> ())
    
}

extension APIManager {
    
    func JSONTaskWith(request: URLRequest, complitionHandler: @escaping JSONComplitionHandler) -> JSONTask {
        
        let dataTask = session.dataTask(with: request) { (data, response, error) in
            
            guard let HTTPResponse = response as? HTTPURLResponse else {
                
                let userInfo = [
                    NSLocalizedDescriptionKey: NSLocalizedString("Missing HTTP Response", comment: "")
                ]
                let error = NSError(domain: SWINetworkingErrorDomain, code: 100, userInfo: userInfo)
                
                complitionHandler(nil, nil, error)
                return
            }
            
            if data == nil {
                if let error = error {
                    complitionHandler(nil, HTTPResponse, error)
                }
            } else {
                switch HTTPResponse.statusCode {
                case 200:
                    if let error = error {
                        complitionHandler(nil, HTTPResponse, error)
                    } else {
                        complitionHandler(data, HTTPResponse, nil)
                    }
                default:
                    print("We have got response status \(HTTPResponse.statusCode)")
                }
            }
        }
        return dataTask
    }
    
    func fetchData(request: URLRequest, result: @escaping (GoogleResponse) -> (), completion: @escaping (GoogleResponse) -> ()) {
        
        let dataTask = JSONTaskWith(request: request) { (data, response, error) in
            
            DispatchQueue.main.async {
                do {
                    
                    guard let data = data else { return }
                    let response = try JSONDecoder().decode(GoogleResponse.self, from: data)
                    completion(response)
                    result(response)
                    
                } catch {
                    
                    let error = NSError(domain: SWINetworkingErrorDomain, code: 200, userInfo: nil)
                    print(error)
                    
                }
            }
        }
        dataTask.resume()
    }

}
