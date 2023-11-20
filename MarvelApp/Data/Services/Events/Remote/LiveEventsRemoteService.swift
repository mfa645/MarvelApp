//
//  LiveEventsRemoteService.swift
//  MarvelApp
//
//  Created by user242581 on 20/11/23.
//

import Foundation

struct LiveEventsRemoteService: EventsRemoteService {
        private let networkClient: NetworkClient

        init(networkClient: NetworkClient) {
            self.networkClient = networkClient
        }
        
        func getLastEvents() async throws -> [Event] {
            let response: APIResponse<Event> = try await networkClient.get(url: "\(NetworkConstants.eventsUrl)?ts=\(NetworkConstants.ts)&apikey=\(NetworkConstants.apikey)&hash=\(NetworkConstants.hash)&limit=3&orderBy=-startDate")
            return response.data.results
        }
}
