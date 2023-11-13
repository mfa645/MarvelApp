//
//  SearchView.swift
//  MarvelApp
//
//  Created by user242581 on 13/11/23.
//

import SwiftUI

struct SearchView: View {
    @StateObject private var viewModel: SearchViewModel
    @EnvironmentObject var coordinator: Coordinator
    
    init(viewModel: SearchViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    @State private var selected = SearchTypeFilters.characters.rawValue
    var body: some View {
        VStack(){
            CustomSegmentedPicker<SearchTypeFilters>(sourcesEnum: SearchTypeFilters.self, selection: $selected)
            
            MostPopularCharactersView(characters: viewModel.characters)
            .task {
               await viewModel.getCharacters()
            }
            .padding(/*@START_MENU_TOKEN@*/EdgeInsets()/*@END_MENU_TOKEN@*/)
            Spacer()
           
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
