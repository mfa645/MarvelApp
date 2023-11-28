//
//  SerieDetailViewModel.swift
//  MarvelApp
//
//  Created by user242581 on 22/11/23.
//

import Foundation
class SerieDetailViewModel: ObservableObject{
    private let comicsRepository: ComicsRepository
    private let charactersRepository: CharactersRepository
    
    @Published var comics = [Comic]()
    @Published var characters = [Character]()
    
    @Published var showErrorMessage = false
    @Published var isLoading = false
    
    init(comicsRepository: ComicsRepository, charactersRepository: CharactersRepository) {
        self.comicsRepository = comicsRepository
        self.charactersRepository = charactersRepository
    }
    
    @MainActor
    func getCharacters(serieId:Int) async {
        isLoading = true
        do {

            characters = try await charactersRepository.getCharactersOfSerie(serieId: serieId).results
        } catch {
            showErrorMessage = true
        }
        isLoading = false
    }
    
    @MainActor
    func getComics(serieId:Int) async {
        isLoading = true
        do {

            comics = try await comicsRepository.getComicsOfSerie(serieId: serieId).results
        } catch {
            showErrorMessage = true
        }
        isLoading = false
    }
    
}
