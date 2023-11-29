//
//  Character.swift
//  MarvelApp
//
//  Created by user242581 on 13/11/23.
//

import Foundation

struct Character: Identifiable, Codable, Equatable, Hashable{
    let id: Int
    let name: String
    let thumbnail: [String:String]
    let description: String
    
    init(id: Int, name: String, thumbnail: [String : String], description: String) {
        self.id = id
        self.name = name
        self.thumbnail = thumbnail
        self.description = description
    }
    
    var imageUrl : String{
        "https\(thumbnail["path"]?.dropFirst(4) ?? "").\(thumbnail["extension"] ?? "")"
    }
    
    static var example: Character {
        .init(
            id: 1011334,
            name: "Spider-Girl (May Parker)",
            thumbnail: ["path" : "http://i.annihil.us/u/prod/marvel/i/mg/1/70/4c003adccbe4f","extension" : "jpg"],
            description: "Rick Jones has been Hulk's best bud since day one, but now he's more than a friend...he's a teammate! Transformed by a Gamma energy explosion, A-Bomb's thick, armored skin is just as strong and powerful as it is blue. And when he curls into action, he uses it like a giant bowling ball of destruction! "
        )
    }
}
