//
//  MockComicsRemoteResponse.swift
//  MarvelApp
//
//  Created by user242581 on 15/11/23.
//

import Foundation

struct MockComicsRemoteService: ComicsRemoteService {
    func getFilteredComics(name: String) async throws -> [Comic] {
        let comics : [Comic] =         [
            .init(
                id: 1,
                name: "Ant-Man (2003) #3",
                thumbnail: ["path" : "http://i.annihil.us/u/prod/marvel/i/mg/d/70/4bc69c7e9b9d7","extension" : "jpg"]
            ),
            .init(
                id: 2,
                name: "Official Handbook of the Marvel Universe (2004) #14 (FANTASTIC FOUR)",
                thumbnail: ["path" : "http://i.annihil.us/u/prod/marvel/i/mg/9/90/4bc6353e5fc56","extension" : "jpg"]
            ),
            .init(
                id: 3,
                name: "Official Handbook of the Marvel Universe (2004) #11 (X-MEN - AGE OF APOCALYPSE)",
                thumbnail: ["path" :  "http://i.annihil.us/u/prod/marvel/i/mg/c/b0/4bc6494ed6eb4","extension" : "jpg"]
            ),
            .init(
                id: 4,
                name: "ULTIMATE X-MEN VOL. 5: ULTIMATE WAR TPB (Trade Paperback)",
                thumbnail: ["path" :  "http://i.annihil.us/u/prod/marvel/i/mg/2/f0/4bc6670c80007","extension" : "jpg"]
            ),
            .init(
                id: 5,
                name: "Gun Theory (2003) #3",
                thumbnail: ["path" : "http://i.annihil.us/u/prod/marvel/i/mg/c/60/4bc69f11baf75","extension" : "jpg"]
            )
        ]
        
        return comics.filter{comic in
            comic.name.starts(with: name)
        }
    }
    
    func getComics() async throws -> [Comic] {
        [
            .init(
                id: 1,
                name: "Ant-Man (2003) #3",
                thumbnail: ["path" : "http://i.annihil.us/u/prod/marvel/i/mg/d/70/4bc69c7e9b9d7","extension" : "jpg"]
            ),
            .init(
                id: 2,
                name: "Official Handbook of the Marvel Universe (2004) #14 (FANTASTIC FOUR)",
                thumbnail: ["path" : "http://i.annihil.us/u/prod/marvel/i/mg/9/90/4bc6353e5fc56","extension" : "jpg"]
            ),
            .init(
                id: 3,
                name: "Official Handbook of the Marvel Universe (2004) #11 (X-MEN - AGE OF APOCALYPSE)",
                thumbnail: ["path" :  "http://i.annihil.us/u/prod/marvel/i/mg/c/b0/4bc6494ed6eb4","extension" : "jpg"]
            ),
            .init(
                id: 4,
                name: "ULTIMATE X-MEN VOL. 5: ULTIMATE WAR TPB (Trade Paperback)",
                thumbnail: ["path" :  "http://i.annihil.us/u/prod/marvel/i/mg/2/f0/4bc6670c80007","extension" : "jpg"]
            ),
            .init(
                id: 5,
                name: "Gun Theory (2003) #3",
                thumbnail: ["path" : "http://i.annihil.us/u/prod/marvel/i/mg/c/60/4bc69f11baf75","extension" : "jpg"]
            )
        ]
    }
}
