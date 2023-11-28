//
//  CharactersRepository.swift
//  MarvelApp
//
//  Created by user242581 on 13/11/23.
//

import Foundation

struct CharactersRepository {
    private let remoteService: CharactersRemoteService
    private let localService: CharactersLocalService
    
    init(remoteService: CharactersRemoteService, localService: CharactersLocalService) {
        self.remoteService = remoteService
        self.localService = localService
    }
    
    func getCharacters(offset: Int) async throws -> DataResponse<Character> {
        try await remoteService.getCharacters(offset: offset)
    }
        
    func getFilteredCharacters(name : String, offset: Int) async throws -> DataResponse<Character> {
        try await remoteService.getFilteredCharacters(name: name, offset: offset)
    }
    
    func getCharactersOfSerie(serieId: Int) async throws -> DataResponse<Character> {
        try await remoteService.getCharactersOfSerie(serieId: serieId)
    }
    
    func getCharactersOfComic(comicId: Int) async throws -> DataResponse<Character> {
        try await remoteService.getCharactersOfComic(comicId: comicId)
    }
    
    func getFavouriteCharacters() throws -> [Character]{
        try localService.getCharacters()
    }
    func saveFavouriteCharacter(character: Character) throws {
        try localService.saveCharacter(character: character)
    }
    func deleteFavouriteCharacter(characterId: Int) throws{
        try localService.deleteCharacter(characterId: characterId)
    }
}
