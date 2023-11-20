//
//  SeriesRemoteService.swift
//  MarvelApp
//
//  Created by user242581 on 15/11/23.
//

import Foundation
protocol SeriesRemoteService {
    func getSeries(offset: Int) async throws -> DataResponse<Serie>
    func getFilteredSeries(title:String, offset: Int) async throws -> DataResponse<Serie>
}
