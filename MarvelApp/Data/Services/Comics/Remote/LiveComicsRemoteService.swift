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
    
    func getComics(offset: Int) async throws -> DataResponse<Comic> {
        let response: APIResponse<Comic> = try await networkClient.get(url: "\(NetworkConstants.comicsUrl)?ts=\(NetworkConstants.ts)&apikey=\(NetworkConstants.apikey)&hash=\(NetworkConstants.hash)&offset=\(offset)")
        return response.data
    }
    
    func getFilteredComics(title: String, offset: Int) async throws -> DataResponse<Comic> {
        let response: APIResponse<Comic> = try await networkClient.get(url: "\(NetworkConstants.comicsUrl)?titleStartsWith=\(title)&ts=\(NetworkConstants.ts)&apikey=\(NetworkConstants.apikey)&hash=\(NetworkConstants.hash)&offset=\(offset)")
        return response.data
    }
}
