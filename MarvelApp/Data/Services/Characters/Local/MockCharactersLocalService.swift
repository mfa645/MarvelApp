//
//  MockCharactersLocalService.swift
//  MarvelApp
//
//  Created by user242581 on 28/11/23.
//

import Foundation

class MockCharactersLocalService : CharactersLocalService {
    private var characters = [Character]()
    
    func getCharacters() throws -> [Character] {
        characters
    }
    
    func saveCharacter(character: Character) throws {
        var characters = characters
        characters.append(character)
        self.characters = characters
    }
    
    func deleteCharacter(characterId: Int) throws{
        var characters = characters
        characters.removeAll { char in
            char.id == characterId
        }
        self.characters = characters
    }

}
