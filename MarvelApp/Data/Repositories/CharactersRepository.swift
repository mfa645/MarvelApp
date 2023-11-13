//
//  CharactersRepository.swift
//  MarvelApp
//
//  Created by user242581 on 13/11/23.
//

import Foundation

struct CharactersRepository {
    private let remoteService: CharactersRemoteService
    
    init(remoteService: CharactersRemoteService) {
        self.remoteService = remoteService
    }
    
    func getCharacters() async throws -> [Character] {
        try await remoteService.getCharacters()
    }
}
