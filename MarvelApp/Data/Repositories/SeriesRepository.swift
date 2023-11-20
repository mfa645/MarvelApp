//
//  SeriesRepository.swift
//  MarvelApp
//
//  Created by user242581 on 16/11/23.
//

import Foundation

struct SeriesRepository {
    private let remoteService: SeriesRemoteService
    
    init(remoteService: SeriesRemoteService) {
        self.remoteService = remoteService
    }
    
    func getSeries(offset: Int) async throws -> DataResponse<Serie> {
        try await remoteService.getSeries(offset: offset)
    }
        
    func getFilteredSeries(title : String, offset: Int) async throws -> DataResponse<Serie> {
        try await remoteService.getFilteredSeries(title: title, offset: offset)
    }
    
}
