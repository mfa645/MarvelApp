//
//  LiveComicsRemoteService.swift
//  MarvelApp
//
//  Created by user242581 on 15/11/23.
//

import Foundation


struct LiveComicsRemoteService: ComicsRemoteService{
    private let networkClient: NetworkClient

    init(networkClient: NetworkClient) {
        self.networkClient = networkClient
    }
    
    func getComics() async throws -> [Comic] {
        let response: APIResponse<Comic> = try await networkClient.get(url: "\(NetworkConstants.comicsUrl)?ts=\(NetworkConstants.ts)&apikey=\(NetworkConstants.apikey)&hash=\(NetworkConstants.hash)")
        return response.data.results
    }
    
    func getFilteredComics(title: String) async throws -> [Comic] {
        let response: APIResponse<Comic> = try await networkClient.get(url: "\(NetworkConstants.comicsUrl)?titleStartsWith=\(title)&ts=\(NetworkConstants.ts)&apikey=\(NetworkConstants.apikey)&hash=\(NetworkConstants.hash)")
        return response.data.results
    }
}
