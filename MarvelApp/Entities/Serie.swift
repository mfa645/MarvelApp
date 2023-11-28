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
    let description: String?
    let startYear: Int
    let endYear: Int
    let rating: String
    let type: String
    
    init(id: Int, title: String, thumbnail: [String : String], description: String?, startYear: Int, endYear: Int, rating: String, type: String) {
        self.id = id
        self.title = title
        self.thumbnail = thumbnail
        self.description = description
        self.startYear = startYear
        self.endYear = endYear
        self.rating = rating
        self.type = type
    }
    
    var imageUrl : String{
        "https\(thumbnail["path"]?.dropFirst(4) ?? "").\(thumbnail["extension"] ?? "")"
    }
    
    static var example: Serie {
        .init(
            id: 82967,
            title: "2020 IRON MANUAL [BUNDLES OF 25] (2020 - Present)",
            thumbnail: ["path" : "http://i.annihil.us/u/prod/marvel/i/mg/4/b0/5d939e25a9787","extension" : "jpg"],
            description: "In the wake of Arno Stark’s crusade against A.I.s, no robot is safe. Fearing of Elsie Dee’s safety in these tumultuous times, Albert, the robot Wolverine, goes to Madripoor to find her…but what he finds is a fight against Madripoor’s criminal underbelly instead! ",
            startYear: 2020,
            endYear: 2021,
            rating: "Rated - T",
            type: "one shot"
        )
    }
}
