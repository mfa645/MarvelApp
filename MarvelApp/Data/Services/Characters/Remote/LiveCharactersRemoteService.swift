//
//  LiveCharactersRemoteService.swift
//  MarvelApp
//
//  Created by user242581 on 13/11/23.
//

import Foundation
struct LiveCharactersRemoteService: CharactersRemoteService {
    private let networkClient: NetworkClient
    
    init(networkClient: NetworkClient) {
        self.networkClient = networkClient
    }
    
    func getCharacters(offset: Int) async throws -> DataResponse<Character> {
        let response: APIResponse<Character> = try await networkClient.get(url: "\(NetworkConstants.charactersUrl)?ts=\(NetworkConstants.ts)&apikey=\(NetworkConstants.apikey)&hash=\(NetworkConstants.hash)&offset=\(offset)")
        return response.data
    }
    
    func getFilteredCharacters(name: String, offset: Int) async throws -> DataResponse<Character> {
        let response: APIResponse<Character> = try await networkClient.get(url: "\(NetworkConstants.charactersUrl)?nameStartsWith=\(name)&ts=\(NetworkConstants.ts)&apikey=\(NetworkConstants.apikey)&hash=\(NetworkConstants.hash)&offset=\(offset)")
        return response.data
    }   
    func getCharactersOfSerie(serieId:Int) async throws -> DataResponse<Character> {
        let response: APIResponse<Character> = try await networkClient.get(url: "\(NetworkConstants.seriesUrl)/\(serieId)/characters?ts=\(NetworkConstants.ts)&apikey=\(NetworkConstants.apikey)&hash=\(NetworkConstants.hash)")
        return response.data
    }
    func getCharactersOfComic(comicId: Int) async throws -> DataResponse<Character> {
        let response: APIResponse<Character> = try await networkClient.get(url: "\(NetworkConstants.comicsUrl)/\(comicId)/characters?ts=\(NetworkConstants.ts)&apikey=\(NetworkConstants.apikey)&hash=\(NetworkConstants.hash)")
        return response.data
    }
    
}
