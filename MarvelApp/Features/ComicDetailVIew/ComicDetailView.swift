//
//  ComicDetailVIEw.swift
//  MarvelApp
//
//  Created by user242581 on 16/11/23.
//

import SwiftUI

struct ComicDetailView: View {
    @EnvironmentObject var coordinator: Coordinator
    @StateObject private var viewModel: ComicDetailViewModel
    let comic :  Comic
    
    init(viewModel: ComicDetailViewModel, comic: Comic) {
        _viewModel = StateObject(wrappedValue: viewModel)
        self.comic = comic
    }
    
    var body: some View {
        NavigationStack{
            ScrollView{
                VStack(spacing:0){
                    HStack{
                        Spacer()
                        VStack{
                            Spacer()
                            AsyncImage(
                                url: URL(string: comic.imageUrl)
                            ){image in
                                image.image?.resizable()
                                    .scaledToFit()
                                    .frame(width:200)
                            }
                            Text(comic.title)
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
                        Text( !comic.title.isEmpty ? comic.title : "The character's description is unavailable")
                            .padding(.horizontal)
                            .padding(.bottom)
                        
                        HeaderView(text: "CHARACTERS")
                            .task{await viewModel.getCharacters(comicId: comic.id)}
                        
                        if(viewModel.characters.isEmpty){
                            Text("No characters availables for this comic")
                                .padding(20)
                        }
                        else{
                            coordinator.makeHorizontalItemsList(
                                items: viewModel.characters,
                                navigationDestination: {character in
                                    coordinator.makeCharacterDetailView(character: character)},
                                itemView:{character in
                                    coordinator.makeVerticalItem(title: character.name, imageUrl: character.imageUrl, rounded: true)}
                            )
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    let coordinator = Coordinator(mock: true)
    return coordinator.makeComicDetailView(comic: .example).environmentObject(coordinator)}
