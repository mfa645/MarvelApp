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
                    HStack(alignment: .top){
                            AsyncImage(
                                url: URL(string: comic.imageUrl)
                            ){image in
                                image.image?.resizable()
                                    .scaledToFit()
                                    .frame(width:150)
                                    .shadow(color: .black, radius: 10)
                            }
                        VStack(alignment:.leading, spacing: 10){
                            Text(comic.title)
                                .font(.title2)
                                .fontWeight(.bold)
                                .padding(.top)
                                .foregroundColor(.white)
                                .shadow(color:.black,radius: 10)
                            makeSectionTitle(text: "\(comic.pageCount) Pages", systemNameImage: "book.pages")
                            makeSectionTitle(text: "Format: \(!comic.format.isEmpty ? comic.format : "NA")", systemNameImage: "text.book.closed")
                        }
                        Spacer()
                    }
                    .padding(.horizontal)
                    .padding(.top, 50)
                    .padding(.bottom, 20)
                    .background(Image("marvelWallpaper")
                        .resizable()
                        .scaledToFill()
                        .overlay(Color.red.opacity(0.65))
                    )
                    
                    VStack(alignment: .leading, spacing: 0){
                        Text("DESCRIPTION")
                            .fontWeight(.bold)
                            .font(.headline)
                            .foregroundStyle(.marvelRed)
                            .padding()
                        if(!comic.variantDescription.isEmpty){
                            Text(comic.variantDescription)
                                .fontWeight(.bold)
                                .font(.headline)
                                .foregroundStyle(.marvelPrimary.opacity(0.5))
                                .padding(.horizontal)
                                .padding(.bottom,5)
                        }
                        if let description = comic.description{
                            Text( !description.isEmpty ? description : "The comic's description is unavailable")
                                .padding(.horizontal)
                                .padding(.bottom,40)
                        }else{
                            Text("No comic description found")
                        }
                        
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
                    .background(.marvelSecondary.opacity(0.5))

                }
            }
            .ignoresSafeArea(edges: .top)
            .ignoresSafeArea(edges: .horizontal)
        }

    }
    private func makeSectionTitle(text: String, systemNameImage:String)->some View{
        Label(
            title: { Text(text)
                    .foregroundColor(.white)
                    .fontWeight(.bold) },
            icon: { Image(systemName: systemNameImage).tint(.white) }
        )
    }
}

#Preview {
    let coordinator = Coordinator(mock: true)
    return coordinator.makeComicDetailView(comic: .example).environmentObject(coordinator)}
