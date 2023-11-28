//
//  CharacterDetailViewModel.swift
//  MarvelApp
//
//  Created by user242581 on 22/11/23.
//

import Foundation
class CharacterDetailViewModel: ObservableObject{
    private let comicsRepository: ComicsRepository
    private let seriesRepository: SeriesRepository
    private let charactersRepository: CharactersRepository
    
    @Published var comics = [Comic]()
    @Published var series = [Serie]()
    
    
    @Published var showErrorMessage = false
    @Published var isFavourite = false
    @Published var isLoading = false
    
    init(comicsRepository: ComicsRepository, seriesRepository: SeriesRepository, charactersRepository: CharactersRepository) {
        self.comicsRepository = comicsRepository
        self.seriesRepository = seriesRepository
        self.charactersRepository = charactersRepository
    }
    
    @MainActor
    func getSeries(characterId:Int) async {
        isLoading = true
        do {

            series = try await seriesRepository.getSeriesOfCharacter(characterId: characterId).results
        } catch {
            showErrorMessage = true
        }
        isLoading = false
    }
    
    @MainActor
    func getComics(characterId:Int) async {
        isLoading = true
        do {
            comics = try await comicsRepository.getComicsOfCharacter(characterId: characterId).results
        } catch {
            showErrorMessage = true
        }
        isLoading = false
    }
    
    func setIsFavourite(characterId: Int) {
        do{
            let favouriteCharacters = try charactersRepository.getFavouriteCharacters()
            if(favouriteCharacters.contains(where: { character in
                character.id == characterId
            })){
                isFavourite = true
            }
        } catch {
            showErrorMessage = true
        }
    }
    
    func addToFavourites(character:Character){
        do{
           try charactersRepository.saveFavouriteCharacter(character: character)
            isFavourite = true
        } catch {
            showErrorMessage = true
        }
    }    
    func removeFromFavourites(characterId:Int){
        do{
           try charactersRepository.deleteFavouriteCharacter(characterId: characterId)
            isFavourite = false
        } catch {
            showErrorMessage = true
        }
    }
    
}
