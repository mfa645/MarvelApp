//
//  Character.swift
//  MarvelApp
//
//  Created by user242581 on 13/11/23.
//

import Foundation

struct Character: Identifiable, Decodable {
    let id: Int
    let name: String
    var image: Thumbnail
    
    static var example: Character {
        .init(
            id: 1011334,
            name: "3-D Man",
            image: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784", extensionType: "jpg")
        )
    }
}
