//
//  SeriesRemoteService.swift
//  MarvelApp
//
//  Created by user242581 on 15/11/23.
//

import Foundation
protocol SeriesRemoteService {
    func getSeries() async throws -> [Serie]
    func getFilteredSeries(title:String) async throws -> [Serie]
}
