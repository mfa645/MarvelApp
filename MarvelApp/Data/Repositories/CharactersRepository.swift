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
    
    func getCharacters(offset: Int) async throws -> DataResponse<Character> {
        try await remoteService.getCharacters(offset: offset)
    }
        
    func getFilteredCharacters(name : String, offset: Int) async throws -> DataResponse<Character> {
        try await remoteService.getFilteredCharacters(name: name, offset: offset)
    }
}
