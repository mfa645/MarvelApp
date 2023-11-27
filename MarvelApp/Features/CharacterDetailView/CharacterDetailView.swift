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
            ScrollView(){
                VStack(spacing:0){
                    HStack{
                        Spacer()
                        VStack{
                            Spacer()
                            AsyncImage(
                                url: URL(string: character.imageUrl)
                            ){image in
                                image.image?.resizable()
                                    .scaledToFit()
                                    .frame(width:200)
                                    .clipShape(.circle)
                            }
                            Text(character.name)
                                .font(.title)
                                .fontWeight(.bold)
                                .padding(.top)
                                .foregroundColor(.white)
                        }.frame(height: 300)
                        Spacer()
                    }
                    .background(Image("marvelWallpaper")
                            .resizable()
                            .scaledToFill()
                            .overlay(.black.opacity(0.7))
                    )
                
                    VStack(alignment: .leading, spacing: 0){
                        Text("DESCRIPTION")
                            .fontWeight(.bold)
                            .font(.headline)
                            .foregroundStyle(.marvelRed)
                            .padding()
                        Text( !character.description.isEmpty ? character.description : "The character's description is unavailable")
                            .padding()
                        
                        HeaderView(text: "COMICS")

                        
                        coordinator.makeHorizontalItemsList(
                            items: viewModel.comics,
                            navigationDestination: {comic in
                                coordinator.makeComicDetailView(comic: comic)},
                            itemView:{comic in
                                coordinator.makeVerticalItem(title: comic.title, imageUrl: comic.imageUrl)}
                        )
                        .task{await viewModel.getComics()}
                        
                        HeaderView(text: "SERIES")
                        
                        coordinator.makeHorizontalItemsList(
                            items: viewModel.series,
                            navigationDestination: {serie in
                                coordinator.makeSerieDetailView(serie: serie)},
                            itemView:{serie in
                                coordinator.makeVerticalItem(title: serie.title, imageUrl: serie.imageUrl)}
                        )
                        .task{await viewModel.getSeries(characterId: character.id)}
                        
                        
                        Spacer()
                }
                    .background(.marvelSecondary.opacity(0.5))
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
