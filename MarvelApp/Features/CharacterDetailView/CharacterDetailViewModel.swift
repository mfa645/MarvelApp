//
//  CharacterDetailViewModel.swift
//  MarvelApp
//
//  Created by user242581 on 22/11/23.
//

import Foundation
class CharacterDetailViewModel: ObservableObject{
    private let comicsRepository: ComicsRepository
    private let seriesRepository: SeriesRepository
    
    @Published var comics = [Comic]()
    @Published var series = [Serie]()
    
    @Published var showErrorMessage = false
    @Published var isLoading = false
    
    init(comicsRepository: ComicsRepository, seriesRepository: SeriesRepository) {
        self.comicsRepository = comicsRepository
        self.seriesRepository = seriesRepository
    }
    
    @MainActor
    func getSeries(characterId:Int) async {
        isLoading = true
        do {

            series = try await seriesRepository.getSeriesOfCharacter(characterId: characterId).results
        } catch {
            showErrorMessage = true
        }
        isLoading = false
    }
    
    @MainActor
    func getComics(characterId:Int) async {
        isLoading = true
        do {

            comics = try await comicsRepository.getComicsOfCharacter(characterId: characterId).results
        } catch {
            showErrorMessage = true
        }
        isLoading = false
    }
    
}
