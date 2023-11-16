//
//  LiveCharactersRemoteService.swift
//  MarvelApp
//
//  Created by user242581 on 13/11/23.
//

import Foundation
struct LiveCharactersRemoteService: CharactersRemoteService {

    private let networkClient: NetworkClient
    
    init(networkClient: NetworkClient) {
        self.networkClient = networkClient
    }
    
    func getCharacters() async throws -> [Character] {
        let response: APIResponse<Character> = try await networkClient.get(url: "\(NetworkConstants.charactersUrl)?ts=\(NetworkConstants.ts)&apikey=\(NetworkConstants.apikey)&hash=\(NetworkConstants.hash)")
        return response.data.results
    }
    
    func getFilteredCharacters(name: String) async throws -> [Character] {
        let response: APIResponse<Character> = try await networkClient.get(url: "\(NetworkConstants.charactersUrl)?nameStartsWith=\(name)&ts=\(NetworkConstants.ts)&apikey=\(NetworkConstants.apikey)&hash=\(NetworkConstants.hash)")
        return response.data.results
    }
    
}
