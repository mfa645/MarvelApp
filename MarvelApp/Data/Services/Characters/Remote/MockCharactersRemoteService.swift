//
//  MockCharactersRemoteService.swift
//  MarvelApp
//
//  Created by user242581 on 13/11/23.
//

import Foundation

struct MockCharactersRemoteService: CharactersRemoteService {
    func getCharacters() async throws -> [Character] {
        [
            .init(
                id: 1011334,
                name: "3-D Man",
                image: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784", extensionType: "jpg")
            ),
            .init(
                id: 2,
                name: "A-Bomb (HAS)",
                image: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/3/20/5232158de5b16",
                                 extensionType: "jpg")
            ),
            .init(
                id: 3,
                name: "A.I.M.",
                image: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/6/20/52602f21f29ec",
                                 extensionType: "jpg")
            ),
            .init(
                id: 4,
                name: "Aaron Stack",
                image: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/b/40/image_not_available",
                                 extensionType: "jpg")
            ),
            .init(
                id: 5,
                name: "Abomination (Emil Blonsky)",
                image: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/9/50/4ce18691cbf04",
                                 extensionType: "jpg")
            )
        ]
    }
}
