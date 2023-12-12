//
//  Comic.swift
//  MarvelApp
//
//  Created by user242581 on 14/11/23.
//

import Foundation

struct Comic: Identifiable, Decodable{
    let id: Int
    let title: String
    var thumbnail: [String:String]
    let variantDescription: String
    let description: String?
    let format: String
    let pageCount: Int

    init(id: Int, title: String, thumbnail: [String : String], variantDescription: String, description: String?, format: String, pageCount: Int) {
        self.id = id
        self.title = title
        self.thumbnail = thumbnail
        
        self.variantDescription = variantDescription
        self.description = description
        self.format = format
        self.pageCount = pageCount
    }
    
    var imageUrl : String{
        "https\(thumbnail["path"]?.dropFirst(4) ?? "").\(thumbnail["extension"] ?? "")"
    }    
    
    static var example: Comic {
        .init(
            id: 82967,
            title: "Official Handbook of the Marvel Universe (2004) #11 (X-MEN - AGE OF APOCALYPSE)",
            thumbnail: ["path" : "http://i.annihil.us/u/prod/marvel/i/mg/c/b0/4bc6494ed6eb4","extension" : "jpg"],
            variantDescription: "Frison Mighty Men Variant",
            description: "On the mean streets of the Marvel Universe, the kid gloves come off. Guardian devils, vengeance-seeking vigilantes and enigmatic assassins stalk the city's dark underbelly _ and the urban action unfolds with gritty intensity. The newest entry in Marvel's best-selling Handbook series, OHOTMUMK04 includes in-depth bios on a host of the House's edgiest icons - from Black Panther to Shang-Chi!",
            format: "Comic",
            pageCount: 72
        )
    }
}
