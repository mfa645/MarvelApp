//
//  LiveSeriesRemoteService.swift
//  MarvelApp
//
//  Created by user242581 on 15/11/23.
//

import Foundation

struct LiveSeriesRemoteService: SeriesRemoteService{
    private let networkClient: NetworkClient

    init(networkClient: NetworkClient) {
        self.networkClient = networkClient
    }
    
    func getSeries(offset: Int) async throws -> DataResponse<Serie> {
        let response: APIResponse<Serie> = try await networkClient.get(url: "\(NetworkConstants.seriesUrl)?ts=\(NetworkConstants.ts)&apikey=\(NetworkConstants.apikey)&hash=\(NetworkConstants.hash)&offset=\(offset)")
        return response.data
    }
    
    func getFilteredSeries(title: String, offset: Int) async throws -> DataResponse<Serie> {
        let response: APIResponse<Serie> = try await networkClient.get(url: "\(NetworkConstants.seriesUrl)?titleStartsWith=\(title)&ts=\(NetworkConstants.ts)&apikey=\(NetworkConstants.apikey)&hash=\(NetworkConstants.hash)&offset=\(offset)")
        return response.data
    }
}
