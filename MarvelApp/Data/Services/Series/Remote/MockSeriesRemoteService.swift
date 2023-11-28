//
//  MockSeriesRemoteService.swift
//  MarvelApp
//
//  Created by user242581 on 15/11/23.
//

import Foundation
struct MockSeriesRemoteService : SeriesRemoteService {
    func getSeriesOfCharacter(characterId: Int) async throws -> DataResponse<Serie>{
        let series : [Serie] = [
            .init(
                id: 2151,
                title: "Ant-Man (2003) #3",
                thumbnail: ["path" : "http://i.annihil.us/u/prod/marvel/i/mg/6/60/553a60a66f2f6","extension" : "jpg"],
                description: "In the wake of Arno Stark’s crusade against A.I.s, no robot is safe. Fearing of Elsie Dee’s safety in these tumultuous times, Albert, the robot Wolverine, goes to Madripoor to find her…but what he finds is a fight against Madripoor’s criminal underbelly instead! ",
                startYear: 2020,
                endYear: 2021,
                rating: "Rated - T",
                type: "one shot"
            ),
            .init(
                id: 235,
                title: "Official Handbook of the Marvel Universe (2004) #14 (FANTASTIC FOUR)",
                thumbnail: ["path" : "http://i.annihil.us/u/prod/marvel/i/mg/9/d0/51926fde9c18a","extension" : "jpg"],
                description: "In the wake of Arno Stark’s crusade against A.I.s, no robot is safe. Fearing of Elsie Dee’s safety in these tumultuous times, Albert, the robot Wolverine, goes to Madripoor to find her…but what he finds is a fight against Madripoor’s criminal underbelly instead! ",
                startYear: 2020,
                endYear: 2021,
                rating: "Rated - T",
                type: "one shot"
            ),
            .init(
                id: 11,
                title: "Official Handbook of the Marvel Universe (2004) #11 (X-MEN - AGE OF APOCALYPSE)",
                thumbnail: ["path" :  "http://i.annihil.us/u/prod/marvel/i/mg/1/00/51644d6b47668","extension" : "jpg"],
                description: "In the wake of Arno Stark’s crusade against A.I.s, no robot is safe. Fearing of Elsie Dee’s safety in these tumultuous times, Albert, the robot Wolverine, goes to Madripoor to find her…but what he finds is a fight against Madripoor’s criminal underbelly instead! ",
                startYear: 2020,
                endYear: 2021,
                rating: "Rated - T",
                type: "one shot"
            ),
            .init(
                id: 251,
                title: "ULTIMATE X-MEN VOL. 5: ULTIMATE WAR TPB (Trade Paperback)",
                thumbnail: ["path" :  "http://i.annihil.us/u/prod/marvel/i/mg/4/b0/5d939e25a9787","extension" : "jpg"],
                description: "In the wake of Arno Stark’s crusade against A.I.s, no robot is safe. Fearing of Elsie Dee’s safety in these tumultuous times, Albert, the robot Wolverine, goes to Madripoor to find her…but what he finds is a fight against Madripoor’s criminal underbelly instead! ",
                startYear: 2020,
                endYear: 2021,
                rating: "Rated - T",
                type: "one shot"
            ),
            .init(
                id: 346,
                title: "Gun Theory (2003) #3",
                thumbnail: ["path" : "http://i.annihil.us/u/prod/marvel/i/mg/b/40/image_not_available","extension" : "jpg"],
                description: "In the wake of Arno Stark’s crusade against A.I.s, no robot is safe. Fearing of Elsie Dee’s safety in these tumultuous times, Albert, the robot Wolverine, goes to Madripoor to find her…but what he finds is a fight against Madripoor’s criminal underbelly instead! ",
                startYear: 2020,
                endYear: 2021,
                rating: "Rated - T",
                type: "one shot"
            ),.init(
                id: 1,
                title: "Ant-Man (2003) #3",
                thumbnail: ["path" : "http://i.annihil.us/u/prod/marvel/i/mg/6/60/553a60a66f2f6","extension" : "jpg"],
                description: nil,
                startYear: 2020,
                endYear: 2021,
                rating: "",
                type: ""
            )]
        return DataResponse<Serie>(offset: 0, count: 6, total: 6, results: series)

    }
    
