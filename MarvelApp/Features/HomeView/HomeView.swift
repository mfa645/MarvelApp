//
//  HomeView.swift
//  MarvelApp
//
//  Created by user242581 on 20/11/23.
//

import SwiftUI
import AlertToast

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
                        HeaderView(text: "COMICS")
                        
                        makeComicsList()
                        
                        HeaderView(text: "SERIES")
                        
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
            coordinator.makeSerieDetailView(serie: serie)
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
                                .lineLimit(2)
                            Spacer()
                        }.frame(height: 100)
                        Spacer()
                    }
                    .padding()
                    .background(Color.marvelTertiary.opacity(0.4))
                }
                .frame(height:350)
                .background(
                    AsyncImage(url: URL(string: lastEvent.imageUrl)){image in
                        image.image?.resizable()
                            .scaledToFill()
                            .clipped()
                        .overlay(Color.black.opacity(0.40))}
                )
            }
        }
        .toast(isPresenting: $viewModel.showErrorMessage, alert: {
            AlertToast(type: .regular, title: " (!) An error ocurred")
        })
        .toast(isPresenting: $viewModel.isLoading, alert: {
            AlertToast(displayMode: .alert, type: .loading)
        })
        .frame(height:300)
        .tabViewStyle(PageTabViewStyle())
    }
}
#Preview {
    let coordinator = Coordinator(mock: true)
    return coordinator.makeHomeView().environmentObject(coordinator)
}

