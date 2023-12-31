//
//  CharactersRemoteService.swift
//  MarvelApp
//
//  Created by user242581 on 13/11/23.
//

import Foundation
protocol CharactersRemoteService {
    func getCharacters(offset: Int) async throws -> DataResponse<Character>
    func getFilteredCharacters(name:String, offset: Int) async throws -> DataResponse<Character>
    func getCharactersOfSerie(serieId:Int) async throws -> DataResponse<Character>
    func getCharactersOfComic(comicId:Int) async throws -> DataResponse<Character>
}
