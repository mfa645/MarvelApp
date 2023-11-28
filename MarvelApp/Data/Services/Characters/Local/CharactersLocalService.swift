//
//  CharactersLocalService.swift
//  MarvelApp
//
//  Created by user242581 on 28/11/23.
//

import Foundation

protocol CharactersLocalService {
    func getCharacters() throws -> [Character]
    func saveCharacter(character: Character) throws
    func deleteCharacter(characterId: Int) throws
}
