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
        if(maxPages){
            isLoading = false
            print(maxPages)

            return
        }
        do {
            if(!enablePaging){
                series.removeAll()
                offset = 0
                maxPages = false
            }
            let seriesResponse = try await seriesRepository.getSeries(offset : offset)
            total = seriesResponse.total
            offset = seriesResponse.offset
            count = seriesResponse.count
            
            if(total == offset || count == 0){
                maxPages = true
            }
            offset == 0 ? series = seriesResponse.results : series.append(contentsOf: seriesResponse.results)
            offset += count
        } catch {
            showErrorMessage = true
        }
        isLoading = false
    }
    @MainActor
    func getFilteredSeries(title: String, enablePaging: Bool) async {
        isLoading = true
        if(!enablePaging){
            series.removeAll()
            offset = 0
            maxPages = false
        }
        
        if(maxPages){
            isLoading = false
            return
        }
        do {
            let seriesResponse = try await seriesRepository.getFilteredSeries(title: title, offset: offset)
            total = seriesResponse.total
            offset = seriesResponse.offset
            count = seriesResponse.count
            
            if(total == offset || count == 0){
                maxPages = true
            }
            offset == 0 ? series = seriesResponse.results : series.append(contentsOf: seriesResponse.results)
            offset += count
        } catch {
            showErrorMessage = true
        }
        isLoading = false
    }
    
    //MARK: COMICS
    @MainActor
    func getComics(enablePaging: Bool) async {
        isLoading = true
        if(maxPages){
            isLoading = false
            return
        }
        do {
            if(!enablePaging){
                comics.removeAll()
                offset = 0
                maxPages = false
            }
            let comicsResponse = try await comicsRepository.getComics(offset : offset)
            total = comicsResponse.total
            offset = comicsResponse.offset
            count = comicsResponse.count
            
            if(total == offset || count == 0){
                maxPages = true
            }
            offset == 0 ? comics = comicsResponse.results : comics.append(contentsOf: comicsResponse.results)
            offset += count
        } catch {
            showErrorMessage = true
        }
        isLoading = false
    }
    
    @MainActor
    func getFilteredComics(title: String, enablePaging: Bool) async {
        isLoading = true
        if(maxPages){
            isLoading = false
            return
        }
        do {
            if(!enablePaging){
                comics.removeAll()
                offset = 0
                maxPages = false
            }
            let comicsResponse = try await comicsRepository.getFilteredComics(title: title, offset: offset)
            total = comicsResponse.total
            offset = comicsResponse.offset
            count = comicsResponse.count
            
            if(total == offset || count == 0){
                maxPages = true
            }
            offset == 0 ? comics = comicsResponse.results : comics.append(contentsOf: comicsResponse.results)
            offset += count
        }  catch{
            showErrorMessage = true
        }
        isLoading = false
    }
    
    
    //MARK: CHARACTERS
    @MainActor
    func getCharacters(enablePaging: Bool) async {
        isLoading = true
        if(maxPages){
            isLoading = false
            return
        }
        do {
            if(!enablePaging){
                characters.removeAll()
                offset = 0
                maxPages = false
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
        if(maxPages){
            isLoading = false
            return
        }
        do{
            if(!enablePaging){
                characters.removeAll()
                offset = 0
                maxPages = false
            }
            let charactersResponse = try await charactersRepository.getFilteredCharacters(name: name, offset: offset)
            total = charactersResponse.total
            offset = charactersResponse.offset
            count = charactersResponse.count
            
            if(total == offset || count == 0){
                maxPages = true
            }
            offset == 0 ? characters = charactersResponse.results : characters.append(contentsOf: charactersResponse.results)
            offset += count
        }catch {
            showErrorMessage = true
        }
        isLoading = false
    }
}
