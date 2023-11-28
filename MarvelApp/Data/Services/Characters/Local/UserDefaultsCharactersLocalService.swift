//
//  UserDefaultsCharactersLocalService.swift
//  MarvelApp
//
//  Created by user242581 on 28/11/23.
//

import Foundation

struct UserDefaultsCharactersLocalService : CharactersLocalService {
    private let charactersKey = "characters"
    
    func getCharacters() throws -> [Character] {
        guard let data = UserDefaults.standard.data(forKey: charactersKey) else {
            return []
        }
        return try JSONDecoder().decode([Character].self, from: data)
    }
    
    func saveCharacter(character: Character) throws {
        var characters = try getCharacters()
        characters.append(character)
        let data = try JSONEncoder().encode(characters)
        UserDefaults.standard.set(data, forKey: charactersKey)
    }
    
    func deleteCharacter(characterId: Int) throws{
        var characters = try getCharacters()
        characters.removeAll { char in
            char.id == characterId
        }
        let data = try JSONEncoder().encode(characters)
        UserDefaults.standard.set(data, forKey: charactersKey)
    }

}
