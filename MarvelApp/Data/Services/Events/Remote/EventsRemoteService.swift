//
//  EventsRemoteService.swift
//  MarvelApp
//
//  Created by user242581 on 20/11/23.
//

import Foundation
protocol EventsRemoteService{
    func getLastEvents() async throws -> [Event]
}
