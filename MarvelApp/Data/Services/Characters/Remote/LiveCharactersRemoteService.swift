//
//  LiveCharactersRemoteService.swift
//  MarvelApp
//
//  Created by user242581 on 13/11/23.
//

import Foundation
struct LiveCharactersRemoteService: CharactersRemoteService {
    private let networkClient: NetworkClient
    
    private let ts = "1"
    private let apikey = "5c5491e9872491865148ebc97b100f75"
    private let hash = "4f8b216007e3hashfb529274febbcb4d924d"
    
    
    init(networkClient: NetworkClient) {
        self.networkClient = networkClient
    }
    
    func getCharacters() async throws -> [Character] {
        let response: APIResponse<Character> = try await networkClient.get(url: "http://gateway.marvel.com/v1/public/characters?ts=\(ts)&apikey=\(apikey)&hash=\(hash)")
        return response.data.results
    }
}
