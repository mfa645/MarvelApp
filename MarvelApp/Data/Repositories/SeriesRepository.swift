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
    
    func getSeries() async throws -> [Serie] {
        try await remoteService.getSeries()
    }
        
    func getFilteredSeries(title : String) async throws -> [Serie] {
        try await remoteService.getFilteredSeries(title: title)
    }
    
}
