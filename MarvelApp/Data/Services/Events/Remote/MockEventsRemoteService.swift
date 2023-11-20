//
//  MockEventsRemoteService.swift
//  MarvelApp
//
//  Created by user242581 on 20/11/23.
//

import Foundation
struct MockEventsRemoteService : EventsRemoteService {
    func getLastEvents() async throws -> [Event] {
        [
            .init(
                id: 1,
                title: "Acts of Vengeance!",
                description: "Loki sets about convincing the super-villains of Earth to attack heroes other than those they normally fight in an attempt to destroy the Avengers to absolve his guilt over inadvertently creating the team in the first place.",
                thumbnail: ["path" : "http://i.annihil.us/u/prod/marvel/i/mg/9/40/51ca10d996b8b","extension" : "jpg"]
            ),
            .init(
                id: 2,
                title: "Age of Apocalypse",
                description: "In a twisted version of the world they knew, the X-Men battle against the eternal mutant Apocalypse as Bishop seeks to repair the timeline. Legion, Xavier's own son, attempts to kill off all of Xavier's enemies; however, when Legion attempts to murder Magneto, Xavier sacrifices his own life to save Magnus. As a result, Magneto casts off his anti-human sentiments and carries on Xavier's dream of peaceful co-existence, thereby founding the X-Men.",
                thumbnail: ["path": "http://i.annihil.us/u/prod/marvel/i/mg/5/e0/51ca0e08a6546",
                            "extension": "jpg"]
            ),
            .init(
                id: 3,
                title: "Age of Ultron",
                description: "In a 10-issue event written by Brian Michael Bendis with art by Bryan Hitch, Carlos Pacheco, Brandon Peterson and more, the heroes of the Marvel Universe have already fallen with the robot Ultron remaking the world in his image. The surviving Avengers, X-Men and others must fight through time and space in the hope of defeating their foe by any means necessary!",
                thumbnail: ["path": "http://i.annihil.us/u/prod/marvel/i/mg/c/10/51ca0fc4c83c8",
                            "extension": "jpg"]
            )
        ]
    }
}
