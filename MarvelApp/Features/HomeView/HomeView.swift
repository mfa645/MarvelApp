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
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithTransparentBackground()
        
        UINavigationBar.appearance().standardAppearance = appearance
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
                    .background(.marvelTertiary.opacity(0.3))
                    
                }
                .task{
                    await viewModel.getSeries()
                    await viewModel.getComics()
                    await viewModel.getEvents()
                }
            }
            .toolbar {

                ToolbarItem(placement: .principal) {
                    Image("marvelLogo").resizable().scaledToFit().scaleEffect(2).tint(.white.opacity(0.7)).padding(.trailing)
                }
            }
            .ignoresSafeArea(edges: .horizontal)
            .ignoresSafeArea(edges: .top)
        }
        .scrollBounceBehavior(.basedOnSize)
    }
    private func makeComicsList() -> some View{
        return coordinator.makeHorizontalItemsList(items: viewModel.comics, navigationDestination:{ comic in
            coordinator.makeComicDetailView(comic: comic)
        }, itemView: { comic in
            VerticalItemView(title: comic.title, imageUrl: comic.imageUrl, rounded: false)
        })
    }
    
    private func makeSeriesList() -> some View{
        return coordinator.makeHorizontalItemsList(items: viewModel.series, navigationDestination:{ serie in
            SerieDetailView(serie: serie)
        }, itemView: { serie in
            VerticalItemView(title: serie.title, imageUrl: serie.imageUrl, rounded: false)
        })
    }
    
    private func makePaginatedTab() -> some View{
        TabView {
            ForEach(viewModel.events) { lastEvent in
                VStack(){
                    Spacer()
                    HStack() {
                        Spacer()
                        VStack{
                            Text(lastEvent.title.uppercased())
                                .foregroundStyle(.white)
                                .font(.headline)
                                .fontWeight(.bold)
                            Text(lastEvent.description)
                                .foregroundStyle(.white)
                                .font(.subheadline)
                                .fontWeight(.bold)
                            Spacer()
                        }.frame(height: 60)
                        Spacer()
                    }
                    .padding()
                    .background(Color.marvelTertiary.opacity(0.4))
                }
                .frame(height:300)
                .background(
                    AsyncImage(url: URL(string: lastEvent.imageUrl)){image in
                        image.image?.resizable()
                            .scaledToFill()
                            .clipped()
                        .overlay(Color.black.opacity(0.40))}
                )
            }
        }
        .frame(height:300)
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

