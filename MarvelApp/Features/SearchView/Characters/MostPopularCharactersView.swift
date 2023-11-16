//
//  MostPopularCharactersView.swift
//  MarvelApp
//
//  Created by user242581 on 13/11/23.
//

import SwiftUI
struct MostPopularCharactersView: View {
    @EnvironmentObject var coordinator: Coordinator
    let characters: [Character]
    init(characters: [Character]) {
        self.characters = characters
    }
    
    var body: some View {
        NavigationStack{
            ScrollView(.horizontal){
                HStack(alignment: .top){
                    ForEach(characters) { character in
                        VStack{
                            AsyncImage(
                                url: URL(string: character.imageURL)
                            ){image in
                                image.image?.resizable().scaledToFill()
                            }.clipShape(Circle())
                                .frame(width: 100,height: 100)
                          Text(character.name)
                        }.padding()
                    }
                }
            }
        }.frame(height: 150)
    }
}

#Preview {
    return MostPopularCharactersView(characters: [.example,.example,.example,.example,.example]).padding()
}
