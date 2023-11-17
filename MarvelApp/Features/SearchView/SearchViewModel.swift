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
    
    private var maxPages = false
    private var total = -1
    private var offset = 0
    private var count = -1
    
    init(charactersRepository: CharactersRepository, comicsRepository: ComicsRepository, seriesRepository: SeriesRepository) {
        self.charactersRepository = charactersRepository
        self.comicsRepository = comicsRepository
        self.seriesRepository = seriesRepository
    }
    
    //MARK: SERIES
    @MainActor
    func getSeries(enablePaging: Bool) async {
        isLoading = true
        do {
            series = try await seriesRepository.getSeries()
        } catch {
            showErrorMessage = true
        }
        isLoading = false
    }
    @MainActor
    func getFilteredSeries(title: String, enablePaging: Bool) async {
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
    func getComics(enablePaging: Bool) async {
        isLoading = true
        do {
            comics = try await comicsRepository.getComics()
        } catch {
            showErrorMessage = true
        }
        isLoading = false
    }
    @MainActor
    func getFilteredComics(title: String, enablePaging: Bool) async {
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
    func getCharacters(enablePaging: Bool) async {
        isLoading = true
        
        do {
            if(!enablePaging){
                characters.removeAll()
                offset = 0
            }
            let charactersResponse = try await charactersRepository.getCharacters(offset: offset)
            total = charactersResponse.total
            offset = charactersResponse.offset
            count = charactersResponse.count
            
            if(total == offset || count == 0){
                maxPages = true
            }
            offset == 0 ? characters = charactersResponse.results : characters.append(contentsOf: charactersResponse.results)
            offset += count
        } catch {
            showErrorMessage = true
        }
        isLoading = false
    }
    
    @MainActor
    func getFilteredCharacters(name: String, enablePaging: Bool) async {
        isLoading = true
        do {
            characters = try await charactersRepository.getFilteredCharacters(name: name).results
        } catch {
            showErrorMessage = true
        }
        isLoading = false
    }
    
}
