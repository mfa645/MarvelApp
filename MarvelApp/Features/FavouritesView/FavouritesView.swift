//
//  FavouritesView.swift
//  MarvelApp
//
//  Created by user242581 on 28/11/23.
//

import SwiftUI
import AlertToast

struct FavouritesView: View {
    @EnvironmentObject var coordinator: Coordinator
    @StateObject private var viewModel: FavouritesViewModel
    
    @State private var currentIndex: Int = 0
    @GestureState private var dragOffset: CGFloat = 0
    
    init(viewModel: FavouritesViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        NavigationStack{
            Text("Store your favourite characters here !")
                .bold()
                .font(.title3)
                .toolbar{
                    ToolbarItem(placement: .principal) {
                        Image("marvelLogo").resizable().renderingMode(.template).scaledToFit().scaleEffect(2).foregroundStyle(.marvelRed.opacity(0.7)).padding(.trailing)
                    }
                }
            VStack(){
                Spacer()
                VStack{
                    if(!viewModel.characters.isEmpty){
                        CustomCarousel(
                            index: $currentIndex,
                            items: viewModel.characters,
                            navigationDestination: { character in
                                coordinator.makeCharacterDetailView(character: character)
                            },
                            cardPadding: 150) { character, cardSize in
                                FavouriteCard(character: character, cardSize: cardSize)
                        }
                    } else {
                        Text("No characters added!")
                            .font(.title3)
                        Spacer()
                        Image("spiderman").resizable().scaledToFit().foregroundStyle(.marvelRed.opacity(0.7)).padding(.trailing)
                        Spacer()
                    }
                }.frame(height: 500)
                    .onAppear{
                        viewModel.getCharacters()
                    }
                Spacer()
            }
            .ignoresSafeArea()
            .padding(.top)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background{
                GeometryReader{ proxy in
                    LinearGradient(colors: [.clear, .marvelSecondary,.marvelTertiary], startPoint: .top, endPoint: .bottom)
                }
                .ignoresSafeArea()

            }
            .toast(isPresenting: $viewModel.isLoading, alert: {
                AlertToast(displayMode: .alert, type: .loading)
            })
            .toast(isPresenting: $viewModel.showErrorMessage, alert: {
                AlertToast(type: .regular, title: " (!) An error ocurred")
            })
        }
    }
}

#Preview {
    let coordinator = Coordinator(mock: true)
    return coordinator.makeFavouritesView().environmentObject(coordinator)
}
