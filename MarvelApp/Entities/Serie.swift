//
//  Serie.swift
//  MarvelApp
//
//  Created by user242581 on 15/11/23.
//

import Foundation

struct Serie: Identifiable, Decodable {
    let id: Int
    let title: String
    var thumbnail: [String:String]
    
    init(id: Int, name: String, thumbnail: [String : String]) {
        self.id = id
        self.title = name
        self.thumbnail = thumbnail
    }
    
    var imageUrl : String{
        "https\(thumbnail["path"]?.dropFirst(4) ?? "").\(thumbnail["extension"] ?? "")"
    }
    
    static var example: Serie {
        .init(
            id: 82967,
            name: "100th Anniversary Special (2014)",
            thumbnail: ["path" : "http://i.annihil.us/u/prod/marvel/i/mg/4/b0/5d939e25a9787","extension" : "jpg"]
        )
    }
}
