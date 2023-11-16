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
    let thumbnail: [String:String]
    
    init(id: Int, name: String, thumbnail: [String : String]) {
        self.id = id
        self.name = name
        self.thumbnail = thumbnail
    }
    
    var imageUrl : String{
        "https\(thumbnail["path"]?.dropFirst(4) ?? "").\(thumbnail["extension"] ?? "")"
    }
    
    static var example: Character {
        .init(
            id: 1011334,
            name: "3-D Man",
            thumbnail: ["path" : "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784","extension" : "jpg"]
        )
    }
}
