//
//  HomeView.swift
//  MarvelApp
//
//  Created by user242581 on 20/11/23.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var coordinator: Coordinator
    @StateObject private var viewModel: HomeViewModel
    
    init(viewModel: HomeViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    var body: some View {
        NavigationStack{
            ScrollView{
                VStack(alignment: .leading, spacing:0){
                    makePaginatedTab()
                    
                    VStack{
                        makeSectionHeader(text: "COMICS")
                        
                        makeComicsList()
                        
                        makeSectionHeader(text: "SERIES")
                        
                        makeSeriesList()
                    }
                    .background(.marvelSecondary.opacity(0.3))
                    
                }
                .task{
                    await viewModel.getSeries()
                    await viewModel.getComics()
                    await viewModel.getEvents()
                }
            }
        }.scrollBounceBehavior(.basedOnSize)
    }
    private func makeComicsList() -> some View{
        return coordinator.makePopularItemsView(items: viewModel.comics, navigationDestination:{ comic in
            coordinator.makeComicDetailView(comic: comic)
        }, itemView: { comic in
            VerticalItemView(title: comic.title, imageUrl: comic.imageUrl, rounded: false)
        })
    }
    
    private func makeSeriesList() -> some View{
        return coordinator.makePopularItemsView(items: viewModel.series, navigationDestination:{ serie in
            SerieDetailView(serie: serie)
        }, itemView: { serie in
            VerticalItemView(title: serie.title, imageUrl: serie.imageUrl, rounded: false)
        })
    }
    
    private func makePaginatedTab() -> some View{
        TabView {
            ForEach(viewModel.events) { lastEvent in
                VStack{
                    ZStack(alignment: .bottom) {
                        AsyncImage(url: URL(string: lastEvent.imageUrl)){image in
                            image.image?.resizable()
                                .scaledToFill()
                                .clipped()
                                .overlay(Color.black.opacity(0.15))
                        }
                        HStack {
                            Spacer()
                            Text(lastEvent.title)
                                .foregroundColor(.white)
                                .font(.title)
                                .fontWeight(.bold)
                                .padding()
                            Spacer()
                        }.background(Color.marvelTertiary.opacity(0.9))
                    }
                }
            }
        }
        .frame(height:400, alignment: .top)
        .tabViewStyle(PageTabViewStyle())
    }
    
    private func makeSectionHeader(text: String) -> some View{
        HStack {
            Text(text)
                .font(.headline)
                .foregroundStyle(.marvelPrimary)
                .bold()
            Spacer()
            NavigationLink {
                coordinator.makeSearchView(selected: text == "COMICS" ? SearchTypeFilters.comics.rawValue : SearchTypeFilters.series.rawValue)
            } label: {
                Label(
                    title: { Text("VIEW ALL").font(.subheadline) },
                    icon: { Image(systemName: "chevron.right.2").foregroundStyle(.marvelRed).font(.footnote) }
                )
                .labelStyle(TrailingIconLabelStyle())
                .bold()
            }.foregroundStyle(.marvelPrimary)
        }
        .padding()
        .background(.marvelSecondary)
    }
}
#Preview {
    let coordinator = Coordinator(mock: true)
    return coordinator.makeHomeView().environmentObject(coordinator)
}

