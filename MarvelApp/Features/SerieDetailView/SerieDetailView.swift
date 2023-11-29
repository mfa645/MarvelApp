//
//  SerieDetailView.swift
//  MarvelApp
//
//  Created by user242581 on 16/11/23.
//

import SwiftUI
import AlertToast

struct SerieDetailView: View {
    @EnvironmentObject var coordinator: Coordinator
    @StateObject private var viewModel: SerieDetailViewModel
    let serie :Serie
    init(viewModel: SerieDetailViewModel, serie: Serie) {
        _viewModel = StateObject(wrappedValue: viewModel)
        self.serie = serie
    }
    
    var body: some View {
        NavigationStack{
            ScrollView{
                VStack(alignment: .leading, spacing:0){
                    ZStack(alignment: .bottom){
                        AsyncImage(
                            url: URL(string: serie.imageUrl)
                        ){image in
                            image.image?.resizable()
                                .scaledToFill()
                                .overlay(.black.opacity(0.1))
                        }
                        HStack{
                            Spacer()
                            Text(serie.title)
                                .font(.title)
                                .fontWeight(.bold)
                                .padding(.top)
                                .foregroundColor(.marvelPrimary.opacity(0.7))
                                .multilineTextAlignment(.center)
                                .lineLimit(3)
                                .shadow(color:.marvelSecondary, radius: 10)

                            Spacer()
                        }
                        .background(Color.marvelTertiary.opacity(0.80))
                    }
                        makeSectionTitle(text: "DESCRIPTION")
                        if let serieDescription = serie.description {
                            Text( !serieDescription.isEmpty ? serieDescription : "The serie's description is unavailable")
                                .padding(.horizontal)
                        }
                    else{
                        Text("No serie description found")
                    }
                    HStack(alignment: .top){
                        
                        VStack(alignment: .center, spacing:0){
                            makeEspecificationTitle(text: "TYPE")
                            makeEspecificationBody(text: serie.type.isEmpty ? "NA" : serie.type)

                            makeEspecificationTitle(text: "RATING")
                            makeEspecificationBody(text: serie.rating.isEmpty ? "NA" : serie.rating)

                        }
                        Spacer()
                        VStack(alignment: .center, spacing: 0){
                            makeEspecificationTitle(text: "START DATE")
                            makeEspecificationBody(text: "\(serie.startYear)")

                            makeEspecificationTitle(text: "END DATE")
                            makeEspecificationBody(text: "\(serie.endYear)")

                        }
                    }
                    .padding(.horizontal, 50)
                    .padding(.vertical)
                    HeaderView(text: "COMICS")
                        .task{await viewModel.getComics(serieId: serie.id)}

                    if(viewModel.comics.isEmpty){
                        Text("No comics availables for this serie")
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
                    
                    HeaderView(text: "CHARACTERS")
                        .task{await viewModel.getCharacters(serieId: serie.id)}
                    
                    if(viewModel.characters.isEmpty){
                        Text("No characters availables for this serie")
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
                .background(.marvelTertiary.opacity(0.4))
                .toast(isPresenting: $viewModel.showErrorMessage, alert: {
                    AlertToast(type: .regular, title: " (!) An error ocurred")
                })
                .toast(isPresenting: $viewModel.isLoading, alert: {
                    AlertToast(displayMode: .alert, type: .loading)
                })
            }
            .ignoresSafeArea(edges: .top)
            .ignoresSafeArea(edges: .horizontal)
        }
    }
    private func makeSectionTitle(text: String)->some View{
        Text(text)
            .fontWeight(.bold)
            .font(.headline)
            .foregroundStyle(.marvelRed)
            .padding()
    }
    private func makeEspecificationTitle(text: String)->some View{
        Text(text)
            .fontWeight(.bold)
            .font(.subheadline)
            .foregroundStyle(.marvelOnTertiary)
            .padding()
    }
    
    private func makeEspecificationBody(text: String)->some View{
        Text(text)
            .multilineTextAlignment(.center)
            .foregroundStyle(.marvelPrimary.opacity(0.8))
    }
    
    
}

#Preview {
    let coordinator = Coordinator(mock: true)
    return coordinator.makeSerieDetailView(serie: .example).environmentObject(coordinator)}
