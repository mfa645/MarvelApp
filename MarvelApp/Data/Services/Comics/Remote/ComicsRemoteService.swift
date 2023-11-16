//
//  ComicsRemoteService.swift
//  MarvelApp
//
//  Created by user242581 on 15/11/23.
//

import Foundation
protocol ComicsRemoteService {
    func getComics() async throws -> [Comic]
    func getFilteredComics(title:String) async throws -> [Comic]
}
