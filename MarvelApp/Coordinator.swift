//
//  Coordinator.swift
//  MarvelApp
//
//  Created by user242581 on 13/11/23.
//

import Foundation
class Coordinator: ObservableObject {
    private let charactersRepository: CharactersRepository
    
    init(mock: Bool = false) {
        let networkClient = URLSessionNetworkClient()
        
        let charactersRemoteService: CharactersRemoteService = mock ? MockCharactersRemoteService() : LiveCharactersRemoteService(networkClient: networkClient)
        charactersRepository = CharactersRepository(remoteService: charactersRemoteService)
    }
    
    //MARK: - SearchView
    
    func makeSearchView() -> SearchView {
        SearchView(viewModel: makeSearchViewModel())
    }
    
    private func makeSearchViewModel() -> SearchViewModel{
        .init(charactersRepository: self.charactersRepository)
    }
    
}
