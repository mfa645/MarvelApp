//
//  ComicsRepository.swift
//  MarvelApp
//
//  Created by user242581 on 16/11/23.
//

import Foundation

struct ComicsRepository {
    private let remoteService: ComicsRemoteService
    
    init(remoteService: ComicsRemoteService) {
        self.remoteService = remoteService
    }
    
    func getComics(offset: Int) async throws -> DataResponse<Comic> {
        try await remoteService.getComics(offset: offset)
    }
        
    func getFilteredComics(title : String, offset: Int) async throws -> DataResponse<Comic> {
        try await remoteService.getFilteredComics(title: title, offset: offset)
    }
    
    func getComicsOfCharacter(characterId: Int) async throws -> DataResponse<Comic> {
        try await remoteService.getComicsOfCharacter(characterId: characterId)
    }
    
    func getComicsOfSerie(serieId: Int) async throws -> DataResponse<Comic> {
        try await remoteService.getComicsOfSerie(serieId: serieId)
    }
}
