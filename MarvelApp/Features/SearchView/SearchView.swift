//
//  SearchView.swift
//  MarvelApp
//
//  Created by user242581 on 13/11/23.
//

import SwiftUI

struct SearchView: View {
    @StateObject private var viewModel: SearchViewModel
    @State private var stringFilter: String = ""
    @EnvironmentObject var coordinator: Coordinator
    
    init(viewModel: SearchViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    @State private var selected = SearchTypeFilters.characters.rawValue
    var body: some View {
        NavigationStack {
            VStack(spacing:30){
                CustomSegmentedPicker<SearchTypeFilters>(sourcesEnum: SearchTypeFilters.self, selection: $selected)
                
                MostPopularCharactersView(characters: viewModel.characters)
                    .task {
                        await viewModel.getCharacters()
                    }
                VStack{
                    CustomSearchBar(
                        searchFilter: $stringFilter,
                        searchPlaceholder: "Search all Characters",
                        onCancelClicked: {stringFilter = ""}
                    )
                    .padding()
                    List{
                        ForEach(viewModel.characters,id: \.id ) { character in
                            NavigationLink(destination: CharacterDetailView(character: character)){
                                Text(character.name)
                            }
                        }.listRowBackground(Color(.marvelSecondary))
                    }
                    .listStyle(.plain)
                    .padding(.bottom)
                }.background(.marvelSecondary)
                
            }
        }
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
