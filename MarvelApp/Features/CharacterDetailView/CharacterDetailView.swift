//
//  CharacterDetailView.swift
//  MarvelApp
//
//  Created by user242581 on 14/11/23.
//

import SwiftUI

struct CharacterDetailView: View {
    let character : Character
    var body: some View {
        Text(character.name)
    }
}

#Preview {
    CharacterDetailView(character: .example)
}
