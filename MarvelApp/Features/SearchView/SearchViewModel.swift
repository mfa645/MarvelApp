//
//  SearchViewModel.swift
//  MarvelApp
//
//  Created by user242581 on 13/11/23.
//

import Foundation
class SearchViewModel: ObservableObject {
    private let charactersRepository: CharactersRepository
    @Published var characters = [Character]()
    @Published var showErrorMessage = false
    
    init(charactersRepository: CharactersRepository) {
        self.charactersRepository = charactersRepository
    }
    
    @MainActor
    func getCharacters() async {
        do {
            characters = try await charactersRepository.getCharacters()
        } catch {
            showErrorMessage = true
        }
    }
}
