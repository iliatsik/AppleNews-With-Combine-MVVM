//
//  NFT.swift
//  CombineApp
//
//  Created by Ilia Tsikelashvili on 21.02.22.
//

import Foundation

struct NFT: Codable {
    var assets: [Assets]
}

struct Assets: Codable {
    var image: String
    var name: String
    var description: String
    var link: String
    
    enum CodingKeys: String, CodingKey {
        case name, description
        case image = "image_url"
        case link = "permalink"
    }
}
