//
//  Coordinator.swift
//  MarvelApp
//
//  Created by user242581 on 13/11/23.
//

import Foundation
class Coordinator: ObservableObject {
    private let charactersRepository: CharactersRepository
    private let comicsRepository: ComicsRepository
    private let seriesRepository: SeriesRepository

    
    init(mock: Bool = false) {
        let networkClient = URLSessionNetworkClient()
        
        let charactersRemoteService: CharactersRemoteService = mock ? MockCharactersRemoteService() : LiveCharactersRemoteService(networkClient: networkClient)
        charactersRepository = CharactersRepository(remoteService: charactersRemoteService)        
        
        let comicsRemoteService: ComicsRemoteService = mock ? MockComicsRemoteService() : LiveComicsRemoteService(networkClient: networkClient)
        comicsRepository = ComicsRepository(remoteService: comicsRemoteService)
        
        let seriesRemoteService: SeriesRemoteService = mock ? MockSeriesRemoteService() : LiveSeriesRemoteService(networkClient: networkClient)
        seriesRepository = SeriesRepository(remoteService: seriesRemoteService)
    }
    
    //MARK: - SearchView
    
    func makeSearchView() -> SearchView {
        SearchView(viewModel: makeSearchViewModel())
    }
    
    private func makeSearchViewModel() -> SearchViewModel{
        .init(
            charactersRepository: self.charactersRepository,
            comicsRepository: self.comicsRepository,
            seriesRepository: self.seriesRepository
        )
    }
    
}