    func getSeries(offset: Int) async throws -> DataResponse<Serie> {
        let series : [Serie] = [
            .init(
                id: 2151,
                title: "Ant-Man (2003) #3",
                thumbnail: ["path" : "http://i.annihil.us/u/prod/marvel/i/mg/6/60/553a60a66f2f6","extension" : "jpg"],
                description: "In the wake of Arno Stark’s crusade against A.I.s, no robot is safe. Fearing of Elsie Dee’s safety in these tumultuous times, Albert, the robot Wolverine, goes to Madripoor to find her…but what he finds is a fight against Madripoor’s criminal underbelly instead! ",
                startYear: 2020,
                endYear: 2021,
                rating: "Rated - T",
                type: "one shot"
            ),
            .init(
                id: 235,
                title: "Official Handbook of the Marvel Universe (2004) #14 (FANTASTIC FOUR)",
                thumbnail: ["path" : "http://i.annihil.us/u/prod/marvel/i/mg/9/d0/51926fde9c18a","extension" : "jpg"],
                description: "In the wake of Arno Stark’s crusade against A.I.s, no robot is safe. Fearing of Elsie Dee’s safety in these tumultuous times, Albert, the robot Wolverine, goes to Madripoor to find her…but what he finds is a fight against Madripoor’s criminal underbelly instead! ",
                startYear: 2020,
                endYear: 2021,
                rating: "Rated - T",
                type: "one shot"
            ),
            .init(
                id: 11,
                title: "Official Handbook of the Marvel Universe (2004) #11 (X-MEN - AGE OF APOCALYPSE)",
                thumbnail: ["path" :  "http://i.annihil.us/u/prod/marvel/i/mg/1/00/51644d6b47668","extension" : "jpg"],
                description: "In the wake of Arno Stark’s crusade against A.I.s, no robot is safe. Fearing of Elsie Dee’s safety in these tumultuous times, Albert, the robot Wolverine, goes to Madripoor to find her…but what he finds is a fight against Madripoor’s criminal underbelly instead! ",
                startYear: 2020,
                endYear: 2021,
                rating: "Rated - T",
                type: "one shot"
            ),
            .init(
                id: 251,
                title: "ULTIMATE X-MEN VOL. 5: ULTIMATE WAR TPB (Trade Paperback)",
                thumbnail: ["path" :  "http://i.annihil.us/u/prod/marvel/i/mg/4/b0/5d939e25a9787","extension" : "jpg"],
                description: "In the wake of Arno Stark’s crusade against A.I.s, no robot is safe. Fearing of Elsie Dee’s safety in these tumultuous times, Albert, the robot Wolverine, goes to Madripoor to find her…but what he finds is a fight against Madripoor’s criminal underbelly instead! ",
                startYear: 2020,
                endYear: 2021,
                rating: "Rated - T",
                type: "one shot"
            ),
            .init(
                id: 346,
                title: "Gun Theory (2003) #3",
                thumbnail: ["path" : "http://i.annihil.us/u/prod/marvel/i/mg/b/40/image_not_available","extension" : "jpg"],
                description: "In the wake of Arno Stark’s crusade against A.I.s, no robot is safe. Fearing of Elsie Dee’s safety in these tumultuous times, Albert, the robot Wolverine, goes to Madripoor to find her…but what he finds is a fight against Madripoor’s criminal underbelly instead! ",
                startYear: 2020,
                endYear: 2021,
                rating: "Rated - T",
                type: "one shot"
            ),.init(
                id: 1,
                title: "Ant-Man (2003) #3",
                thumbnail: ["path" : "http://i.annihil.us/u/prod/marvel/i/mg/6/60/553a60a66f2f6","extension" : "jpg"],
                description: "In the wake of Arno Stark’s crusade against A.I.s, no robot is safe. Fearing of Elsie Dee’s safety in these tumultuous times, Albert, the robot Wolverine, goes to Madripoor to find her…but what he finds is a fight against Madripoor’s criminal underbelly instead! ",
                startYear: 2020,
                endYear: 2021,
                rating: "Rated - T",
                type: "one shot"
            ),
            .init(
                id: 2,
                title: "Official Handbook of the Marvel Universe (2004) #14 (FANTASTIC FOUR)",
                thumbnail: ["path" : "http://i.annihil.us/u/prod/marvel/i/mg/9/d0/51926fde9c18a","extension" : "jpg"],
                description: "In the wake of Arno Stark’s crusade against A.I.s, no robot is safe. Fearing of Elsie Dee’s safety in these tumultuous times, Albert, the robot Wolverine, goes to Madripoor to find her…but what he finds is a fight against Madripoor’s criminal underbelly instead! ",
                startYear: 2020,
                endYear: 2021,
                rating: "Rated - T",
                type: "one shot"
            ),
            .init(
                id: 3,
                title: "Official Handbook of the Marvel Universe (2004) #11 (X-MEN - AGE OF APOCALYPSE)",
                thumbnail: ["path" :  "http://i.annihil.us/u/prod/marvel/i/mg/1/00/51644d6b47668","extension" : "jpg"],
                description: "In the wake of Arno Stark’s crusade against A.I.s, no robot is safe. Fearing of Elsie Dee’s safety in these tumultuous times, Albert, the robot Wolverine, goes to Madripoor to find her…but what he finds is a fight against Madripoor’s criminal underbelly instead! ",
                startYear: 2020,
                endYear: 2021,
                rating: "Rated - T",
                type: "one shot"
            ),
            .init(
                id: 4,
                title: "ULTIMATE X-MEN VOL. 5: ULTIMATE WAR TPB (Trade Paperback)",
                thumbnail: ["path" :  "http://i.annihil.us/u/prod/marvel/i/mg/4/b0/5d939e25a9787","extension" : "jpg"],
                description: "In the wake of Arno Stark’s crusade against A.I.s, no robot is safe. Fearing of Elsie Dee’s safety in these tumultuous times, Albert, the robot Wolverine, goes to Madripoor to find her…but what he finds is a fight against Madripoor’s criminal underbelly instead! ",
                startYear: 2020,
                endYear: 2021,
                rating: "Rated - T",
                type: "one shot"
            ),
            .init(
                id: 5,
                title: "Gun Theory (2003) #3",
                thumbnail: ["path" : "http://i.annihil.us/u/prod/marvel/i/mg/b/40/image_not_available","extension" : "jpg"],
                description: "In the wake of Arno Stark’s crusade against A.I.s, no robot is safe. Fearing of Elsie Dee’s safety in these tumultuous times, Albert, the robot Wolverine, goes to Madripoor to find her…but what he finds is a fight against Madripoor’s criminal underbelly instead! ",
                startYear: 2020,
                endYear: 2021,
                rating: "Rated - T",
                type: "one shot"
            )
        ]
        return DataResponse<Serie>(offset: 0, count: 9, total: 9, results: series)
    }
    
