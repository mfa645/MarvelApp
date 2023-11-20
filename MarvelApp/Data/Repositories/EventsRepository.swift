//
//  EventsRepository.swift
//  MarvelApp
//
//  Created by user242581 on 20/11/23.
//

import Foundation
struct EventsRepository {
    private let remoteService: EventsRemoteService
    
    init(remoteService: EventsRemoteService) {
        self.remoteService = remoteService
    }
    
    func getlastEvents() async throws -> [Event] {
        try await remoteService.getLastEvents()
    }
}
