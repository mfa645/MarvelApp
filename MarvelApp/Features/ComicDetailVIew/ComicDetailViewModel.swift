//
//  ComicDetailViewModel.swift
//  MarvelApp
//
//  Created by user242581 on 22/11/23.
//

import Foundation
class ComicDetailViewModel: ObservableObject{
    private let charactersRepository: CharactersRepository
    
    @Published var characters = [Character]()
    
    @Published var showErrorMessage = false
    @Published var isLoading = false
    
    init(charactersRepository: CharactersRepository, showErrorMessage: Bool = false, isLoading: Bool = false) {
        self.charactersRepository = charactersRepository
        self.showErrorMessage = showErrorMessage
        self.isLoading = isLoading
    }
    
    @MainActor
    func getCharacters(comicId:Int) async {
        isLoading = true
        do {

            characters = try await charactersRepository.getCharactersOfComic(comicId: comicId).results
        } catch {
            showErrorMessage = true
        }
        isLoading = false
    }
}
