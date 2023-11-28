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
    func getSeries() async {
        isLoading = true
        do {
            series = try await seriesRepository.getSeries(offset : 10).results
        } catch {
            showErrorMessage = true
        }
        isLoading = false
    }    
    @MainActor
    func getComics() async {
        isLoading = true
        do {
            comics = try await comicsRepository.getComics(offset : 10).results
        } catch {
            showErrorMessage = true
        }
        isLoading = false
    }
    
}
