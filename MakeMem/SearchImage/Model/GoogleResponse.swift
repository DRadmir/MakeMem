//
//  GoogleResponse.swift
//  MakeMem
//
//  Created by Radmir Dzhurabaev on 13.01.2020.
//  Copyright © 2020 Radmir Dzhurabaev. All rights reserved.
//

import Foundation

struct GoogleResponse: Decodable {
    let items: [ItemsInfo]
    let queries: Queries
    
    enum Codingkeys: String, CodingKey {
        case items
        case queries
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: Codingkeys.self)
        items = try container.decode([ItemsInfo].self, forKey: .items)
        queries = try container.decode(Queries.self, forKey: .queries)
    }
}

struct ItemsInfo: Decodable {
    let link: String
    
    enum CodingKeys: String, CodingKey {
        case link
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        link = try container.decode(String.self, forKey: .link)
    }
}

struct Queries: Decodable {
    let nextPage: [Page]
    
    enum CodingKeys: String, CodingKey {
        case nextPage
    }
    
    init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
        nextPage = try container.decode([Page].self, forKey: .nextPage)
    }
}

struct Page: Decodable {
    let startIndex: Int
    
    enum CodingKeys: String, CodingKey {
        case startIndex
    }
    
    init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
        startIndex = try container.decode(Int.self, forKey: .startIndex)
    }
}
