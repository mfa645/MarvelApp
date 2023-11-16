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
    
    func getComics() async throws -> [Comic] {
        try await remoteService.getComics()
    }
        
    func getFilteredComics(title : String) async throws -> [Comic] {
        try await remoteService.getFilteredComics(title: title)
    }
    
}