    func getFilteredSeries(title: String, offset: Int) async throws -> DataResponse<Serie> {
        let series : [Serie] =
        [
            .init(
                id: 1,
                title: "Ant-Man (2003) #3",
                thumbnail: ["path" : "http://i.annihil.us/u/prod/marvel/i/mg/d/70/4bc69c7e9b9d7","extension" : "jpg"],
                description: "In the wake of Arno Stark’s crusade against A.I.s, no robot is safe. Fearing of Elsie Dee’s safety in these tumultuous times, Albert, the robot Wolverine, goes to Madripoor to find her…but what he finds is a fight against Madripoor’s criminal underbelly instead! ",
                startYear: 2020,
                endYear: 2021,
                rating: "Rated - T",
                type: "one shot"
            ),
            .init(
                id: 2,
                title: "Official Handbook of the Marvel Universe (2004) #14 (FANTASTIC FOUR)",
                thumbnail: ["path" : "http://i.annihil.us/u/prod/marvel/i/mg/9/90/4bc6353e5fc56","extension" : "jpg"],
                description: "In the wake of Arno Stark’s crusade against A.I.s, no robot is safe. Fearing of Elsie Dee’s safety in these tumultuous times, Albert, the robot Wolverine, goes to Madripoor to find her…but what he finds is a fight against Madripoor’s criminal underbelly instead! ",
                startYear: 2020,
                endYear: 2021,
                rating: "Rated - T",
                type: "one shot"
            ),
            .init(
                id: 3,
                title: "Official Handbook of the Marvel Universe (2004) #11 (X-MEN - AGE OF APOCALYPSE)",
                thumbnail: ["path" :  "http://i.annihil.us/u/prod/marvel/i/mg/c/b0/4bc6494ed6eb4","extension" : "jpg"],
                description: "In the wake of Arno Stark’s crusade against A.I.s, no robot is safe. Fearing of Elsie Dee’s safety in these tumultuous times, Albert, the robot Wolverine, goes to Madripoor to find her…but what he finds is a fight against Madripoor’s criminal underbelly instead! ",
                startYear: 2020,
                endYear: 2021,
                rating: "Rated - T",
                type: "one shot"
            ),
            .init(
                id: 4,
                title: "ULTIMATE X-MEN VOL. 5: ULTIMATE WAR TPB (Trade Paperback)",
                thumbnail: ["path" :  "http://i.annihil.us/u/prod/marvel/i/mg/2/f0/4bc6670c80007","extension" : "jpg"],
                description: "In the wake of Arno Stark’s crusade against A.I.s, no robot is safe. Fearing of Elsie Dee’s safety in these tumultuous times, Albert, the robot Wolverine, goes to Madripoor to find her…but what he finds is a fight against Madripoor’s criminal underbelly instead! ",
                startYear: 2020,
                endYear: 2021,
                rating: "Rated - T",
                type: "one shot"
            ),
            .init(
                id: 5,
                title: "Gun Theory (2003) #3",
                thumbnail: ["path" : "http://i.annihil.us/u/prod/marvel/i/mg/c/60/4bc69f11baf75","extension" : "jpg"],
                description: "In the wake of Arno Stark’s crusade against A.I.s, no robot is safe. Fearing of Elsie Dee’s safety in these tumultuous times, Albert, the robot Wolverine, goes to Madripoor to find her…but what he finds is a fight against Madripoor’s criminal underbelly instead! ",
                startYear: 2020,
                endYear: 2021,
                rating: "Rated - T",
                type: "one shot"
            )
        ]
        
        let filteredSeries = series.filter{serie in
            serie.title.starts(with: title)
        }
        return DataResponse<Serie>(offset: 0, count: filteredSeries.count, total: filteredSeries.count, results: filteredSeries)
    }
    
    
}
