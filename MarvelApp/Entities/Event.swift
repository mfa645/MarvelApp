//
//  Event.swift
//  MarvelApp
//
//  Created by user242581 on 20/11/23.
//

import Foundation

struct Event: Identifiable, Decodable {
    let id: Int
    let title: String
    let description: String
    var thumbnail: [String:String]
    
    init(id: Int, title: String, description: String, thumbnail: [String : String]) {
        self.id = id
        self.title = title
        self.thumbnail = thumbnail
        self.description = description
    }
    
    var imageUrl : String{
        "https\(thumbnail["path"]?.dropFirst(4) ?? "").\(thumbnail["extension"] ?? "")"
    }
    
    static var example: Event {
        .init(
            id: 82967,
            title: "Acts of Vengeance!",
            description: "Loki sets about convincing the super-villains of Earth to attack heroes other than those they normally fight in an attempt to destroy the Avengers to absolve his guilt over inadvertently creating the team in the first place.",
            thumbnail: ["path" : "http://i.annihil.us/u/prod/marvel/i/mg/9/40/51ca10d996b8b","extension" : "jpg"]
        )
    }
}
