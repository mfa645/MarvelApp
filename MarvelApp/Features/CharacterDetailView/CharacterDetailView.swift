//
//  CharacterDetailView.swift
//  MarvelApp
//
//  Created by user242581 on 14/11/23.
//

import AlertToast
import SwiftUI

struct CharacterDetailView: View {
    @EnvironmentObject var coordinator: Coordinator
    @StateObject private var viewModel: CharacterDetailViewModel
    @State private var showFavouriteOperation = false

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
                                    .scaledToFill()
                                    .frame(width:200)
                                    .frame(maxHeight:180)
                                    .clipShape(.circle)
                                    .shadow(color:.black, radius: 10)
                                    .padding(.top, 50)

                            }
                            Text(character.name)
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .shadow(color:.black, radius: 10)
                                .lineLimit(2)
                                .multilineTextAlignment(.center)
                            Spacer()
                        }.frame(height: 340)
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
                            .padding(.horizontal)
                            .padding(.bottom)
                        
                        HeaderView(text: "COMICS")
                            .task{await viewModel.getComics(characterId: character.id)}

                        if(viewModel.comics.isEmpty){
                            Text("No comics availables for this character")
                                .padding(20)
                        }
                        else{
                            coordinator.makeHorizontalItemsList(
                                items: viewModel.comics,
                                navigationDestination: {comic in
                                    coordinator.makeComicDetailView(comic: comic)},
                                itemView:{comic in
                                    coordinator.makeVerticalItem(title: comic.title, imageUrl: comic.imageUrl)}
                            )
                        }

                        HeaderView(text: "SERIES")
                            .task{await viewModel.getSeries(characterId: character.id)}
                        
                        if(viewModel.series.isEmpty){
                            Text("No series availables for this character")
                                .padding(20)
                        } else{
                            coordinator.makeHorizontalItemsList(
                                items: viewModel.series,
                                navigationDestination: {serie in
                                    coordinator.makeSerieDetailView(serie: serie)},
                                itemView:{serie in
                                    coordinator.makeVerticalItem(title: serie.title, imageUrl: serie.imageUrl)}
                            )
                        }
                        Spacer()
                    }
                    .toast(isPresenting: $viewModel.showErrorMessage, alert: {
                        AlertToast(type: .regular, title: " (!) An error ocurred")
                    })
                    .toast(isPresenting: $viewModel.isLoading, alert: {
                        AlertToast(displayMode: .alert, type: .loading)
                    })
                    .toast(isPresenting: $showFavouriteOperation){
                        if(!viewModel.isFavourite){
                            AlertToast(type: .regular, title: "Character removed from favourite list")
                        }
                        else{
                            AlertToast(type: .regular, title: "Character added to favourite list")
                        }
                    }
                    .background(.marvelSecondary.opacity(0.5))
                }
            }
            .onAppear{
                viewModel.setIsFavourite(characterId: character.id)
            }
            .ignoresSafeArea(edges: .top)
            .ignoresSafeArea(edges: .horizontal)
            .toolbar(content: {
                Button(
                    action: {
                        showFavouriteOperation = true
                        if(viewModel.isFavourite){
                            viewModel.removeFromFavourites(characterId: character.id)

                        }else{
                            viewModel.addToFavourites(character: character)
                        }

                    }, label: {
                        Image(systemName: !viewModel.isFavourite ? "bookmark" : "bookmark.fill").tint(.marvelRed).font(.title2)
                    }
                )
            })
        }
    }
}

#Preview {
    let coordinator = Coordinator(mock: true)
    return coordinator.makeCharacterDetailView(character: .example).environmentObject(coordinator)
}
