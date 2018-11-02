///**
/**

Tenant.swift
Sport B.I.

Created by: Kevin on 25/10/18
Using Swift 4.0
Running on macOS 10.14

Copyright (c) 2018 ClubSpeed. All rights reserved.

*/

import Foundation

struct Tenant: Codable {
    
    let id: String?
    let name: String?
    
    enum CodingKeys: String, CodingKey {
        
        case id   = "_id"
        case name = "name"
    }
    
    init(from decoder: Decoder) throws {
        
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id   = try values.decodeIfPresent(String.self, forKey: .id)
        name = try values.decodeIfPresent(String.self, forKey: .name)
    }
}
