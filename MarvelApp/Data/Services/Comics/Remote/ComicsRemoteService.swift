//
//  ComicsRemoteService.swift
//  MarvelApp
//
//  Created by user242581 on 15/11/23.
//

import Foundation
protocol ComicsRemoteService {
    func getComics(offset: Int) async throws -> DataResponse<Comic>
    func getFilteredComics(title:String, offset: Int) async throws -> DataResponse<Comic>
}
