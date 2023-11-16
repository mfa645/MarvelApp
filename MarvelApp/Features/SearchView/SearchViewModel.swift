//
//  SearchViewModel.swift
//  MarvelApp
//
//  Created by user242581 on 13/11/23.
//

import Foundation
import Combine

class SearchViewModel: ObservableObject {
    private let charactersRepository: CharactersRepository
    private let comicsRepository: ComicsRepository
    private let seriesRepository: SeriesRepository
    
    @Published var characters = [Character]()
    @Published var comics = [Comic]()
    @Published var series = [Serie]()
    
    
    @Published var showErrorMessage = false
    @Published var isLoading = false
    
    init(charactersRepository: CharactersRepository, comicsRepository: ComicsRepository, seriesRepository: SeriesRepository) {
        self.charactersRepository = charactersRepository
        self.comicsRepository = comicsRepository
        self.seriesRepository = seriesRepository
    }
    
    //MARK: SERIES
    @MainActor
    func getSeries() async {
        isLoading = true
        do {
            series = try await seriesRepository.getSeries()
        } catch {
            showErrorMessage = true
        }
        isLoading = false
    }
    @MainActor
    func getFilteredSeries(title: String) async {
        isLoading = true
        do {
            series = try await seriesRepository.getFilteredSeries(title: title)
        } catch {
            showErrorMessage = true
        }
        isLoading = false
    }
    
    //MARK: COMICS
    @MainActor
    func getComics() async {
        isLoading = true
        do {
            comics = try await comicsRepository.getComics()
        } catch {
            showErrorMessage = true
        }
        isLoading = false
    }
    @MainActor
    func getFilteredComics(title: String) async {
        isLoading = true
        do {
            comics = try await comicsRepository.getFilteredComics(title: title)
        } catch {
            showErrorMessage = true
        }
        isLoading = false
    }
    
    
    //MARK: CHARACTERS
    @MainActor
    func getCharacters() async {
        isLoading = true
        do {
            characters = try await charactersRepository.getCharacters()
        } catch {
            showErrorMessage = true
        }
        isLoading = false
    }
    
    @MainActor
    func getFilteredCharacters(name: String) async {
        isLoading = true
        do {
            characters = try await charactersRepository.getFilteredCharacters(name: name)
        } catch {
            showErrorMessage = true
        }
        isLoading = false
    }
    
}
