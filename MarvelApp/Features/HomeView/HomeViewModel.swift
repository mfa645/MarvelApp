//
//  HomeViewModel.swift
//  MarvelApp
//
//  Created by user242581 on 20/11/23.
//

import Foundation
class HomeViewModel : ObservableObject{
    let comicsRepository: ComicsRepository
    let seriesRepository: SeriesRepository
    
    init(comicsRepository: ComicsRepository, seriesRepository: SeriesRepository) {
        self.comicsRepository = comicsRepository
        self.seriesRepository = seriesRepository
    }
}
