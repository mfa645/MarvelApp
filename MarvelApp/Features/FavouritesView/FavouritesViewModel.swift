//
//  FavouritesViewModel.swift
//  MarvelApp
//
//  Created by user242581 on 28/11/23.
//

import Foundation
class FavouritesViewModel : ObservableObject{
    private let charactersRepository: CharactersRepository
    
    @Published var characters = [Character]()
    
    @Published var showErrorMessage = false
    @Published var isLoading = false
    
    init(charactersRepository: CharactersRepository) {
        self.charactersRepository = charactersRepository
    }
    
    @MainActor
    func getCharacters() {
        isLoading = true
        do {
            characters = try charactersRepository.getFavouriteCharacters()
        } catch {
            showErrorMessage = true
        }
        isLoading = false
    }
}
