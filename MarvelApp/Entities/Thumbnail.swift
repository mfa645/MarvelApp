//
//  Thumbnail.swift
//  MarvelApp
//
//  Created by user242581 on 13/11/23.
//

import Foundation

struct Thumbnail: Decodable{
    enum CodingKeys: String, CodingKey {
        case path
        case extensionType = "extension"
    }
    
    let path : String
    let extensionType : String
    
    init(path: String, extensionType: String) {
        self.path = "https" + path.dropFirst(4)
        self.extensionType = extensionType
    }
}
