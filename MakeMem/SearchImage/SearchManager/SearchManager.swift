//
//  SearchManager.swift
//  MakeMem
//
//  Created by Radmir Dzhurabaev on 13.01.2020.
//  Copyright © 2020 Radmir Dzhurabaev. All rights reserved.
//

import UIKit

enum SearchType: FinalURLPoint {
    case Current(engineID: String, query: String, apiKey: String, searchType: String, startIndex: Int)
    
    var baseURL: URL {
        return URL(string: "https://www.googleapis.com/customsearch/v1")!
    }

    var path: String {
        switch self {
        case .Current(let engineID, let query, let apiKey, let searchType, let startIndex):
            return "?key=\(apiKey)&cx=\(engineID)&searchType=\(searchType)&q=\(query)&start=\(startIndex)"
        }
    }
    
    var request: URLRequest {
        let url = URL(string: path, relativeTo: baseURL)
        return URLRequest(url: url!)

    }
}

final class SearchManager: APIManager {
    
    let sessionConfiguration: URLSessionConfiguration
    lazy var session: URLSession = {
        return URLSession(configuration: self.sessionConfiguration)
    } ()
    
    let engineID: String
    let apiKey: String
    let searchType: String
    
    
    init(sessionConfiguration: URLSessionConfiguration, engineID: String, apiKey: String, searchType: String) {
        self.sessionConfiguration = sessionConfiguration
        self.engineID = engineID
        self.apiKey = apiKey
        self.searchType = searchType
    }
    
    convenience init(engineID: String, apiKey: String, searchType: String) {
        self.init(sessionConfiguration: URLSessionConfiguration.default, engineID: engineID, apiKey: apiKey, searchType: searchType)
    }
    
    func fetchCurrentSearchWith(query: String, startIndex: Int, completion: @escaping (GoogleResponse) -> ()) {
        
        let request = SearchType.Current(engineID: self.engineID, query: query, apiKey: self.apiKey, searchType: self.searchType, startIndex: startIndex).request
        
        fetchData(request: request, result: { (response) in
            
        }, completion: completion)

    }
    
    
}
