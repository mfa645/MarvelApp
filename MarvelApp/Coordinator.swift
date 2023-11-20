//
//  Coordinator.swift
//  MarvelApp
//
//  Created by user242581 on 13/11/23.
//

import Foundation
import SwiftUI
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
    
    //MARK: - HomeView
    
    func makeHomeView() -> HomeView {
        HomeView(viewModel: makeHomeViewModel())
    }
    
    private func makeHomeViewModel() -> HomeViewModel{
        .init(comicsRepository: comicsRepository, seriesRepository: seriesRepository)
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
    
    func makeItemsListView<Item: Identifiable, Destination: View, ItemView: View> (items: [Item], @ViewBuilder navigationDestination: @escaping (Item) -> Destination, @ViewBuilder itemView: @escaping (Item) -> ItemView, onListAppendNeeded: @escaping (Int)->Void) -> any View {
        
       return ItemsListView(items: items, navigationDestination: navigationDestination, itemView: itemView, onListAppendNeeded: onListAppendNeeded)
        
    }
    
    func makePopularItemsView<Item: Identifiable, Destination: View, ItemView: View> (items: [Item], @ViewBuilder navigationDestination: @escaping (Item) -> Destination, @ViewBuilder itemView: @escaping (Item) -> ItemView, onListAppendNeeded: @escaping (Int)->Void) -> some View {
        
        return PopularItemsView(items: items, navigationDestination: navigationDestination, itemView: itemView, onListAppendNeeded: onListAppendNeeded)
    }
    
    func makePopularItemView(title: String, imageUrl: String, rounded : Bool = false) -> some View {
       return PopularItemView(title: title, imageUrl: imageUrl, rounded: rounded)
    }
    
    //MARK: Details
    func makeSerieDetailView(serie: Serie) -> SerieDetailView {
        .init(serie: serie)
    }    
    func makeComicDetailView(comic: Comic) -> ComicDetailView {
        .init(comic: comic)
    }
    func makeCharacterDetailView(character: Character) -> CharacterDetailView {
        .init(character: character)
    }
    
}
