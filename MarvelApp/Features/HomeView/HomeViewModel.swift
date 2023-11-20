//
//  HomeViewModel.swift
//  MarvelApp
//
//  Created by user242581 on 20/11/23.
//

import Foundation
class HomeViewModel : ObservableObject{
    let comicsRepository: ComicsRepository
    let seriesRepository: SeriesRepository
    let eventsRepository: EventsRepository
    
    @Published var events = [Event]()
    @Published var comics = [Comic]()
    @Published var series = [Serie]()
    
    
    @Published var showErrorMessage = false
    @Published var isLoading = false
    
    private var maxPages = false
    private var total = -1
    private var offset = 0
    private var count = -1

    init(comicsRepository: ComicsRepository, seriesRepository: SeriesRepository, eventsRepository: EventsRepository) {
        self.comicsRepository = comicsRepository
        self.seriesRepository = seriesRepository
        self.eventsRepository = eventsRepository
    }
    @MainActor
    func getEvents() async {
        isLoading = true
        do {
            events = try await eventsRepository.getlastEvents()
        } catch {
            showErrorMessage = true
        }
        isLoading = false
    }
    
    @MainActor
    func getSeries(enablePaging: Bool) async {
        if(!enablePaging){
            series.removeAll()
            offset = 0
            maxPages = false
        }
        if(maxPages){
            return
        }
        isLoading = true
        do {

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
    func getComics(enablePaging: Bool) async {
        if(!enablePaging){
            comics.removeAll()
            offset = 0
            maxPages = false
        }
        if(maxPages){
            return
        }
        isLoading = true
        do {
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
    
}
