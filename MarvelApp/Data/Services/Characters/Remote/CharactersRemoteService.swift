//
//  CharactersRemoteService.swift
//  MarvelApp
//
//  Created by user242581 on 13/11/23.
//

import Foundation
protocol CharactersRemoteService {
    func getCharacters(offset: Int) async throws -> DataResponse<Character>
    func getFilteredCharacters(name:String) async throws -> DataResponse<Character>
}
