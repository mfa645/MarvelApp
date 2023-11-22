//
//  CharacterDetailView.swift
//  MarvelApp
//
//  Created by user242581 on 14/11/23.
//

import SwiftUI

struct CharacterDetailView: View {
    @EnvironmentObject var coordinator: Coordinator
    @StateObject private var viewModel: CharacterDetailViewModel
    
    let character : Character
    init(viewModel: CharacterDetailViewModel, character: Character) {
        _viewModel = StateObject(wrappedValue: viewModel)
        self.character = character
    }
    
    var body: some View {
        NavigationStack{
            ScrollView{
                VStack{
                    HStack{
                        VStack{
                            AsyncImage(
                                url: URL(string: character.imageUrl)
                            ){image in
                                image.image?.resizable().scaledToFit().frame(width:50).clipped()
                            }
                        }.frame(height: 300)

                    }.background(AsyncImage(
                        url: URL(string: character.imageUrl)
                    ){image in
                        image
                            .image?
                            .resizable()
                            .scaledToFill()
                            .clipped().overlay(.red.opacity(0.5))
                    })
                }
            }
            .ignoresSafeArea(edges: .top)
            .ignoresSafeArea(edges: .horizontal)
        }
    }
}

#Preview {
    let coordinator = Coordinator(mock: true)
    return coordinator.makeCharacterDetailView(character: .example).environmentObject(coordinator)
}
