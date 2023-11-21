//
//  SearchView.swift
//  MarvelApp
//
//  Created by user242581 on 13/11/23.
//

import SwiftUI

struct SearchView: View {
    @EnvironmentObject var coordinator: Coordinator
    @StateObject private var viewModel: SearchViewModel
    @StateObject var textObserver = TextFieldObserver()
    @State private var selected : String
    
    init(viewModel: SearchViewModel, selected : String = SearchTypeFilters.characters.rawValue) {
        _viewModel = StateObject(wrappedValue: viewModel)
        _selected = State(wrappedValue: selected) 
    }
    
    var body: some View {
        NavigationStack {
            VStack(){
                CustomSegmentedPicker<SearchTypeFilters>(sourcesEnum: SearchTypeFilters.self, selection: $selected)
                makePopularItemsView()
                VStack{
                    CustomSearchBar(
                        searchFilter: $textObserver.searchText,
                        searchPlaceholder: "Search all \(selected)",
                        onCancelClicked: {textObserver.searchText = ""}
                    )
                    .padding()
                    
                    makeItemsListView()
                    if(viewModel.isLoading){
                        ProgressView().tint(.red)
                    }
                }
                .background(.marvelSecondary)
            }
            .onChange(of: textObserver.debouncedText, initial: true){
                fetchItems()
            }
            .onChange(of: selected) {
                fetchItems()
            }
        }.onAppear {
            fetchItems()
        }
    }
    
    func fetchItems(enablePaging: Bool = false){
        Task{
            switch selected{
            case "characters" :
                textObserver.debouncedText == "" ?
                await viewModel.getCharacters(enablePaging: enablePaging) : await viewModel.getFilteredCharacters(name: textObserver.debouncedText, enablePaging: enablePaging)
            case "series" :
                textObserver.debouncedText == "" ?
                await viewModel.getSeries(enablePaging: enablePaging) : await viewModel.getFilteredSeries(title: textObserver.debouncedText, enablePaging: enablePaging)
            default:
                textObserver.debouncedText == "" ?
                await viewModel.getComics(enablePaging: enablePaging) : await viewModel.getFilteredComics(title: textObserver.debouncedText, enablePaging: enablePaging)
            }
        }
    }
    
    func makeItemsListView() -> AnyView{
        switch selected{
        case "characters" :
            return AnyView(
                coordinator.makeItemsListView(items: viewModel.characters) { character in
                    CharacterDetailView(character: character)
                }
                itemView: {character in
                    Text(character.name)
                }
                onListAppendNeeded: { itemId in
                    if(viewModel.characters.last?.id.hashValue == itemId){
                        fetchItems(enablePaging: true)
                    }
                }
            )
        case "series" :
            return AnyView(
                coordinator.makeItemsListView(items: viewModel.series) { serie in
                    SerieDetailView(serie: serie)
                }
                itemView: {serie in
                    Text(serie.title)
                }
                onListAppendNeeded: { itemId in
                    if(viewModel.series.last?.id.hashValue == itemId){
                        fetchItems(enablePaging: true)
                    }
                }
            )
        default:
            return AnyView(
                coordinator.makeItemsListView(items: viewModel.comics) { comic in
                    ComicDetailView(comic: comic)
                }
                itemView: {comic in
                    Text(comic.title)
                }
                onListAppendNeeded: { itemId in
                    if(viewModel.comics.last?.id.hashValue == itemId){
                        fetchItems(enablePaging: true)
                    }
                }
            )
        }
    }
    
    func makePopularItemsView() -> AnyView{
        switch selected.lowercased(){
        case "characters" :
            return AnyView(
                coordinator.makePopularItemsView(items: viewModel.characters) { character in
                    coordinator.makeCharacterDetailView(character: character)
                }
                itemView: { character in
                    coordinator.makePopularItemView(title: character.name, imageUrl: character.imageUrl, rounded: true)
                }
            )
        case "series" :
            return AnyView(
                coordinator.makePopularItemsView(items: viewModel.series) { serie in
                    coordinator.makeSerieDetailView(serie: serie)
                }
                itemView: { serie in
                    coordinator.makePopularItemView(title: serie.title, imageUrl: serie.imageUrl)
                }
            )
        default:
            return AnyView(
                coordinator.makePopularItemsView(items: viewModel.comics) { comic in
                    coordinator.makeComicDetailView(comic: comic)
                }
                itemView: { comic in
                    coordinator.makePopularItemView(title: comic.title, imageUrl: comic.imageUrl)
                }
            )
        }
    }
    
}

enum SearchTypeFilters: String, CaseIterable{
    case series = "series"
    case characters = "characters"
    case comics = "comics"
}

#Preview {
    let coordinator = Coordinator(mock: false)
    return coordinator.makeSearchView().environmentObject(coordinator)
}
