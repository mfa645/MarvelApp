//
//  Comic.swift
//  MarvelApp
//
//  Created by user242581 on 14/11/23.
//

import Foundation

struct Comic: Identifiable, Decodable {
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
    
    static var example: Comic {
        .init(
            id: 82967,
            name: "Official Handbook of the Marvel Universe (2004) #11 (X-MEN - AGE OF APOCALYPSE)",
            thumbnail: ["path" : "http://i.annihil.us/u/prod/marvel/i/mg/c/b0/4bc6494ed6eb4","extension" : "jpg"]
        )
    }
}
