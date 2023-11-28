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
    private let eventsRepository: EventsRepository

    
    init(mock: Bool = false) {
        let networkClient = URLSessionNetworkClient()
        
        let charactersRemoteService: CharactersRemoteService = mock ? MockCharactersRemoteService() : LiveCharactersRemoteService(networkClient: networkClient)
        let charactersLocalService: CharactersLocalService = mock ? MockCharactersLocalService() : UserDefaultsCharactersLocalService()
        charactersRepository = CharactersRepository(remoteService: charactersRemoteService, localService: charactersLocalService)
        
        let comicsRemoteService: ComicsRemoteService = mock ? MockComicsRemoteService() : LiveComicsRemoteService(networkClient: networkClient)
        comicsRepository = ComicsRepository(remoteService: comicsRemoteService)
        
        let seriesRemoteService: SeriesRemoteService = mock ? MockSeriesRemoteService() : LiveSeriesRemoteService(networkClient: networkClient)
        seriesRepository = SeriesRepository(remoteService: seriesRemoteService)
        
        let eventsRemoteService: EventsRemoteService = mock ? MockEventsRemoteService() : LiveEventsRemoteService(networkClient: networkClient)
        eventsRepository = EventsRepository(remoteService: eventsRemoteService)
    }
    
    //MARK: - HomeView
    
    func makeHomeView() -> HomeView {
        HomeView(viewModel: makeHomeViewModel())
    }
    
    private func makeHomeViewModel() -> HomeViewModel{
        .init(comicsRepository: comicsRepository, seriesRepository: seriesRepository, eventsRepository: eventsRepository)
    }
    
    //MARK: - SearchView
    
    func makeSearchView(toolBarVisible: Bool = false,selected: String = SearchTypeFilters.characters.rawValue) -> SearchView {
        SearchView(viewModel: makeSearchViewModel(), selected: selected, toolBarVisible: toolBarVisible)
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
    
    func makeHorizontalItemsList<Item: Identifiable, Destination: View, ItemView: View> (items: [Item], @ViewBuilder navigationDestination: @escaping (Item) -> Destination, @ViewBuilder itemView: @escaping (Item) -> ItemView) -> some View {
        
        return HorizontalItemsList(items: items, navigationDestination: navigationDestination, itemView: itemView)
    }
    
    func makeVerticalItem(title: String, imageUrl: String, rounded : Bool = false) -> some View {
       return VerticalItemView(title: title, imageUrl: imageUrl, rounded: rounded)
    }
    
    //MARK: Details
    func makeSerieDetailView(serie: Serie) -> SerieDetailView {
        .init(viewModel: makeSerieDetailViewModel(), serie: serie)
    }
    func makeSerieDetailViewModel() -> SerieDetailViewModel{
        .init(comicsRepository: comicsRepository, charactersRepository: charactersRepository)
    }
    
    func makeComicDetailView(comic: Comic) -> ComicDetailView {
        .init(viewModel: makeComicViewModel(), comic: comic)
    }
    func makeComicViewModel() -> ComicDetailViewModel{
        .init(charactersRepository: charactersRepository)
    }
    
    
    func makeCharacterDetailView(character: Character) -> CharacterDetailView {
        .init(viewModel: makeCharacterDetailViewModel(), character: character)
    }
    func makeCharacterDetailViewModel() -> CharacterDetailViewModel{
        .init(comicsRepository: comicsRepository, seriesRepository: seriesRepository)
    }
    
}
