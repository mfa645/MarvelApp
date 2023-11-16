//
//  SearchView.swift
//  MarvelApp
//
//  Created by user242581 on 13/11/23.
//

import SwiftUI
import Combine

struct SearchView: View {
    @EnvironmentObject var coordinator: Coordinator
    @StateObject private var viewModel: SearchViewModel
    @StateObject var textObserver = TextFieldObserver()
    @State private var selected = SearchTypeFilters.characters.rawValue
    
    init(viewModel: SearchViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 30){
                CustomSegmentedPicker<SearchTypeFilters>(sourcesEnum: SearchTypeFilters.self, selection: $selected, onTabChange:{})
                
                makePopularItemsView()
                    .task {
                  await fetchItems()
                }
                VStack{
                    CustomSearchBar(
                        searchFilter: $textObserver.searchText,
                        searchPlaceholder: "Search all \(selected.lowercased())",
                        onCancelClicked: {textObserver.searchText = ""}
                    )
                    .padding()
                    
                    makeItemsListView()
                }
                .background(.marvelSecondary)
            }.onChange(of: textObserver.debouncedText, initial: true){
                Task{
                    textObserver.debouncedText != "" ?  await
                    fetchFilteredItems() : await fetchItems()
                }
            }
        }
    }
    
    func fetchFilteredItems() async{
        switch selected{
        case "CHARACTERS" :
            await viewModel.getFilteredCharacters(name: textObserver.debouncedText)
        case "SERIES" :
            await viewModel.getFilteredComics(title: textObserver.debouncedText)
        default:
            await viewModel.getFilteredSeries(title: textObserver.debouncedText)
            
        }
    }    
    func fetchItems() async{
        switch selected{
        case "CHARACTERS" :
            await viewModel.getCharacters()
        case "SERIES" :
            await viewModel.getSeries()
        default:
            await viewModel.getComics()
            
        }
    }
    
    func makeItemsListView() -> AnyView{
        switch selected{
        case "CHARACTERS" :
            return AnyView(ItemsListView(items: viewModel.characters) { character in
                CharacterDetailView(character: character)
            } itemView: {character in
                Text(character.name)
            }.task {
                await viewModel.getCharacters()
            })
        case "SERIES" :
            return AnyView(ItemsListView(items: viewModel.series) { serie in
                SerieDetailView(serie: serie)
            } itemView: {serie in
                Text(serie.title)
            }.task {
                await viewModel.getSeries()
            })
        default:
            return AnyView(ItemsListView(items: viewModel.comics) { comic in
                ComicDetailView(comic: comic)
            } itemView: {comic in
                Text(comic.title)
            }.task {
                await viewModel.getComics()
            })
        }
    }
    
    func makePopularItemsView() -> AnyView{
        switch selected{
        case "CHARACTERS" :
            return AnyView( PopularItemsView(items: viewModel.characters) { character in
                CharacterDetailView(character: character)
            } itemView: { character in
                PopularItemView(title: character.name, imageUrl: character.imageUrl, rounded: true)
            }.task {
                await viewModel.getCharacters()
            })
        case "SERIES" :
            return AnyView(PopularItemsView(items: viewModel.series) { serie in
                SerieDetailView(serie: serie)
            } itemView: { serie in
                PopularItemView(title: serie.title, imageUrl: serie.imageUrl)
            }.task {
                await viewModel.getSeries()
            })
        default:
            return AnyView(PopularItemsView(items: viewModel.comics) { comic in
                ComicDetailView(comic: comic)
            } itemView: { comic in
                PopularItemView(title: comic.title, imageUrl: comic.imageUrl)
            }.task {
                await viewModel.getComics()
            })
        }
    }
    
}

class TextFieldObserver : ObservableObject {
    @Published var debouncedText = ""
    @Published var searchText = ""
    
    private var subscriptions = Set<AnyCancellable>()
    
    init() {
        $searchText
            .debounce(for: .seconds(1), scheduler: DispatchQueue.main)
            .sink(receiveValue: { [weak self] t in
                self?.debouncedText = t
            } )
            .store(in: &subscriptions)
    }
}

enum SearchTypeFilters: String, CaseIterable{
    case series = "SERIES"
    case characters = "CHARACTERS"
    case comics = "COMICS"
}

#Preview {
    let coordinator = Coordinator(mock: true)
    return coordinator.makeSearchView().environmentObject(coordinator)
}
