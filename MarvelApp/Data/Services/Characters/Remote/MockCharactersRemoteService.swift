//
//  MockCharactersRemoteService.swift
//  MarvelApp
//
//  Created by user242581 on 13/11/23.
//

import Foundation

struct MockCharactersRemoteService: CharactersRemoteService {
    func getFilteredCharacters(name: String) async throws -> DataResponse<Character> {
        let characters : [Character] = [
            .init(
                id: 1011334,
                name: "3-D Man",
                thumbnail: ["path" : "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784","extension" : "jpg"]
            ),
            .init(
                id: 2,
                name: "A-Bomb (HAS)",
                thumbnail: ["path" : "http://i.annihil.us/u/prod/marvel/i/mg/3/20/5232158de5b16","extension" : "jpg"]
            ),
            .init(
                id: 3,
                name: "A.I.M.",
                thumbnail: ["path" : "http://i.annihil.us/u/prod/marvel/i/mg/6/20/52602f21f29ec","extension" : "jpg"]
            ),
            .init(
                id: 4,
                name: "Aaron Stack",
                thumbnail: ["path" : "http://i.annihil.us/u/prod/marvel/i/mg/b/40/image_not_available","extension" : "jpg"]
            ),
            .init(
                id: 101334,
                name: "3-D Man",
                thumbnail: ["path" : "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784","extension" : "jpg"]
            ),
            .init(
                id: 125,
                name: "A-Bomb (HAS)",
                thumbnail: ["path" : "http://i.annihil.us/u/prod/marvel/i/mg/3/20/5232158de5b16","extension" : "jpg"]
            ),
            .init(
                id: 65,
                name: "A.I.M.",
                thumbnail: ["path" : "http://i.annihil.us/u/prod/marvel/i/mg/6/20/52602f21f29ec","extension" : "jpg"]
            ),
            .init(
                id: 4,
                name: "Aaron Stack",
                thumbnail: ["path" : "http://i.annihil.us/u/prod/marvel/i/mg/b/40/image_not_available","extension" : "jpg"]
            ),
            .init(
                id: 464,
                name: "Abomination (Emil Blonsky)",
                thumbnail: ["path" : "http://i.annihil.us/u/prod/marvel/i/mg/9/50/4ce18691cbf04","extension" : "jpg"]
            )
        ]
        
            let filteredCharacters = characters.filter{character in
            character.name.starts(with: name)
        }
        return DataResponse<Character>(offset: 0, count: filteredCharacters.count, total: filteredCharacters.count, results: filteredCharacters)

    }
    
    func getCharacters(offset:Int) async throws -> DataResponse<Character> {
        let characters: [Character] = [
            .init(
                id: 1011334,
                name: "3-D Man",
                thumbnail: ["path" : "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784","extension" : "jpg"]
            ),
            .init(
                id: 2,
                name: "A-Bomb (HAS)",
                thumbnail: ["path" : "http://i.annihil.us/u/prod/marvel/i/mg/3/20/5232158de5b16","extension" : "jpg"]
            ),
            .init(
                id: 3,
                name: "A.I.M.",
                thumbnail: ["path" : "http://i.annihil.us/u/prod/marvel/i/mg/6/20/52602f21f29ec","extension" : "jpg"]
            ),
            .init(
                id: 4,
                name: "Aaron Stack",
                thumbnail: ["path" : "http://i.annihil.us/u/prod/marvel/i/mg/b/40/image_not_available","extension" : "jpg"]
            ),
            .init(
                id: 5,
                name: "Abomination (Emil Blonsky)",
                thumbnail: ["path" : "http://i.annihil.us/u/prod/marvel/i/mg/9/50/4ce18691cbf04","extension" : "jpg"]
            )
        ]
        return DataResponse<Character>(offset: 0, count: characters.count, total: characters.count, results: characters)

    }
}
