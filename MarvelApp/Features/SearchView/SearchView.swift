//
//  SearchView.swift
//  MarvelApp
//
//  Created by user242581 on 13/11/23.
//

import SwiftUI
import AlertToast

struct SearchView: View {
    @EnvironmentObject var coordinator: Coordinator
    @StateObject private var viewModel: SearchViewModel
    @StateObject var textObserver = TextFieldObserver()
    @State private var selected : String
    let toolBarVisible : Bool
    
    init(viewModel: SearchViewModel, selected : String = SearchTypeFilters.characters.rawValue, toolBarVisible: Bool = false) {
        _viewModel = StateObject(wrappedValue: viewModel)
        _selected = State(wrappedValue: selected)
        self.toolBarVisible = toolBarVisible
    }
    
    var body: some View {
        NavigationStack {
            VStack(){
                CustomSegmentedPicker<SearchTypeFilters>(sourcesEnum: SearchTypeFilters.self, selection: $selected)
                    .if(toolBarVisible) { view in
                        view.toolbar{
                            ToolbarItem(placement: .principal) {
                                Image("marvelLogo").resizable().scaledToFit().scaleEffect(2).tint(.white.opacity(0.7)).padding(.trailing)
                            }
                        }
                    }
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
                .toast(isPresenting: $viewModel.showErrorMessage, alert: {
                    AlertToast(type: .regular, title: " (!) An error ocurred")
                })
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
                    coordinator.makeCharacterDetailView(character: character)
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
                    coordinator.makeSerieDetailView(serie: serie)
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
                    coordinator.makeComicDetailView(comic: comic)
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
                coordinator.makeHorizontalItemsList(items: viewModel.characters) { character in
                    coordinator.makeCharacterDetailView(character: character)
                }
                itemView: { character in
                    coordinator.makeVerticalItem(title: character.name, imageUrl: character.imageUrl, rounded: true)
                }
                    .frame(height:200)
                    .padding(.top)
            )
        case "series" :
            return AnyView(
                coordinator.makeHorizontalItemsList(items: viewModel.series) { serie in
                    coordinator.makeSerieDetailView(serie: serie)
                }
                itemView: { serie in
                    coordinator.makeVerticalItem(title: serie.title, imageUrl: serie.imageUrl)
                }
            )
        default:
            return AnyView(
                coordinator.makeHorizontalItemsList(items: viewModel.comics) { comic in
                    coordinator.makeComicDetailView(comic: comic)
                }
                itemView: { comic in
                    coordinator.makeVerticalItem(title: comic.title, imageUrl: comic.imageUrl)
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
